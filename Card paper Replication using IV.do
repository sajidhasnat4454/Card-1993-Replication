use "/Users/sajidhasnat/Downloads/card.dta"
u card.dta


ssc install esttab


su educ
histogram educ

su wage
scatter lwage educ
binscatter lwage educ


eststo col1: reg lwage educ exper expersq black south smsa smsa66 reg*

* reg661 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669


eststo col2: reg lwage educ exper expersq black south smsa smsa66 reg*, robust


esttab ///
	col* ///
	, label   ///
	starlevels( * 0.10 ** 0.05 *** 0.01 ) r2 cells(b(star fmt(3)) se(par fmt(3)))


eststo col3: reg educ nearc4 exper expersq black south smsa smsa66 reg*, robust



eststo col4: ivregress 2sls lwage  exper expersq black south smsa smsa66 reg* (educ=nearc4), robust first



esttab ///
	col* ///
	, label   ///
	starlevels( * 0.10 ** 0.05 *** 0.01 ) r2 cells(b(star fmt(3)) se(par fmt(3)))

//FINDINGS: The coefficient on nearc4 implies that being near college increases education by 0.3 years.
