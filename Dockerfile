#FROM neo4j:3.0
FROM phusion/baseimage:0.11

#HTTP, HTTPS, Bolt
#EXPOSE 7474 7473 7687

RUN    apt update \
    && apt upgrade -y \
    && apt install -y python-pip radare2

#WORKDIR /var/lib/neo4j
#ENV PATH /var/lib/neo4j/bin:$PATH
#RUN    neo4j start \
#    && sleep 5
#RUN curl -v -H "Content-Type: application/json" -X POST -d '{"password":"test"}' -u neo4j:neo4j http://localhost:7474/user/neo4j/password

WORKDIR /home/POLAR
COPY ["requirements.txt", "."]
RUN pip install -r requirements.txt

COPY [".", "."]
RUN python setup.py install
#RUN ["scan_data_dir.py"]

CMD ["/bin/bash"]