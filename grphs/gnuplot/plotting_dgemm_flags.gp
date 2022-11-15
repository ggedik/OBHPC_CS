#!/usr/local/bin/gnuplot -persist
#this script represents MiB/s compiled with gcc and clang 
#as histograms, and in two different colors 
#this plot uses two files and plots them cote a cote since our data is seperately stored

set terminal pngcairo font "arial,10" fontscale 1.0 size 1400, 1200 
set output 'clang_flags.png'



set boxwidth 0.9 absolute
set style fill   solid 1.00 border lt -1
set key fixed right top vertical Right nobox
set style histogram clustered gap 1 title textcolor lt -1 
set style data histograms
set grid 

set xtics border in scale 0,0 nomirror rotate by -45  autojustify 
set xtics   ()

set xrange [ * : * ] 
set yrange [ * : * ] 

set ylabel "bandwidth in MiB/s"
set xlabel "different flags"

##  gcc
set title 'GCC with different matrix multiplication methods and different optimization flags'
plot 'dgemm_60x35_clang_-Ofast.dat' using 13:xtic(1) ti "-Ofast",'dgemm_60x35_clang_-O1.dat' using 13:xtic(1) ti "-O1",'dgemm_60x35_clang_-O2.dat' using 13:xtic(1) ti "-O2",'dgemm_60x35_clang_-O3.dat' using 13:xtic(1) ti "-O3",

 

replot

