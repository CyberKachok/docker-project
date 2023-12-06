FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
LABEL maintainer="Ilya"
RUN apt-get update -y
RUN apt-get -y install cmake liblog4cpp5-dev g++ libprotobuf-dev protobuf-compiler libv4l-dev git
ADD . /rtsp-docker
WORKDIR /rtsp-docker
RUN cd v4l2rtspserver && cmake .
RUN cd v4l2rtspserver && make
RUN cd v4l2rtspserver && make install


#ARG h
#ARG w
#ARG fps

#CMD v4l2rtspserver -W $w -H $h -F $fps -P 7447 /dev/video0

ENTRYPOINT ["v4l2rtspserver/run.sh"]
