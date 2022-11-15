#!/usr/local/bin/gnuplot -persist
#this script represents MiB/s compiled with gcc and clang 
#as histograms, and in two different colors 
#this plot uses two files and plots them cote a cote since our data is seperately stored

set terminal pngcairo font "arial,10" fontscale 1.0 size 1000, 1200 
set output 'dotprod_clang_vs_gcc_2x2.png'

set boxwidth 0.9 absolute
set style fill   solid 1.00 border lt -1
set key fixed right top vertical Right nobox
set style histogram clustered gap 1 title textcolor lt -1 
set style data histograms
set grid 

set xrange [ 0 : * ] 
set yrange [ * : 30000 ] 
set multiplot layout 2,2 rowsfirst
set ylabel "bandwidth in MiB/s"
set xlabel "dotproduct methode"

## gcc
set title 'Clang vs GCC with -O1'
plot 'dotprod_60x35_clang_-O1.dat' using 14:xtic(1) ti "clang", 'dotprod_60x35_gcc_-O1.dat' using 14:xtic(1) ti "gcc",
set title 'Clang vs GCC with -O2'
plot 'dotprod_60x35_clang_-O2.dat' using 14:xtic(1) ti "clang", 'dotprod_60x35_gcc_-O2.dat' using 14:xtic(1) ti "gcc",
set title 'Clang vs GCC with -O3'
plot 'dotprod_60x35_clang_-O3.dat' using 14:xtic(1) ti "clang", 'dotprod_60x35_gcc_-O2.dat' using 14:xtic(1) ti "gcc",
set title 'Clang vs GCC with -Ofast'
plot 'dotprod_60x35_clang_-Ofast.dat' using 14:xtic(1) ti "clang" , 'dotprod_60x35_gcc_-O2.dat' using 14:xtic(1) ti "gcc",



unset multiplot
