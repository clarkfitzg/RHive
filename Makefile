RFILES!= ls R/*.R
TESTFILES!= ls tests/testthat/test*.R
PKG=RHive_0.0.1.tar.gz


docs:
	R -e "roxygen2::roxygenize()"
	R CMD INSTALL .

$(PKG): $(RFILES) $(TESTFILES)
	R CMD build .

check: $(PKG)
	R CMD check $(PKG)

clean:
	rm $(PKG)
	rm vignettes/*.html

test:
	R CMD INSTALL .
	cd tests && Rscript testthat.R && cd ..
