import numpy as np

vec = np.array([-5.171866611150749e-07 + 2.5618634555957426e-07j, 0, 0])


def compute():
    return np.square(vec)


extra_debug = True


if __name__ == "__main__":
    first_res = compute()
    second_res = compute()

    print(
        "Results are consistent."
        if (first_res == second_res).all()
        else "INCONSISTENT!"
    )

    print("Difference:", second_res - first_res)
    print("Using", np, "version", np.__version__)

    if extra_debug:
        print(first_res[0].real)
        print(second_res[0].real)
        for i in range(1000):
            assert (compute() == second_res).all()
