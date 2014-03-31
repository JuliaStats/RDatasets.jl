+-----------+-------------------+
| buffalo   | R Documentation   |
+-----------+-------------------+

GPS monitoring of a buffalo
---------------------------

Description
~~~~~~~~~~~

This data set contains the relocations of an African buffalo (Syncerus
caffer) monitored in the W National Park (Niger) by D. Cornelis, as well
as the habitat map of the study area.

Usage
~~~~~

::

    data(buffalo)

Format
~~~~~~

This dataset is a list containing an object of class ``ltraj`` and a
SpatialPixelsDataFrame.

Details
~~~~~~~

The "infolocs" component of the ltraj stores the proportion of the time
duration between relocation i-1 and relocation i during which the animal
was active.

Source
~~~~~~

Cornelis D., Benhamou S., Janeau G., Morellet N., Ouedraogo M. & de
Vissher M.-N. (submitted). The spatiotemporal segregation of limiting
resources shapes space use patterns of West African savanna buffalo.
Journal of Mammalogy.

Examples
~~~~~~~~

::

    data(buffalo)
    plot(buffalo$traj, spixdf=buffalo$habitat)

