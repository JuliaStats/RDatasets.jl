+--------+-------------------+
| teal   | R Documentation   |
+--------+-------------------+

Teal (Anas crecca) Ring Recovery Dataset
----------------------------------------

Description
~~~~~~~~~~~

This dataset describes the location and date of recovery of 800 teal
ringed in Camargue, southern France between January 1952 and February
1978 using standard dabbling duck funnel traps hidden in the vegetation.

Usage
~~~~~

::

    data(teal)

Format
~~~~~~

The following variables are given for each recovery:

``x``
    a numeric vector giving the longitude of the recovery

``y``
    a numeric vector giving the latitude of the recovery

``date``
    a vector of class POSIXct containing the date of recovery. Actually,
    only the day and month have been indicated. The year of recovery has
    been set to 1900 or 1901, and should not be taken into account in
    the analysis.

Details
~~~~~~~

The Camargue teal ringing program led to the recovery of 9,114 teals
after the ringing of 59,187 birds. These 800 recoveries of this dataset
are a subsample of the 4,652 birds recovered during the first year
following ringing. Note that both the coordinates and the date have been
jittered to preserve copyright on the data.

Source
~~~~~~

La Tour du Valat. A research centre for the conservation of
Mediterranean wetlands. Le Sambuc - 13200 Arles, France.
http://en.tourduvalat.org/

Examples
~~~~~~~~

::

    data(teal)

    plot(teal[,1:2], asp=1,
         xlab="longitude", ylab="latitude",
         main="Capture site (red) and recoveries")

    points(attr(teal, "CaptureSite"), pch=16,
           cex=2, col="red")

