# pull the official base image
FROM python:3.8.3-alpine
# setup environment variable  
ENV DockerHOME=/usr/src/app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory  
RUN mkdir -p $DockerHOME  

# where your code lives  
WORKDIR $DockerHOME 

# install dependencies
RUN apk add build-base
RUN pip install --upgrade pip 
COPY ./requirements $DockerHOME
RUN pip install -r requirements

# copy project
COPY ./app $DockerHOME

# port where the Django app runs  
EXPOSE 8000  
# start server  
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]