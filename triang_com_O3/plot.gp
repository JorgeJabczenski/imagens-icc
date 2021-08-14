#!/usr/bin/gnuplot -c

set grid
set style data point
set style function line
set style line 1 lc 3 pt 7 ps 0.3
set boxwidth 1
set xtics
set xrange ["0":]
set xlabel  "N (bytes)"

# Gerando figura PNG
set terminal png


#----- tempo
set logscale y
set title   "Tempo de Execução"
set ylabel  "Tempo(s)"
set output "imagens/tempo.png"
plot 'TEMPO.dat' using 1:2 title "<sem otimização>" with linespoints, \
     '' using 1:3 title "<com otimização>" with linespoints
replot
unset output
unset logscale y

#----- miss

set title   "L2CACHE"
set ylabel  "L2 Miss Ratio"
set output "imagens/miss.png"
plot 'L2.dat' using 1:2 title "<sem otimização>" with linespoints, \
     '' using 1:3 title "<com otimização>" with linespoints
replot
unset output



#----- bandwidth

set title   "L3 Bandwidth"
set ylabel  "MBytes/s"
set output "imagens/bandwidth.png"
plot 'L3.dat' using 1:2 title "<sem otimização>" with linespoints, \
     '' using 1:3 title "<com otimização>" with linespoints
replot
unset output


#----- dp

set title   "DP / AVX"
set ylabel  "MFlops/s"
set output "imagens/flops.png"
plot 'FLOPS.dat' using 1:2 title "<DP sem otimização>" with linespoints, \
     '' using 1:3 title "<DP com otimização>" with linespoints,\
     '' using 1:4 title "<AVX sem otimização>" with linespoints,\
     '' using 1:5 title "<AVX com otimização>" with linespoints 
replot
unset output
