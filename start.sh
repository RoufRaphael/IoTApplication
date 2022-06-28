#!/bin/bash
# FILES1="/home/ubuntu/jmeter/apache-jmeter-5.4.1/bin/Jmeter.13/WorkloadRevised/*"

iterations=4
# light workload
#workload=(10 20 30 40 50 60 70 80 90 100 110 120 130 140 150)
#delay=500
#loop=40

#medium workload
#workload=(50 60 70 80 90 100 110 120 130 140 150 160 170 180 190 200)
#delay=250
#loop=40

#heavy Workload
#workload=(100 110 120 130 140 150 160 170 180 190 200 210 220 230 240 250)
#delay=200
#loop=40

workload=(25 50 75 100 125 150 175 200 225)
delay=250
loop=100



for ((iter=0;iter<$iterations;iter++))
do

for w in "${workload[@]}"
do
	echo "Processing $f file..."
  	./jmeter.sh -n -t /home/ubuntu/jmeter/apache-jmeter-5.4.1/bin/Jmeter.13/TestPlan-Mod.jmx -J TestIP=$1 -J NumThreads=$w -J delay=$delay -J NumLoops=$loop

 	 # Get its PID
   	 # PID=$!
   	 # Wait for 60 second

  	 # Kill it
         sudo kill $(ps aux | grep 'jmeter' | awk '{print $2}')

                 #sudo pkill -TERM -P "$PID"
                 #sudo pkill -f "/home/ubuntu/jmeter/apache-jmeter-5.4.1/bin/ApacheJMeter.jar"
         sleep 30
done

sleep 120
done
