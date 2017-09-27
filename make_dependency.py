"""
make_dependency.py

Generates Makefile dependencies for a given file, based on the
LaTeX include directives it uses. By using auto-dependencies,
the main Makefile can better detect when a target needs to be rebuilt.

This script should not have be called manually by users. It is intended
for use as a utility in Makefiles for auto-dependency generation
(similar to auto-dependencies that are generated by gcc).

Once all includes have been scanned, a dependency file
is created. This dependency file can be included by Makefiles.
"""

import os
import re

USAGE = """
usage: python3 {0} TARGET SRC DESTINATION

Generates Makefile dependency files for source files by searching for
LaTeX include directives.
"""

def make_dep_file(target, dependencies):
    """Returns the contents of a dependency file.

    PARAMETERS:
    target       -- str; Makefile target that requires dependencies.
    dependencies -- list of str; list of dependencies.
    assets       -- dict; keys are target names for assets, values
                    are actual asset locations on the filesystem.
    phony        -- str or None; if str, this denotes a convenient
                    phony target that depends on assets. If None,
                    the phony target is omitted from the dependency
                    file.

    RETURNS:
    str; the contents to write to a dependency file.
    """
    dep_format = '{0}: {1}'
    deps = []
    dependencies = set(dependencies)

    targets = [
        os.path.join('..', 'published', 'disc', target + '.pdf'),
        os.path.join('..', 'published', 'disc', target + '_sol.pdf'),
    ]

    # Add source file dependencies.
    for full_target in targets:
        deps.append(dep_format.format(full_target, ' '.join(dependencies)))

    return '\n\n'.join(deps)

re_subimport = re.compile(r"\\subimport\{(.+?)\}\{(.+?)\}")
re_includegraphics = re.compile(r"""
(?:
    \\includegraphics |
    \\lstinputlisting
)
\{(.+?)\}
""", re.X)

def get_dependencies(filepath):
    """Recursively retrieve dependencies from the specified filepath.

    PARAMETERS:
    filepath -- str; path to source file. Expected to be expressed
                relative to this script.

    This function follows included filepaths recursively to
    fetch more dependencies.

    RETURNS:
    list of str; list of dependencies.
    """
    dirname = os.path.dirname(filepath)
    file_contents = read_file(filepath)

    # Convert paths to be relative to this script.
    dependencies = re_subimport.findall(file_contents)
    for i in range(len(dependencies)):
        dep = os.path.normpath(os.path.join(*dependencies[i]))
        if os.path.exists(os.path.join(dirname, dep)):
            dependencies[i] = os.path.join(dirname, dep)
        else:
            dependencies[i] = dep

    # Recursively fetch more dependencies.
    for dependency in dependencies[:]:
        recursive_deps = get_dependencies(dependency)
        dependencies.extend(recursive_deps)

    for graphic in re_includegraphics.findall(file_contents):
        dependencies.append(os.path.join(dirname, graphic))

    return dependencies

#############
# Utilities #
#############

def read_file(filepath):
    with open(filepath, 'r') as f:
        return f.read()

def write_file(filepath, text):
    dirname = os.path.dirname(filepath)
    if not os.path.exists(dirname):
        os.makedirs(dirname)
    with open(filepath, 'w') as f:
        f.write(text)

def main(args):
    if len(args) != 4:
        print(USAGE.format(args[0]))
        exit(1)
    _, target, src, destination = args
    destination = os.path.join(destination, src) + '.d'
    dependencies = get_dependencies(src)
    write_file(destination, make_dep_file(target, dependencies))

if __name__ == '__main__':
    import sys
    main(sys.argv)