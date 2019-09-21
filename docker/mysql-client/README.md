# `Dockerfile` link

 - `latest` [(docker/mysql-client)](https://github.com/mbtamuli/playground/blob/master/docker/mysql-client/Dockerfile)

# How to use this image

 - ## Have a MySQL instance running.
   Start a MySQL instance anywhere. You can use the docker image like so,
   `docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=secretpassword mysql`
 - ## Connect the MySQL client
   `docker run -it --link mysql:mysql --rm mbtamuli/mysql-client mysql -hmysql -uroot -psecretpassword`
