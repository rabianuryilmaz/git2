#ÜRETİLEN TELEFON NUMARALARINI TABLOYA EKLEYEN KOD (TABLO KOLONLARI LOAD_TİME,FİLE_NAME,CALLER_NUM,DIALED_NUM,DATE,LOAD_ID)
#!/bin/bash
for datafile in `find /data/btkbab/workspaces/data/dummyData/ -type f`
do
        lineCount=`wc -l $datafile | awk '{print $1}' `
        dfilename=`basename $datafile`
        echo $dfilename
        echo "$lineCount records will be loaded from $datafile "
        bdate=`echo $datafile | cut -d '_' -f 3 | cut -d '.' -f 1`
        echo $bdate
        date1=`date +%Y%m%d%H%M%S`
        #mysql --defaults-extra-file=/home/user1/mysql.conf -e " insert into test.RecordTable (file_name,load_time) values('${dfilename}','${date1}')
        lid=$(($(date +%s%N)/1000000))

        mysql --defaults-extra-file=/home/user1/mysql.conf -e "load data local infile '$datafile' into table test.RecordTable fields terminated by '|$|' lines terminated by '\n' (caller_num,dialed_num,dat
e) set file_name='${dfilename}', load_time=CURRENT_TIMESTAMP, load_id=${lid};"

        mv  $datafile /data/btkbab/workspaces/data/loadedData/
done
