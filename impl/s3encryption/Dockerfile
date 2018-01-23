FROM local-aws-base:latest
MAINTAINER Andy Kirkham <andy@spiders-lair.com>

RUN mkdir -p /tmp/build/build
WORKDIR /tmp/build/build

RUN curl -sSL https://raw.githubusercontent.com/awsdocs/aws-doc-sdk-examples/master/cpp/example_code/s3encryption/s3Encryption.cpp > s3Encryption.cpp
RUN curl -sSL https://raw.githubusercontent.com/awsdocs/aws-doc-sdk-examples/master/cpp/example_code/s3encryption/CMakeLists.txt > CMakeLists.txt

RUN cmake . && make && sudo cp s3Encryption /usr/local/bin/

RUN make clean
WORKDIR /tmp
RUN rm -rf build
WORKDIR /

	




