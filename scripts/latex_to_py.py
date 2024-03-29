import argparse
import os
import sys
import re

try:
    sys.path.index(os.getcwd()) 
except ValueError:
    sys.path.append(os.getcwd()) 

from make_dependency import get_dependencies

worksheet_dest = 'made'

def generate_file(file_name, file_paths, solution=False):
	file = []
	for file_path in file_paths:
		with open(file_path, 'r', encoding="UTF-8") as f:
			start = False
			start_sol = False
			num_lines_since_start = 0
			for line in f.read().split('\n'):
				if re.search(r'\\begin\{\s*solution\s*\}', line):
					start_sol = True
				if re.search(r'\\end\{\s*solution\s*\}', line):
					start_sol = False
				if re.search(r'\\begin\{\s*lstlisting\s*\}', line):
					start = True
					num_lines_since_start = 0
				elif re.search(r'\\end\{\s*lstlisting\s*\}', line):
					start = False
				elif solution and start and "_____" in line:
					start = False
					for _ in range(num_lines_since_start):
						file.pop()
				elif start and (not start_sol or solution) and not re.match(r'\s*%', line):
					file.append(line)
					num_lines_since_start += 1
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
	file_paths = get_dependencies(args.input_file)
	file_paths = [p for p in file_paths if '/text/' not in p and p[-4:] == '.tex']
	base_name = os.path.basename(args.input_file)
	if args.solution:
		sol_name = base_name.replace('.tex', '_sol.py')
		generate_file(os.path.join(worksheet_dest, sol_name), file_paths, solution=True)
	else: 
		out_file = base_name.replace('.tex', '.py')
		generate_file(os.path.join(worksheet_dest, out_file), file_paths)
	
