import numpy as np
import sys

vec = np.array(
    [
        (-5.171866611150749e-07 + 2.5618634555957426e-07j),
        (6.11863539414619e-07 - 4.172677598426627e-07j),
        (2.5332591619608407e-07 + 5.640579219972653e-07j),
    ]
)

if __name__ == "__main__":
    hashes = set()
    for i in range(10**5):
        if (i - 1) & i == 0:
            print(i, end=" ")
            sys.stdout.flush()
        res = vec * vec
        if i == 0:
            first_res = res
        if (res != first_res).any():
            break
    print()
    print(res - first_res)
