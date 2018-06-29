#!/bin/bash
TODAY="$(date -I)"

# Format HTML date file
sed -i 's/&nbsp;/\ /g' daily-summary/${TODAY}.html
sed -i 's/&amp;/\ /g' daily-summary/${TODAY}.html
sed -i 's/&raquo;/\ /g' daily-summary/${TODAY}.html
sed -i '460s/.*/\<\/body\>/' daily-summary/${TODAY}.html

# Extract position, name and points per date
xpath -q -e '//div[@id="ranking"]//table//tr/td[position()=1]//text()' daily-summary/${TODAY}.html > temp-positions
xpath -q -e '//div[@id="ranking"]//table//tr/td[position()=2]//text()' daily-summary/${TODAY}.html > temp-names
xpath -q -e '//div[@id="ranking"]//table//tr/td[position()=3]/span/text()' daily-summary/${TODAY}.html > temp-points

# Unify date file
paste temp-positions temp-names temp-points > temp-final
rm temp-positions temp-names temp-points
mv temp-final date-relatory/${TODAY}.tsv
