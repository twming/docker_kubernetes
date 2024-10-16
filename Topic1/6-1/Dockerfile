FROM rocker/rstudio

WORKDIR /home/rstudio  
ADD /app /home/rstudio

EXPOSE 8787

# anonymous volume
VOLUME /home

# https://rocker-project.org/images/versioned/rstudio.html
# This is comment, run this in command line
# docker build -t rstudio .
# docker run --rm -it -p 8787:8787 rstudio
# http://localhost:8787/
