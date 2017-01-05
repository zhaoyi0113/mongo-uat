FROM ubuntu:latest
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 \
	&& echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-3.4.list \ 
	&&  apt-get update \
	&&  apt-get install -y mongodb-org \
	&&  apt-get install -y python3 \
	&&  apt-get install -y python3-pip  \
	&&  apt-get install -y python-pip  \
	&& apt-get  install -y git \
	&& apt-get install -y  libfreetype6-dev \
	&& apt-get install -y libpng12-dev \
	&& pip3 install numpy \
	&& pip3 install ordereddict \
	&& pip3 install argparse \
	&& pip3 install python-dateutil \
	&& pip3 install matplotlib \
	&& pip3 install nose \
	&& pip3 install pymongo \
	&& pip3 install psutil \
	&& apt-get install -y nodejs \
	&& apt-get install -y npm 


RUN apt-get install -y curl && apt-get install -y vim && npm cache clean -f && npm install -g n && n stable

RUN ln -sf /usr/local/n/versions/node/7.4.0/bin /usr/bin/node

RUN git clone https://github.com/rueckstiess/mtools.git
RUN cd mtools && sed -i '/matplot/d' requirements.txt && pip install -r requirements.txt  && python setup.py install


