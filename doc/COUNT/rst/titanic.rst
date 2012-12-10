+-----------+-------------------+
| titanic   | R Documentation   |
+-----------+-------------------+

titanic
-------

Description
~~~~~~~~~~~

Passenger survival data from 1912 Titanic shipping accident.

Usage
~~~~~

::

    data(titanic)

Format
~~~~~~

A data frame with 1316 observations on the following 4 variables.

``survived``
    1=survived; 0=died

``age``
    1=adult; 0=child

``sex``
    1=Male; 0=female

``class``
    ticket class 1= 1st class; 2= second class; 3= third class

Details
~~~~~~~

titanic is saved as a data frame. Used to assess risk ratio; not
stardard count model; good binary response model.

Source
~~~~~~

Found in many other texts

References
~~~~~~~~~~

Hilbe, Joseph M (2007, 2011), Negative Binomial Regression, Cambridge
University Press Hilbe, Joseph M (2009), Logistic Regression Models,
Chapman & Hall/CRC

Examples
~~~~~~~~

::

    data(titanic)
    glmlr <- glm(survived ~ age + sex + factor(class), family=binomial, data=titanic)
    summary(glmlr)
    exp(coef(glmlr))

