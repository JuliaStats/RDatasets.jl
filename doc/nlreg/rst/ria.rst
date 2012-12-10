+-------+-------------------+
| ria   | R Documentation   |
+-------+-------------------+

Radioimmunoassay Data
---------------------

Description
~~~~~~~~~~~

The ``ria`` data frame has 16 rows and 2 columns.

Run of a radioimmunoassay (RIA) to estimate the concentrations of a drug
in samples of porcine serum. The experiment consists of 16 observations
made at 8 different drug levels with two replications at each level.

Usage
~~~~~

::

    data(ria)

Format
~~~~~~

This data frame contains the following columns:

``conc``
    the drug concentration (ng/ml);

``count``
    the observed percentage of radioactive gamma counts.

Source
~~~~~~

The data were obtained from

Belanger, B. A., Davidian, M. and Giltinan, D. M. (1996) The effect of
variance function estimation on nonlinear calibration inference in
immunoassay data. *Biometrics*, **52**, 158–175. Table 1, first two
columns.

References
~~~~~~~~~~

Brazzale, A. R. (2000) *Practical Small-Sample Parametric Inference*.
Ph.D. Thesis N. 2230, Department of Mathematics, Swiss Federal Institute
of Technology Lausanne. Section 5.3, Example 6.

Examples
~~~~~~~~

::

    data(ria)
    attach(ria)
    plot(conc, count, xlab="drug concentration (ng/ml)", ylab="gamma counts (%)")
    detach()

