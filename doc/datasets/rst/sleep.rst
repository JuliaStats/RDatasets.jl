+---------+-------------------+
| sleep   | R Documentation   |
+---------+-------------------+

Student's Sleep Data
--------------------

Description
~~~~~~~~~~~

Data which show the effect of two soporific drugs (increase in hours of
sleep compared to control) on 10 patients.

Usage
~~~~~

::

    sleep

Format
~~~~~~

A data frame with 20 observations on 3 variables.

+---------+---------+-----------+------------------------------+
| [, 1]   | extra   | numeric   | increase in hours of sleep   |
+---------+---------+-----------+------------------------------+
| [, 2]   | group   | factor    | drug given                   |
+---------+---------+-----------+------------------------------+
| [, 3]   | ID      | factor    | patient ID                   |
+---------+---------+-----------+------------------------------+

Details
~~~~~~~

The ``group`` variable name may be misleading about the data: They
represent measurements on 10 persons, not in groups.

Source
~~~~~~

Cushny, A. R. and Peebles, A. R. (1905) The action of optical isomers:
II hyoscines. *The Journal of Physiology* **32**, 501–510.

Student (1908) The probable error of the mean. *Biometrika*, **6**, 20.

References
~~~~~~~~~~

Scheffé, Henry (1959) *The Analysis of Variance*. New York, NY: Wiley.

Examples
~~~~~~~~

::

    require(stats)
    ## Student's paired t-test
    with(sleep,
         t.test(extra[group == 1],
                extra[group == 2], paired = TRUE))

