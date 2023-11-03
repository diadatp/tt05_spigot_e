![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg)

# Spigot E

Spigot algorithm for calculating the digits of e

## How it works

This project implements a bounded spigot algorithm for calculating the digits (currently 31) of e. While there are many ways to calculate the digits of transcendental numbers like e or pi, this spigot algorithm has much lower memory requirements. It however only produces a single digit at a time, and the number of digits produced is precommited at the time of design. For calculating n digits, the algorithm needs at least (n+1) storage locations. Each digit requires (n+1) calculation steps, repeated (n-1) times producing (n-1) digits (first digit 2 is not counted). Each calculation step requires a constant multiply, an add and a divide with remainder.

There are many optimizations needed to fit as many digits as possible into a 1x1 tile. The biggest contributor is the storage elements. Some quick modeling revealed that the storage elements need to be about as wide as log(n).
The calculation step hardware is shared across all iterations.
The intermediate results are never needed outside each calculation and are never stored in memory.
The memory access is such that each location is read and written to before moving on to the next.
The memory access pattern removes the need for address decoding, replaced with a massive ring of gated shift registers.
