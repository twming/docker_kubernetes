FROM python

LABEL maintainer="DockerLearner@mail.com>"
LABEL version="1.0"
LABEL description="Jupyter notebook for Docker learning."

WORKDIR /app  
ADD /app /app
RUN pip install numpy pandas  seaborn jupyter
EXPOSE 8888

CMD ["jupyter","notebook","--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

# This is comment, run this in command line
# docker build -t mybuild7 .
# docker run --name myapp7 -p 8888:8888 mybuild7
# http://localhost:8888/

# docker commit myapp7
# docker tag <image_id> <account>/jupyterdocker
# docker login
# docker push <account>/jupyterdocker