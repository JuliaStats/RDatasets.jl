+-----------+-------------------+
| ibexraw   | R Documentation   |
+-----------+-------------------+

GPS Monitoring of Four Ibex in the Belledonne Mountain (irregular data)
-----------------------------------------------------------------------

Description
~~~~~~~~~~~

This dataset is an object of class "ltraj" (irregular trajectory,
relocations roughly every 4 hours) containing the raw GPS relocations of
four ibex during 15 days in the Belledonne mountain (French Alps).

Usage
~~~~~

::

    data(ibexraw)

Details
~~~~~~~

This dataset is nearly the same as the dataset ``ibex``, except that the
timing of relocations has not been rounded and the missing values have
not been placed in the trajectory.

Source
~~~~~~

Office national de la chasse et de la faune sauvage, CNERA Faune de
Montagne, 95 rue Pierre Flourens, 34000 Montpellier, France.

Examples
~~~~~~~~

::

    data(ibexraw)
    plot(ibexraw)

