FROM rocker/rstudio

WORKDIR /home/rstudio  
ADD /app /home/rstudio
RUN Rscript -e 'install.packages("ggplot2")'

EXPOSE 8787

# anonymous volume
VOLUME /home

# https://rocker-project.org/images/versioned/rstudio.html
# This is comment, run this in command line
# docker build -t mybuild6-1 .
# docker run --name myapp6-1 --rm -it -p 8787:8787 mybuild6-1
# http://localhost:8787/

# named volume
# docker run --name myapp6-1 --rm -p 8787:8787 -v olympic_app1:/home/rstudio/result mybuild6-1
# (Another Terminal)> docker volume ls

# bind volume
# docker run --name myapp6-1 --rm -p 8787:8787 -v $PWD/result:/home/rstudio/result mybuild6-1
