FROM python

WORKDIR /app
COPY /app /app
RUN pip install --trusted-host pypi.python.org -r requirements.txt
EXPOSE 80

ENV NAME="Docker Learner"

CMD echo "Your NAME environement variable is :${NAME}"; python3 app.py

# This is comment, run this in command line
# docker build -t mybuild5 .
# docker images
# docker run --name myapp5 --rm -p 8080:80 mybuild5
# http://localhost:8080/
