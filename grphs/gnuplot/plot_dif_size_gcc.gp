#!/usr/local/bin/gnuplot -persist

set terminal pngcairo font "arial,10" fontscale 1.0 size 1400, 1200 
set output 'gcc_dif_size_flagsO3.png'

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

#set multiplot layout 2,2 rowsfirst 
set ylabel "bandwidth in MiB/s"
set xlabel "different matrix sizes"

set title "Gcc with 100x100 and 60x60 matrix sizes for different multiplication methods with O3"

plot  newhistogram, 'dgemm_60x35_gcc_-O3.dat' using 13:xtic(1) ti "60x60",        \
                    'dgemm_100x35_gcc.dat' using 13:xtic(1) ti "100x100",    \
      newhistogram, 'reduc_60x35_gcc_-O3.dat' using 14:xticlabels("REDUC") ti " 60x60",      \
                    'reduc_100x35_gcc.dat' using 14:xticlabels("REDUC") ti "100x100",    \
      newhistogram, 'dotprod_60x35_gcc_-O3.dat' using 14:xticlabels("DOTPROD") ti "60x60",     \
                    'dotprod_100x35_gcc.dat' using 14:xticlabels("DOTPROD") ti "100x100",  \

replot  
#unset multiplot
