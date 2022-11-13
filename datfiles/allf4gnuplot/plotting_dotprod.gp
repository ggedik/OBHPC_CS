#!/usr/local/bin/gnuplot -persist

set terminal pngcairo font "arial,10" fontscale 1.0 size 1000, 1200 
set output 'dotprod_gcc_vs_clang_flags.png'

set boxwidth 0.9 absolute
set style fill   solid 1.00 border lt -1
set key fixed right top vertical Right nobox
set style histogram clustered gap 1 title textcolor lt -1 
set style data histograms
set grid 

set xrange [ 0 : * ] 
set yrange [ 5000 : 55000 ] 
set multiplot layout 3,1 rowsfirst
set ylabel "bandwidth in MiB/s"
set xlabel "dot product methode"

## gcc
set title 'Gcc with optimization flags for dot product methode'
plot 'dotprod_60x35_gcc_-O1.dat' using 14:xtic(1) ti "-O1",'dotprod_60x35_gcc_-O2.dat' using 14:xtic(1) ti "-O2",'dotprod_60x35_gcc_-O3.dat' using 14:xtic(1) ti "-O3",'dotprod_60x35_gcc_-Ofast.dat' using 14:xtic(1) ti "-Ofast",

## clang
set title 'Clang with optimization flags for dot product methode'
plot 'dotprod_60x35_clang_-O1.dat' using 14:xtic(1) ti "-O1",'dotprod_60x35_clang_-O2.dat' using 14:xtic(1) ti "-O2",'dotprod_60x35_clang_-O3.dat' using 14:xtic(1) ti "-O3",'dotprod_60x35_clang_-Ofast.dat' using 14:xtic(1) ti "-Ofast",

## clang_vs_gcc
set title 'Clang vs gcc with optimization flags for dotprodct methode'
plot 'dotprod_60x35_clang_-O1.dat' using 14:xtic(1) ti "clang: -O1",'dotprod_60x35_clang_-O2.dat' using 14:xtic(1) ti "-O2",'dotprod_60x35_clang_-O3.dat' using 14:xtic(1) ti "-O3",'dotprod_60x35_clang_-Ofast.dat' using 14:xtic(1) ti "-Ofast",'dotprod_60x35_gcc_-O1.dat' using 14:xtic(1) ti "gcc: -O1",'dotprod_60x35_gcc_-O2.dat' using 14:xtic(1) ti "-O2",'dotprod_60x35_gcc_-O3.dat' using 14:xtic(1) ti "-O3",'dotprod_60x35_gcc_-Ofast.dat' using 14:xtic(1) ti "-Ofast",
#replot
unset multiplot
