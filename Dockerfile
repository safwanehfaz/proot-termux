FROM ubuntu:latest AS proot-builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install -y -qq \
    gcc \
    make \
    libtalloc-dev \
    gdb \
    strace \
    coreutils \
    python3-pip \
    curl \
    git && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --break-system-packages cpp-coveralls

WORKDIR /app

COPY . .

RUN make -C src loader.exe loader-m32.exe build.h