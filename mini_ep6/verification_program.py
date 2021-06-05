from subprocess import call

import numpy as np


n_tests = input()

random_permutation = np.random.permutation(101)
random_permutation_args = [f'{n}' for n in random_permutation]
sleep_sort_args = ['./ss200ms'] + random_permutation_args

call(sleep_sort_args)
