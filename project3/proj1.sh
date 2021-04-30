#! /bin/bash
function out( ){
chmod -R 777 $1
cd $1
echo "<ul>" >> $2
for kk in $(ls .)
do
   if [ -d $kk ]
   then
   echo "<li>""$kk" >> $2
   out $kk $2
   echo "</li>" >> $2
   elif [ ! -d $kk ]
   then
   echo "<li>$kk</li>" >> $2
   fi
done
echo "</ul>" >> $2
}

function maketree( ){
chmod -R 777 $1
cd $1
echo "<ul>""$1" > $2
for a in $(ls .)
do
   if [ -d $a ]
   then
   chmod -R 777 $a
   echo "<li>""$a" >> $2
   out $a $2
   echo "</li>" >> $2
   elif [ ! -d $a ]
   then
   echo "<li>""$a""</li>" >> $2
   fi
done
echo "</ul>" >> $2
}

if [ $# != 2 ]
then
  echo "INPUT ERROR"
  exit 1
else
  maketree $1 $2
fi
