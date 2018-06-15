START="$(date -Iseconds)"
mkdir -p match-start/$START

while read player; do
	echo -n Reading $player bet...
	curl -s http://lp.blog.br/bolao2018/users/bets/"${player}" > ./match-start/$START/"${player}".html
	echo Done!
done <players

