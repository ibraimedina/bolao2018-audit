playersCount=$(wc -l < players)
styleLines=10

curl -s http://lp.blog.br/bolao2018/ > home.html
pageLines=$(grep \<tr\> home.html |wc -l)

exit $(expr $pageLines - $styleLines - $playersCount)
