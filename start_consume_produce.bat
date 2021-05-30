rem change log path to using path
cd /d %KAFKA_HOME%
start bin\windows\zookeeper-server-start.bat config\zookeeper.properties
rem change log path to using path
start bin\windows\kafka-server-start.bat config\server.properties
bin\windows\kafka-topics.bat --bootstrap-server localhost:9092 --create --topic my-test-topic --replication-factor 1 --partitions 3 
bin\windows\kafka-topics.bat --bootstrap-server localhost:9092 --describe --topic my-test-topic  
start bin\windows\kafka-console-consumer.bat --topic my-test-topic --from-beginning --bootstrap-server localhost:9092 
start bin\windows\kafka-console-producer.bat --topic my-test-topic --bootstrap-server localhost:9092 

rem stop zookeeper, kafka broker
start bin\windows\kafka-server-stop.bat
start bin\windows\zookeeper-server-stop.bat
