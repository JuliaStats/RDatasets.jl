+--------+-------------------+
| rats   | R Documentation   |
+--------+-------------------+

Rat data from Gail et al.
-------------------------

Description
~~~~~~~~~~~

48 rats were injected with a carcinogen, and then randomized to either
drug or placebo. The number of tumors ranges from 0 to 13; all rats were
censored at 6 months after randomization.

Usage
~~~~~

::

    rats

Format
~~~~~~

+----------------+---------------------------------+
| rat:           | id                              |
+----------------+---------------------------------+
| rx:            | treatment,(1=drug, 0=control)   |
+----------------+---------------------------------+
| observation:   | within rat                      |
+----------------+---------------------------------+
| start:         | entry time                      |
+----------------+---------------------------------+
| stop:          | exit time                       |
+----------------+---------------------------------+
| status:        | event status                    |
+----------------+---------------------------------+
+----------------+---------------------------------+

Source
~~~~~~

MH Gail, TJ Santner, and CC Brown (1980), An analysis of comparative
carcinogenesis experiments based on multiple times to tumor.
*Biometrics* **36**, 255–266.
