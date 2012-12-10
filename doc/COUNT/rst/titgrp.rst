+----------+-------------------+
| titgrp   | R Documentation   |
+----------+-------------------+

titgrp
------

Description
~~~~~~~~~~~

The data is a grouped version of the 1912 Titanic passenger survival
log, with individual observations reduced to 12 cases.

Usage
~~~~~

::

    data(titgrp)

Format
~~~~~~

A data frame with 12 observations on the following 5 variables.

``survive``
    number of passengers who survived

``cases``
    number of observations having same covariate pattern

``age``
    1=adult; 0=child

``sex``
    1=Male; 0=female

``class``
    ticket class 1= 1st class; 2= second class; 3= third class

Details
~~~~~~~

titgrp is saved as a data frame. count response=survive;
offset=log(cases); can be used as a binomial model as well.

Source
~~~~~~

Observation level data Found in many other texts

References
~~~~~~~~~~

Hilbe, Joseph M (2007, 2011), Negative Binomial Regression, Cambridge
University Press Hilbe, Joseph M (2009), Logistic Regression Models,
Chapman & Hall/CRC

Examples
~~~~~~~~

::

    data(titgrp)
    glmtgp <- glm(survive ~ age + sex + factor(class) + offset(log(cases)), family=poisson, data=titgrp)
    summary(glmtgp)
    exp(coef(glmtgp))
    library(MASS)
    glmtgnb <- glm.nb(survive ~ age + sex + factor(class) + offset(log(cases)), data=titgrp)
    summary(glmtgnb)
    exp(coef(glmtgnb))

