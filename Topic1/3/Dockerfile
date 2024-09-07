FROM ubuntu

WORKDIR /data
ADD /data /data

RUN apt-get update 
RUN apt-get install -y python3

# python code to add 2 numbers in the file
CMD ["python3","/data/add.py"]

# This is comment, run this in command line
# docker build -t mybuild3 .
# docker images
# docker run --name myapp3 --rm mybuild3