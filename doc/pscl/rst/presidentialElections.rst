+-------------------------+-------------------+
| presidentialElections   | R Documentation   |
+-------------------------+-------------------+

elections for U.S. President, 1932-2008, by state
-------------------------------------------------

Description
~~~~~~~~~~~

Data from states and the District of Columbia, Democratic share of the
presidential vote, 1932-2008.

Usage
~~~~~

::

    data(presidentialElections)

Format
~~~~~~

-  statename of state, character

-  demVotepercent of the vote for president won by the Democratic
   candidate

-  yearnumeric, integer

-  southlogical, ``TRUE`` if state is one of the 11 states of the former
   Confederacy

Note
~~~~

996 observations, unbalanced panel data: (a) Hawaii and Alaska
contribute data from 1960 onwards; (b) the District of Columbia
contributes data from 1964 onward; (c) Alabama has missing data for 1948
and 1964.

Source
~~~~~~

David Leip's Atlas of U.S. Presidential Elections
`http://uselectionsatlas.org <http://uselectionsatlas.org>`_

Examples
~~~~~~~~

::

    data(presidentialElections)
    library(lattice)
    xyplot(demVote ~ year | state,
           panel=panel.lines,
           ylab="Democratic Vote for President (percent)",
           xlab="Year",
           data=presidentialElections,
           scales=list(y=list(cex=.6),x=list(cex=.35)),
           strip=strip.custom(par.strip.text=list(cex=.6)))

    ## Obama vs Kerry, except DC
    y08 <- presidentialElections$year==2008
    y04 <- presidentialElections$year==2004
    tmpData <- merge(y=presidentialElections[y08,],
                 x=presidentialElections[y04,],
                     by="state")
    tmpData <- tmpData[tmpData$state!="DC",]
    xlim <- range(tmpData$demVote.x,tmpData$demVote.y)
    col <- rep("black",dim(tmpData)[1])
    col[tmpData$south.x] <- "red"

    plot(demVote.y ~ demVote.x,
         xlab="Kerry Vote Share, 2004 (percent)",
         ylab="Obama Vote Share, 2008 (percent)",
         xlim=xlim,
         ylim=xlim,
         type="n",
         las=1,
         data=tmpData)
    abline(0,1,lwd=2,col=gray(.65))
    ols <- lm(demVote.y ~ demVote.x,
              data=tmpData)
    abline(ols,lwd=2)   

    text(tmpData$demVote.x,
         tmpData$demVote.y,
         tmpData$state,
         col=col,
         cex=.65)
    legend(x="topleft",
           bty="n",
           lwd=c(2,2),
           col=c(gray(.65),"black"),
           legend=c("No Change from 2004","Regression"))
    legend(x="bottomright",
           bty="n",
           text.col=c("red","black"),
           legend=c("South","Non-South"))

