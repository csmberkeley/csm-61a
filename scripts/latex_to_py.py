import argparse
import os
import sys

try:
    sys.path.index(os.getcwd()) 
except ValueError:
    sys.path.append(os.getcwd()) 

from make_dependency import get_dependencies

#path_to_files = ['control/code/wears_jacket.py', 'control/code/wears_jacket_with_if.py', 'control/code/is_prime.py', ]
prefix = '../../topics'
worksheet_source = 'src/su22'

def generate_file(file_name, file_paths, solution=False):
	file = []
	for file_path in file_paths:
		with open(file_path, 'r') as f:
			start = False
			start_sol = False
			for line in f.read().split('\n'):
				if line.startswith(r'\begin{solution}'):
					start_sol = True
				if line == r'\begin{lstlisting}':
					start = True
				elif line == r'\end{lstlisting}':
					start = False
				elif start and (start_sol == solution):
					file.append(line)
		file.append("\n")
	with open(file_name, 'w') as f:
		f.write('\n'.join(file) + '\n')
		

if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	# parser.add_argument('-o', '--out_file', type=str,
	#                     help='output file')
	parser.add_argument('-f','--input_file', type=str, help='input file e.g. mentor05.tex')
	parser.add_argument('-s', "--solution", action="store_true", help="Create Solution files too")
	args = parser.parse_args()
	file_paths = get_dependencies(os.path.join(worksheet_source, args.input_file))
	file_paths = [p for p in file_paths if '/text/' not in p]
	out_file = args.input_file.replace('.tex', '.py')
	generate_file(os.path.join(worksheet_source, out_file), file_paths)
	if args.solution:
		sol_name = out_file.replace('.py', '_sol.py')
		generate_file(os.path.join(worksheet_source, sol_name), file_paths, solution=True)
