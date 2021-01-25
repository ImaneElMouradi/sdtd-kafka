# sdtd-kafka

### Description 
Le repo `sdtd-kafka` contient le dockerfile pour la création d'une image docker contenant les dépendances et l'environnement nécessaires pour le bon fonctionnement d'un cluster Kafka. 

Le fichier server.properties comporte la configuration de notre cluster Kafka qui va écrasé la configuration par défaut au niveau de `/kafka/config/server.properties`.

Enfin, le script `startup_script.sh` va nous permettre de lancer zookeeper, ensuite le serveur Kafka, créer un topic `crimes` et enfin lancer un `kafka-consumer` pour écouter les événements sur ce topic.



