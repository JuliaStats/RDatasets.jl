+--------------+-------------------+
| helicopter   | R Documentation   |
+--------------+-------------------+

Helicopter Data
---------------

Description
~~~~~~~~~~~

The ``helicopter`` data frame has 9 rows and 6 columns.

Experimental design for studying the influences of the factors wing
length and wing width on a paper helicopter's flight time. The goal is
to find the factor setting that maximizes flight time when the paper
helicopter is dropped from a fixed height of 15.5 feet

Usage
~~~~~

::

    data(helicopter)

Format
~~~~~~

A data frame with 9 observations on the following 6 variables:

``L``
    wing length in inches;

``W``
    wing width in inches;

``B``
    base length (always set to 3in);

``H``
    base height (always set to 2in);

``Order``
    run order;

``Time``
    flight time in seconds.

Source
~~~~~~

The data were obtained from

Annis, D. H. (2006) Rethinking the paper helicopter: Combining
statistical and engineering knowledge. *The American Statistician*,
**59**, 320–326.

References
~~~~~~~~~~

Box, G. E. P. (1992) Teaching engineers experimental design with a paper
helicopter. *Quality Engineering*, **4**, 453–459.

Examples
~~~~~~~~

::

    data(helicopter)
    ##
    ## fit model (5) of Annis (2005)
    ## -----------------------------
    heli <- helicopter
    ##
    heli$LW <- heli$L * heli$W
    heli$S <- heli$B * heli$H + ( 2 * heli$L + 1 ) * heli$W
    heli$logTime <- log( heli$Time )
    heli$Y <- heli$logTime + log( heli$S ) / 2
    #
    heli.nlreg <- nlreg( Y ~ b0 + b1 * log( b2^2 / LW + LW ), data = heli, 
                        start = c( b0 = 6, b1 = -1, b2 = 20 ) )

