---
name: notation
description: "Use when asked to review or edit the mathematical notation in technical material."
---

# Notation

If there are no reasons for exceptions, the following notation and abbreviations should be used consistently.

## Mathematical notation

- Use $\theta \in \Theta$ for parameter vectors (typically $\theta \in \mathbb{R}^D$).
- Use $p[x \mid \theta]$ for the true likelihood and $q[x \mid \theta]$ for
  (variational) approximations.
- Write row derivatives as
  $\frac{\partial}{\partial \theta} f \in \mathbb{R}^{1 \times D}$ and gradients
  as $\nabla f \in \mathbb{R}^D$.
- Reserve $df[x,y] = \frac{\partial f}{\partial x}dx +
  \frac{\partial f}{\partial y}dy$ for total derivatives.
- Write integrals as
  $\mathbb{E}_{\pi}[f] = \int_Q dq\, \pi[q] f[q]$.

## Abbreviations

- PDF: probability density function.
- PMF: probability mass function.
- CDF: cumulative distribution function.
- PPD: posterior predictive density.
