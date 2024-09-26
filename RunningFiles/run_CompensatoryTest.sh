echo 'beginning to run {CompensatoryTest}' 
 for i in {1..500}
do
slim CompensatoryTest.slim >> CompensatoryTest_log.txt
done
