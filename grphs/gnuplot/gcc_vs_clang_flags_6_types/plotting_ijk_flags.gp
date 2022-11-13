#!/usr/local/bin/gnuplot -persist

set terminal pngcairo font "arial,10" fontscale 1.0 size 1000, 1200 
set output 'gcc_vs_clang_flags_IJK.png'

set boxwidth 0.9 absolute
set style fill   solid 1.00 border lt -1
set key fixed right top vertical Right nobox
set style histogram clustered gap 1 title textcolor lt -1 
set style data histograms
set grid 

#set xtics border in scale 0,0 nomirror rotate by -45  autojustify 
#set xtics   ()

set xrange [ 0 : * ] 
set yrange [ 140 : 300 ] 

set multiplot layout 3,1 rowsfirst 
set ylabel "bandwidth in MiB/s"

## gcc
set title 'Gcc with optimization flags for IJK'
plot 'dgemm_6_gcc_-O1.dat' using 13:xtic(1) ti "-O1",'dgemm_6_gcc_-O2.dat' using 13:xtic(1) ti "-O2",'dgemm_6_gcc_-O3.dat' using 13:xtic(1) ti "-O3", 'dgemm_6_gcc_-Ofast.dat' using 13:xtic(1) ti "-Ofast",

##  clang
set title 'Clang with optimization flags for IJK'
plot 'dgemm_6_clang_-O1.dat' using 13:xtic(1) ti "-O1",'dgemm_6_clang_-O2.dat' using 13:xtic(1) ti "-O2",'dgemm_6_clang_-O3.dat' using 13:xtic(1) ti "-O3", 'dgemm_6_clang_-Ofast.dat' using 13:xtic(1) ti "-Ofast",

 
## clang vs gcc
set title 'Clang vs Gcc with optimization flags for IJK'
plot 'dgemm_6_clang_-O1.dat' using 13:xtic(1) ti "clang: -O1",'dgemm_6_clang_-O2.dat' using 13:xtic(1) ti "-O2",'dgemm_6_clang_-O3.dat' using 13:xtic(1) ti "-O3", 'dgemm_6_clang_-Ofast.dat' using 13:xtic(1) ti "-Ofast",'dgemm_6_gcc_-O1.dat' using 13:xtic(1) ti "gcc: -O1",'dgemm_6_gcc_-O2.dat' using 13:xtic(1) ti "-O2",'dgemm_6_gcc_-O3.dat' using 13:xtic(1) ti "-O3", 'dgemm_6_gcc_-Ofast.dat' using 13:xtic(1) ti "-Ofast",

#replot
unset multiplot
