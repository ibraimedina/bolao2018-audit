#!/bin/bash

# Format HTML date file
sed -i 's/&nbsp;/\ /g' daily-summary/2018-06-28.html
sed -i 's/&amp;/\ /g' daily-summary/2018-06-28.html
sed -i 's/&raquo;/\ /g' daily-summary/2018-06-28.html
sed -i '460s/.*/\<\/body\>/' daily-summary/2018-06-28.html

# Extract position, name and points per date
xpath -q -e '//div[@id="ranking"]//table//tr/td[position()=1]//text()' daily-summary/2018-06-28.html > temp-positions
xpath -q -e '//div[@id="ranking"]//table//tr/td[position()=2]//text()' daily-summary/2018-06-28.html > temp-names
xpath -q -e '//div[@id="ranking"]//table//tr/td[position()=3]/span/text()' daily-summary/2018-06-28.html > temp-points

# Unify date file
paste temp-positions temp-names temp-points > temp-final
rm temp-positions temp-names temp-points
mv temp-final date-relatory/2018-06-28.tsv
