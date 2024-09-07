FROM wordpress

#ENV WORDPRESS_DB_HOST="<mysql_container>:3306"
ENV WORDPRESS_DB_HOST="db:3306"
#ENV WORDPRESS_DB_HOST="mysql_app:3306"
ENV WORDPRESS_DB_USER="wordpress"
ENV WORDPRESS_DB_PASSWORD="wordpress"
ENV WORDPRESS_DB_NAME="wordpress"

EXPOSE 80

# docker build -t mywordpress_build .
# docker run --name mywordpress_app --rm --network mynetwork -p 8080:80 mywordpress_build
