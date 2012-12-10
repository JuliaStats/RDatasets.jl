+-----------+-------------------+
| daphnia   | R Documentation   |
+-----------+-------------------+

‘Daphnia Magna’ Data
--------------------

Description
~~~~~~~~~~~

The ``daphnia`` data frame has 136 rows and 2 columns.

Ecotoxicity study to assess the impact of the herbicide dinoseb on the
survival of *Daphnia magna* Strauss, 1820, a micro-crustacean widely
used as test organism in aquatic ecotoxicological assays. The design of
the experiment includes 35 irregularly spaced concentrations ranging
from 0.006 to 11.3 mg/l and a control group. The upper endpoint of 11.3
mg/l is the highest concentration at which the test substance is soluble
in the test medium. The number of replicates per concentration varies
from 1 to 11 experimental units. The survival time is measured in days.

Usage
~~~~~

::

    data(daphnia)

Format
~~~~~~

This data frame contains the following columns:

``conc``
    the tested concentration (mg/l);

``time``
    the survival time in days.

Source
~~~~~~

The data were obtained from

Ch\\'evre, N. (2000) *Etude et mod\\'elisation des effets \\'ecotoxiques
d'un micropolluant organique sur* Daphnia magna *et* Pseudokirchneriella
subcapitata (in French). Ph.D. Thesis N. 2117, Department of Rural
Engineering, Swiss Federal Institute of Technology Lausanne.

References
~~~~~~~~~~

Brazzale, A.R. (2000) *Practical Small-Sample Parametric Inference*.
Ph.D. Thesis N. 2230, Department of Mathematics, Swiss Federal Institute
of Technology Lausanne. Section 5.3, Example 5.

Ch\\'evre, N., Becker-van Slooten, K., Tarradellas, J., Brazzale, A. R.,
Behra, R. and Guettinger, H. (2001) Effects of dinoseb on the entire
life-cycle of *Daphnia magna*. Part II: Modelling of survival and
proposal of an alternative to No-Observed-Effect-Concentration (NOEC).
*Environmental Toxicology and Chemistry*, **21**, 828–833.

Examples
~~~~~~~~

::

    data(daphnia)
    attach(daphnia)
    plot(conc, time, xlab = "test concentration (mg/l)", 
         ylab = "survival time (d)", log = "y")
    detach()

