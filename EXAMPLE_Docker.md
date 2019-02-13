* Example - Docker
** Structure
The docker scripts uses two containers: neo4j and polar. The neo4j docker holds the frontend GUI with a website at http://localhost:7474/
username: neo4j
password: test

once the neo4j container is running, the scripts updates its password to the non default "test" (don't use this for real!) and the launches the polar container.

the polar container is scanning all files copied to it from the data/ folder - and pushes metadata over bolt:// to the neo4j instance. as the analysis is complete - you can query the information in the frontend.

* Creating the filesystem
In order to run the Example in Docker you need to follow these steps (or use the scripts):

** "build.sh" script
The build script build the "polar" conatainer with all needed dependencies, and copies the filesystem from the data/ directory 

** "run.sh" script
starts up the neo4j container, updating the default password.
the it runs the polar container, goes over each file, analyse it and send the information to neo4j. once the analysis is complete you can use the frontend to query the data