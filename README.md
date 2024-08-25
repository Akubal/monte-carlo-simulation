# Monte Carlo Simulation

## Overview

This project contains functions that use Monte Carlo methods to solve two distinct problems: estimating the fraction of singular Bernoulli matrices and calculating the volume of intersection between two spheres in n-dimensional space.

## Function Descriptions

### 1. `BernoulliSings(N, T)`
- **Purpose:** Estimates the fraction of `N x N` Bernoulli matrices that are singular using Monte Carlo simulation.
- **Parameters:**
  - `N`: The dimension of the square Bernoulli matrices.
  - `T`: The number of Monte Carlo trials to run.
- **Returns:** The estimated fraction of singular matrices (i.e., matrices with rank less than `N`).

### How It Works:
The function generates `T` random `N x N` matrices with elements being either 1 or -1. It then checks each matrix's rank to see if it is less than `N`. The fraction of such matrices gives an estimate of the probability that a randomly generated Bernoulli matrix is singular.

### 2. `VolumeSphereIntersect(P, Q, R, S, T, W)`
- **Purpose:** Computes the volume of the intersection between two spheres in n-dimensional space using a Monte Carlo method.
- **Parameters:**
  - `P`: Center of the first sphere (an n-dimensional vector).
  - `Q`: Center of the second sphere (an n-dimensional vector).
  - `R`: Radius of the first sphere.
  - `S`: Radius of the second sphere.
  - `T`: Number of Monte Carlo trials.
  - `W`: Confidence level for the result (a number between 0 and 1).
- **Returns:** A confidence interval for the volume of the intersection of the two spheres.

### How It Works:
The function identifies a bounding box that covers the potential intersection area of the two spheres. It then randomly generates `T` points within this box and checks if these points lie within both spheres. The fraction of points that satisfy this condition, scaled by the volume of the bounding box, provides an estimate of the intersection volume. The function returns a confidence interval for this estimate based on the specified confidence level `W`.

## Usage

- Use `BernoulliSings(N, T)` to understand the behavior of random Bernoulli matrices and the likelihood of them being singular, which can have implications in various fields including cryptography and random matrix theory.
- Use `VolumeSphereIntersect(P, Q, R, S, T, W)` to estimate the volume of intersection of two n-dimensional spheres, which can be useful in problems related to spatial analysis, physics, and multidimensional geometry.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.
