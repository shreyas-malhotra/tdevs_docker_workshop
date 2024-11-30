docker build -t todoapp .

docker network create --driver bridge todo

sudo docker run --name tododb --network=todo -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql:latest

sudo docker exec -it tododb mysql -uroot -proot

# Once you are connected to the MySQL database, use the following SQL command to create a database named dockermastery, as required by the application to run, "CREATE DATABASE dockermastery;"

sudo docker run -it -p 8080:8080 --network=todo -e DB_URL=jdbc:mysql://tododb:3306/dockermastery -e DB_USERNAME=root -e DB_PASSWORD=root todoapp
