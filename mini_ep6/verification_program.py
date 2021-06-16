import sys
import subprocess

import numpy as np

args = sys.argv
exe_path = sys.argv[1]
n_tests = int(sys.argv[-1])

print(n_tests)
test_checks = []
for i in range(n_tests):
    random_permutation = np.random.permutation(range(1, 101))
    random_permutation_args = [f'{n}' for n in random_permutation]
    sleep_sort_args = [exe_path] + random_permutation_args

    result = subprocess.run(sleep_sort_args, stdout=subprocess.PIPE).stdout.decode('utf-8')

    result_lst = result.split(' ')[:-1]
    result_lst = list(map(int, result_lst))

    check = all(result_lst[i] < result_lst[i + 1] for i in range(len(result_lst) - 1))

    test_checks.append(check)

print(f'{sum(test_checks)} / {len(test_checks)}')
if sum(test_checks) / len(test_checks) < 0.9:
    print('Not OK')
else:
    print('OK')
