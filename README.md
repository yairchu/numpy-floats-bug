# numpy bug goose-chase

In this repo I try to bisect a bug in numpy,
where the same calculation `vec**2` performed again produces different results,
and generally things don't make sense!

Reproduced on Python 3.12.4 numpy=1.26.4 on macOS 14.4.1 M1 Pro.

Doesn't repro with numpy==2.0.0!

To test on your environment:

```bash
python -m venv venv
venv/bin/python -m pip install -r requirements.txt

venv/bin/python floating_point_determinism_test.py
```

The common output I get looks like this:

```text
1 Results are inconsistent.
Difference: [0.0000000e+00+0.j 2.5243549e-29+0.j 0.0000000e+00+0.j]
Using <module 'numpy' from '...'> version 1.26.4
```

However with `numpy==2.0.0` the valid output comes and looks like this:

```text
1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536 Results are consistent.
[0.+0.j 0.+0.j 0.+0.j]
Using <module 'numpy' from '...'> version 1.26.4
```
