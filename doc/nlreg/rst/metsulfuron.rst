+---------------+-------------------+
| metsulfuron   | R Documentation   |
+---------------+-------------------+

Metsulfuron Methyl Data
-----------------------

Description
~~~~~~~~~~~

The ``metsulfuron`` data frame has 40 rows and 3 columns.

Bioassay on the action of metsulfuron methyl, a sulfunylurea herbicide,
on a tissue culture of *Brassica napus L*. The experiment consists of 8
doses and 5 replications at each level.

Usage
~~~~~

::

    data(metsulfuron)

Format
~~~~~~

This data frame contains the following columns:

``group``
    indicator variable for each tested dose;

``dose``
    the tested dose (nmol/l);

``area``
    the callus area (*mm^2*).

Source
~~~~~~

The data were obtained from

Seiden, P., Kappel, D. and Streibig, J. C. (1998) Response of *Brassica
napus L.* tissue culture to metsulfuron methyl and chlorsulfuron. *Weed
Research*, **38**, 221–228. Dataset M2.

References
~~~~~~~~~~

Bellio, R., Jensen, J.E. and Seiden, P. (2000). Applications of
likelihood asymptotics for nonlinear regression in herbicide bioassays.
*Biometrics*, **56**, 1204–1212.

Brazzale, A. R. (2000) *Practical Small-Sample Parametric Inference*.
Ph.D. Thesis N. 2230, Department of Mathematics, Swiss Federal Institute
of Technology Lausanne. Section 5.3, Example 7.

Examples
~~~~~~~~

::

    data(metsulfuron)
    attach(metsulfuron)
    plot(dose, area, xlab = "tested dose (nmol/l)", 
         ylab = "log callus area (mm^2)", log = "y")
    detach()

