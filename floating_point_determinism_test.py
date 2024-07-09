import numpy as np
import sys

vec = np.array([0, -5.171866611150749e-07 + 2.5618634555957426e-07j, 0])


def compute():
    return np.square(vec)


if __name__ == "__main__":
    first_res = compute()
    for i in range(1, 10**5):
        if (i - 1) & i == 0:
            print(i, end=" ")
            sys.stdout.flush()
        res = compute()
        if (res != first_res).any():
            print("Results are inconsistent.")
            break
    else:
        print("Results are consistent.")
    print("Difference:", res - first_res)
    print("Using", np, "version", np.__version__)
