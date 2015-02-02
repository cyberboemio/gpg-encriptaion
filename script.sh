#!/bin/bash
function decripta()
{
a=`( ls  | wc -c )`
echo "Desencriptando $1"
gpg-zip -d $1
if [[ $! -eq 0 ]];
then
echo "Hecho"
else 
echo "Algo salio mal "
exit
fi
if [ `( ls  | wc -c )` -gt $a ]
then
rm  $1
fi
}

function encripta()
{
echo "Encriptando $1"
gpg-zip -c -o $1.gpg $1
if [[ $! -eq 0 ]];
then
echo "Hecho"
else
echo "Algo salio mal "
exit
fi
if [ `( ls $1.gpg | wc -c )` -gt 1 ]
then
rm -rf $1
fi
}
a=`(  ls $1 | grep gpg | wc -c )`
echo $a
if [ `( ls $1 | wc -c )` -gt 1 ]
then
if [ $a  -gt 0 ]
then
decripta $1
else
encripta $1
fi
fi
sleep 2
