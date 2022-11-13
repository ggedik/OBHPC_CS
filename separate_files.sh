#!/bin/bash

#this script gets the matrix size and the complator name
#then changes the makefile according to compilator
#then executes the object file  according to the given matrix size
#you just need to manually change name of the file to be e

echo "please enter the matrix size: usage: [n] [r]:\n"
read ms r
echo "please enter the compilator name\n"
read version
echo "please enter flags usage -[flag]"
read flags

for file in "reduc" "dgemm" "dotprod"
do
##we are in TP2 and then we'll be getting into the files one by one

##for file

cd "$file"
echo "$file"
make clean
sed -i "/OFLAGS=/c\OFLAGS=$flags" Makefile
sed -i "/CC=/c\CC=$version" Makefile										#find the string which includes CC=, and replace the whole string , -i: inplace editing
make
cd ..
done

for file in "reduc" "dgemm" "dotprod"
do

cd "$file"

if [ -e "$file"_"$ms"x"$r"_"$version"_"$flags".dat ]; then
rm "$file"_"$ms"x"$r"_"$version"_"$flags".dat;
fi

sudo cpupower -c all frequency-set -g performance

sudo taskset -c 1 ./$file "$ms" "$r" | awk '{gsub(/;/,"")}1' >> "$file"_"$ms"x"$r"_"$version"_"$flags".dat

nb=$( wc -l < "$file"_"$ms"x"$r"_"$version"_"$flags".dat )

#if there are any patanthesis, get rid of the space inside them
#because gnuplot takes them as a seperate column

sed -i "s/( /(/g"  "$file"_"$ms"x"$r"_"$version"_"$flags".dat
tmp=$( echo "$nb"| bc )

if [ -d "$version"_"$flag" ]; then
rm -d -r "$version"_"$flags"; 												#deletes if it already exists
fi
												#I had to run a couple of times so it facilitates my job
mkdir "$version"_"$flags"

for ((i=1;i<tmp;i++));
do

if [ -e "$file"_"$i"_"$version"_"$flags".dat ]; then
rm "$file"_"$i"_"$version"_"$flags".dat; 												#removes if it already exist, continues otherwise
fi


mkdir -p "$i"
 													#does nothing if it already exists
echo "$(head -n 1 "$file"_"$ms"x"$r"_"$version"_"$flags".dat)"  >> "$file"_"$i"_"$version"_"$flags".dat 						#takes the first line : defs
echo "$(tail -n"$i" "$file"_"$ms"x"$r"_"$version"_"$flags".dat | head -n 1)" | awk '{gsub(/;/,"")}1' >> "$file"_"$i"_"$version"_"$flags".dat 	#reads from the last one to first one #takes the second line : data
cp "$file"_"$i"_"$version"_"$flags".dat ./"$version"_"$flags"
mv -u "$file"_"$i"_"$version"_"$flags".dat "$i"
done

cd ..
done



