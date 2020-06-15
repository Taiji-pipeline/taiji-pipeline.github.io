---
title: "PageRank"
---

Constructing weighted TF regulatory network
============================================

The weighted network enable us to make use of many weak connections which otherwise will be excluded in an unweighted network.

~~~ diagram
    tfs = vsep 10 [tf1, tf2, tf3]
      where
        tf1 = named "1" $ text "TF 1" # fontSize 10 <> circle 5 # fc yellow # lw 0
        tf2 = named "2" $ text "TF 2" # fontSize 10 <> circle 2.5 # fc yellow # lw 0
        tf3 = named "3" $ text "TF 3" # fontSize 10 <> circle 4 # fc yellow # lw 0
    gene = named "0" $ text "Gene" <> circle 2.5 # fc green # lw 0
    link fr to w d = connectOutside'
        ( with & headLength .~ global (w*3)
        & arrowHead .~ spike
        & shaftStyle %~ lwG w ) fr to d
    example = link "0" "1" 0.5 $
        link "0" "2" 0.25 $
        link "0" "3" 0.4 $
        center tfs ||| strutX 20 ||| gene
~~~

The edge weight is a combination of three factors:

1. Peak intensity $p$, represented by the p-value of a peak, rescaled to $[0, 1]$ by a sigmoid function.
2. Motif binding affinity $m$, represented by the p-value of the motif binding score, rescaled to $[0, 1]$ by a sigmoid function.
3. TF expression value $g$.

If a TF $i$ has $n$ binding sites that are linked to gene $j$, then the edge weight is determined by:

$$e_{ij} = \sqrt{g\sum_{k=1}^n{p_k * m_k}}$$

Computing TF ranks using the PageRank algorithm
===============================================

Let $s$ be the vector containing node weights and $W$ be the edge weight matrix.
The personalized PageRank score vector $v$ was calculated by solving a system of linear equations $v = (1 − d)s + dWv$, where $d$ is the damping factor (default to 0.85).
The above equation can be solved in an iterative fashion, *i.e.*, setting $v_{t+1} = (1-d)s + dWv_t$.

<iframe width="560" height="315" src="https://www.youtube.com/embed/P8Kt6Abq_rM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Statistical significance of PageRank scores
===========================================

To determine the statistical significance of PageRank scores, we randomly rewire edges in the network and compute the PageRank scores.
We do this 10 times to get enough samples for computing the null distribution.
The p-values of PageRank scores were then inferred as to the null distribution.

