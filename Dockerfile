FROM ubuntu:latest
RUN apt update
RUN apt install -y cmake make g++ unzip
RUN apt install -y wget
RUN mkdir /proj
COPY proj /proj
WORKDIR /proj
RUN wget https://download.pytorch.org/libtorch/nightly/cpu/libtorch-shared-with-deps-latest.zip
RUN unzip libtorch-shared-with-deps-latest.zip
RUN cmake -DCMAKE_PREFIX_PATH=./libtorch .
RUN make -j
