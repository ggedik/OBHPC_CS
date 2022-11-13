#!/usr/local/bin/gnuplot -persist

set terminal pngcairo font "arial,10" fontscale 1.0 size 1400, 1200 
set output 'gcc_clang_Ofast_reduc_dotprod.png'



set boxwidth 0.9 absolute
set style fill   solid 1.00 border lt -1
set key fixed right top vertical Right nobox
set style histogram clustered gap 1 title textcolor lt -1 
set style data histograms
set grid 

set xtics border in scale 0,0 nomirror rotate by -45  autojustify 
set xtics   ()
#set xtics ([0,1,2,3,4,5,6,7],['IJK','IKJ','IEX','UNROLLx4','CBLAS','UNROLLx8',' REDUC', 'DOTPROD' ])

set xrange [ * : * ] 
set yrange [ * : 50000 ] 

set ylabel "bandwidth in MiB/s"
set xlabel "different flags"

#set multiplot layout 2,2 rowsfirst

#set title 'Gcc vs Clang with optimization flag O1 for all methods'
#plot newhistogram, 'dgemm_60x35_gcc_-O1.dat' using 13:xtic(1) ti "gcc", \
#    'dgemm_60x35_clang_-O1.dat' using 13:xtic(1) ti "clang", \
#    newhistogram, 'reduc_60x35_gcc_-O1.dat' using 14:xticlabels("REDUC") ti "gcc",  \
#    'reduc_60x35_clang_-O1.dat' using 14:xticlabels("REDUC") ti "clang",  \
#    newhistogram,'dotprod_60x35_clang_-O1.dat' using 14:xtic("DOTPROD") ti "gcc",    \
#    'dotprod_60x35_clang_-O1.dat' using 14:xtic("DOTPROD") ti "-clang",    \


#set title 'Gcc vs Clang with optimization flag O2 for all methods'
#plot newhistogram,'dgemm_60x35_gcc_-O2.dat' using 13:xtic(1) ti "gcc",  \
#     'dgemm_60x35_clang_-O2.dat' using 13:xtic(1) ti "clang", \
#     newhistogram,'reduc_60x35_gcc_-O2.dat' using 14:xticlabels("REDUC")  ti "gcc",   \
#     'reduc_60x35_clang_-O2.dat' using 14:xticlabels("REDUC") ti "clang",  \
#     newhistogram,'dotprod_60x35_gcc_-O2.dat' using 14:xtic("DOTPROD") ti "gcc", \
#     'dotprod_60x35_clang_-O2.dat' using 14:xtic("DOTPROD") ti "clang",    \
 

#set title 'Gcc with optimization flag O3 for all methods'
#plot newhistogram,'dgemm_60x35_gcc_-O3.dat' using 13:xtic(1) ti "gcc",  \
    # 'dgemm_60x35_clang_-O3.dat' using 13:xtic(1) ti "clang", \
     #newhistogram,'reduc_60x35_gcc_-O3.dat' using 14:xticlabels("REDUC")  ti "gcc",   \
    # 'reduc_60x35_clang_-O3.dat' using 14:xticlabels("REDUC") ti "clang",  \
    # newhistogram,'dotprod_60x35_gcc_-O3.dat' using 14:xtic("DOTPROD") ti "gcc", \
    # 'dotprod_60x35_clang_-O3.dat' using 14:xtic("DOTPROD") ti "clang",    \


set title 'Gcc with optimization flag Ofast for all methods'
plot newhistogram,'dgemm_60x35_gcc_-Ofast.dat' using 13:xtic(1) ti "gcc",    \
     'dgemm_60x35_clang_-Ofast.dat' using 13:xtic(1) ti "clang", \
    newhistogram,'reduc_60x35_gcc_-Ofast.dat' using 14:xticlabels("REDUC") ti "gcc",   \
    'reduc_60x35_clang_-Ofast.dat' using 14:xticlabels("REDUC") ti "clang",  \
    newhistogram,'dotprod_60x35_gcc_-Ofast.dat' using 14:xtic("DOTPROD") ti "gcc", \
    'dotprod_60x35_clang_-Ofast.dat' using 14:xtic("DOTPROD") ti "clang",    \





replot
#unset multiplot
