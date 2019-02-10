FROM neo4j:3.0

#HTTP
EXPOSE 7474
#HTTPS
EXPOSE 7473
#Bolt
EXPOSE 7687

#deprecated by neo4j
#VOLUME ["/data"]
#VOLUME ["/logs"]

RUN apt update && apt update -y

RUN apt install -y git python-pip

COPY [".", "POLAR/"]

WORKDIR /var/lib/neo4j/POLAR
RUN ["pip", "install", "-r", "requirements.txt"]

WORKDIR /var/lib/neo4j