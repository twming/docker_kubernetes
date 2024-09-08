FROM python

WORKDIR /app  
ADD /app /app
RUN pip install numpy pandas  seaborn jupyter
EXPOSE 8888

# anonymous volume
VOLUME /app

CMD ["jupyter","notebook","--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

# This is comment, run this in command line
# docker build -t mybuild6 .
# docker images
# docker run --name myapp6 --rm -p 8888:8888 mybuild6
# http://localhost:8888/
# (Another Terminal)> docker volume ls


# named volume
# docker run --name myapp6 --rm -p 8888:8888 -v olympic_app:/app mybuild6
# (Another Terminal)> docker volume ls

# bind volume
# docker run --name myapp6 --rm -p 8888:8888 -v $PWD/result:/result mybuild6