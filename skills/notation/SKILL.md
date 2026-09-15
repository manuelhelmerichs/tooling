---
name: notation
description: "Use the appropriate mathematical notation when writing or editing technical material concerning Bayesian deep learning."
---

# Notation

Apply these conventions consistently unless the user or project explicitly
specifies a different convention.

## Mathematical notation

- Use $\theta \in \Theta$ for parameter vectors.
- Use $p[x \mid \theta]$ for the true likelihood and $q[x \mid \theta]$ for
  variational approximations.
- Write row derivatives as
  $\frac{\partial}{\partial \theta} f \in \mathbb{R}^{1 \times d}$ and gradients
  as $\nabla f \in \mathbb{R}^d$.
- Reserve $df[x,y] = \frac{\partial f}{\partial x}dx +
  \frac{\partial f}{\partial y}dy$ for total derivatives.
- Write integrals as
  $\mathbb{E}_{\pi}[f] = \int_Q dq\, \pi[q] f[q]$.

## Abbreviations

- PDF: probability density function.
- PMF: probability mass function.
- CDF: cumulative distribution function.
- PPD: posterior predictive density.
