FROM python:2
RUN apt-get update
RUN apt-get -y install python-pip
RUN apt-get update
RUN pip install --upgrade pip
WORKDIR /notejam
COPY . /notejam
EXPOSE 8000
RUN pip install -r requirements.txt 
WORKDIR /notejam/notejam
RUN chmod 777 ./command.sh
