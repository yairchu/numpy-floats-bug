# numpy bug goose-chase

In this repo I investigated [a bug in numpy](https://github.com/numpy/numpy/issues/26940),
where the same calculation `np.square(vec)` performed again produces different results,
and generally things didn't make sense!

Reproduced on Python 3.12.4 numpy=1.26.4 on macOS 14.4.1 M1 Pro.

Didn't repro for me with numpy==2.0.0, nor on Linux/Windows!

To test on your environment:

```bash
python -m venv venv
venv/bin/python -m pip install -r requirements.txt

venv/bin/python floating_point_determinism_test.py
```

The common output I get looks like this:

```text
INCONSISTENT!
Difference: [2.5243549e-29+0.j 0.0000000e+00+0.j 0.0000000e+00+0.j]
Using <module 'numpy' from '...'> version 1.26.4
```

However with `numpy==2.0.0` the valid output comes and looks like this:

```text
Results are consistent.
Difference: [0.+0.j 0.+0.j 0.+0.j]
Using <module 'numpy' from '...'> version 2.0.0
```
