#! /bin/bash
TZ='Morocco/Casablanca'
day=$(TZ='Morocco/Casablanca' date -u +%d)
month=$(TZ='Morocco/Casablanca' date -u +%m)
year=$(TZ='Morocco/Casablanca' date -u +%Y)
 
echo  "$day $month $year"

cityname=Casablanca
echo $cityname
curl -s wttr.in/$cityname?T --output weather_report
obs_temp=$(curl -s wttr.in/$cityname?T | grep -m 1 '°.')
echo $obs_temp
obs_temp=$(curl -s wttr.in/$cityname?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current temp of $cityname : $obs_temp"
fc_temp=$(curl -s wttr.in/$cityname?T | head -23 | tail -1 )

echo "The current temp of $cityname : $fc_temp"
fc_temp=$(curl -s wttr.in/$cityname?T | head -23 | tail -1 | grep '°.' )

echo "The current temp of $cityname : $fc_temp"
fc_temp=$(curl -s wttr.in/$cityname?T | head -23 | tail -1 | grep '°.'| cut -d 'F' -f2 )

echo "The current temp of $cityname : $fc_temp"
fc_temp=$(curl -s wttr.in/$cityname?T | head -23 | tail -1 | grep '°.'| cut -d 'F' -f2 |grep -Eo -e '-?[[:digit:]].*')

echo "The current temp of $cityname : $fc_temp"
record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp C")
echo "$record">>rx_poc.log

