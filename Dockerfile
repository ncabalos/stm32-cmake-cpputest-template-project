FROM ubuntu:24.04 AS build

ARG TOOLS_PATH=/opt/gcc-arm-none-eabi
ARG ARM_VERSION=13.3.rel1
ARG ARM_ARCH=x86_64

RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl xz-utils

RUN mkdir ${TOOLS_PATH} \
    && curl -Lo gcc-arm-none-eabi.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_VERSION}/binrel/arm-gnu-toolchain-${ARM_VERSION}-${ARM_ARCH}-arm-none-eabi.tar.xz" \
    && tar xf gcc-arm-none-eabi.tar.xz --strip-components=1 -C ${TOOLS_PATH} \
    && rm gcc-arm-none-eabi.tar.xz \
    && rm ${TOOLS_PATH}/*.txt \
    && rm -rf ${TOOLS_PATH}/share/doc

FROM ubuntu:24.04

ARG USERNAME=ubuntu

# Update repos
RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    locales locales-all sudo nano build-essential clang-format clang-tidy \
    cpputest git tig cmake wget gdb valgrind srecord \
    python3-pip python3-venv

COPY --from=build /opt/gcc-arm-none-eabi/ /usr/

RUN dpkg-reconfigure locales \
    && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8 \
    && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen \
    && locale-gen

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# [Optional] Add sudo support. Omit if you don't need to install software after connecting.
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

# create virtual environment and install pyeq3
SHELL ["/bin/bash", "-c"]

RUN python3 -m venv /home/ubuntu/.venv
RUN source /home/ubuntu/.venv/bin/activate \
    && pip install pyeq3 black

# Endless loop
# ENTRYPOINT ["tail", "-f", "/dev/null"]