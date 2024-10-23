FROM ubuntu:24.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install --no-install-recommends -y \
    git cmake ninja-build gperf \
    ccache dfu-util device-tree-compiler wget python3-venv \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
    make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1 \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv .venv \
    && source .venv/bin/activate \
    && pip install west \
    && git clone https://github.com/zmkfirmware/zmk \
    && cd zmk \
    && west init -l app \
    && west update \
    && west zephyr-export \
    && pip install -r zephyr/scripts/requirements-base.txt

COPY zephyr-sdk-0.17.0_linux-x86_64.tar.xz .
RUN tar xf zephyr-sdk-0.17.0_linux-x86_64.tar.xz \
    && cd zephyr-sdk-0.17.0 && ./setup.sh -t all -h -c
