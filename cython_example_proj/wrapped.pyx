cimport cython

# This file shows 4 examples:
#   - Wrapping an external c function into python, "c_hello"
#   - Making a wrapped c function on python types w/ cython syntax, "factorial"
#   - A c function that takes an ndarray array and returns a scalar, "array_sum"
#   - A c function that takes an ndarray and returns an ndarray "tesselation"

cdef extern from "lib/cfunc.h":
    # Imports definitions from a c header file
    # Corresponding source file (cfunc.c) must be added to
    # the extension definition in setup.py for proper compiling & linking

    void hello()


def c_hello():
    # Exposes a c function to python

    hello()


def factorial(int x):
    # Basic example of a cython function, which defines
    # python-like operations and control flow on defined c types

    cdef int m = x
    cdef int i

    if x <= 1:
        return 1
    else:
        for i in range(1, x):
            m = m * i
        return m
