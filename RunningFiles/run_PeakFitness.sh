echo 'beginning to run {PeakFitness}' 
 for i in {1..500}
do
slim PeakFitness.slim >> PeakFitness_log.txt
done
