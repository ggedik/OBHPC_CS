#!/usr/local/bin/gnuplot -persist

set terminal pngcairo font "arial,10" fontscale 1.0 size 1400, 1200 
set output 'flags_gcc_2x2.png'

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

set multiplot layout 2,2 rowsfirst 
set ylabel "bandwidth in MiB/s"
set xlabel "multiplication methods"

##  clang
#set title 'Clang with different matrix multiplication methods and different optimization flags'
#plot 'dgemm_60x35_clang_-Ofast.dat' using 13:xtic(1) ti "-Ofast",
#plot 'dgemm_60x35_clang_-O1.dat' using 13:xtic(1) ti "-O1",
#plot 'dgemm_60x35_clang_-O2.dat' using 13:xtic(1) ti "-O2",
#plot 'dgemm_60x35_clang_-O3.dat' using 13:xtic(1) ti "-O3",

## gcc 
set title 'GCC with different matrix multiplication methods and different optimization flags'
plot 'dgemm_60x35_gcc_-Ofast.dat' using 13:xtic(1) ti "-Ofast" lc rgb '#4dbeee' # light-blue,
plot 'dgemm_60x35_gcc_-O1.dat' using 13:xtic(1) ti "-O1" lc rgb '#4dbeee' # light-blue,
plot 'dgemm_60x35_gcc_-O2.dat' using 13:xtic(1) ti "-O2" lc rgb '#4dbeee' # light-blue,
plot 'dgemm_60x35_gcc_-O3.dat' using 13:xtic(1) ti "-O3" lc rgb '#4dbeee' # light-blue,

#replot
unset multiplot
