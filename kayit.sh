#BAŞI 532 OLAN SON 7 RAKAMI RANDOM OLACAK ŞEKİLDE OLUŞTURULMUŞ TELEFON NUMARASI
#!/bin/bash
FILENAME=$((`date '+%Y%m%d%H%M%S'`))
FULLNAME=/data/btkbab/workspaces/data/dummyData/DUMMY_DATA_RECORD_${FILENAME}.txt
echo "FILE: $FULLNAME"

for((i=0;i<100;i++))
do

        OPARTY=`shuf -r -z -e -n 7 '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'`
        #echo "OPARTY: 532$OPARTY"
        echo -n 532$OPARTY >> $FULLNAME
        echo -n '|$|'>> $FULLNAME
        TPARTY=`shuf -r -z -e -n 7 '1' '2' '3' '4' '5' '6' '7' '8' '9' '0'`
        #echo "TPARTY: 532$TPARTY"
        echo -n 532$TPARTY >> $FULLNAME
        echo -n '|$|'>> $FULLNAME
        date=`date +%Y%m%d%H%M%S`
        #echo "DATE: $date"
        echo $date >> $FULLNAME
done

