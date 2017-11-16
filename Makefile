RFILES!= ls R/*.R
TESTFILES!= ls tests/testthat/test*.R

test:
	R CMD INSTALL .
	cd tests && Rscript testthat.R && cd ..

docs:
	R -e "roxygen2::roxygenize()"
