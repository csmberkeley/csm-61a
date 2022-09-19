import argparse
import os
import sys

try:
    sys.path.index(os.getcwd()) 
except ValueError:
    sys.path.append(os.getcwd()) 

from make_dependency import get_dependencies

worksheet_dest = 'made'

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
	file_paths = get_dependencies(args.input_file)
	file_paths = [p for p in file_paths if '/text/' not in p and p[-4:] == '.tex']
	base_name = os.path.basename(args.input_file)
	if args.solution:
		sol_name = base_name.replace('.tex', '_sol.py')
		generate_file(os.path.join(worksheet_dest, sol_name), file_paths, solution=True)
	else: 
		out_file = base_name.replace('.tex', '.py')
		generate_file(os.path.join(worksheet_dest, out_file), file_paths)
	
