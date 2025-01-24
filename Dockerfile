FROM ubuntu:24.04

ENV UDEV=1

# Install tools
RUN apt-get update && apt-get upgrade -y

RUN apt install -y \
    make \
    git \
    cmake \
    perl \
    python3 \
    libusb-1.0-0 \
    libxcb-xinerama0 \
    libglib2.0-0 \
    libgl1-mesa-dev \
    sudo \
    python3-pip \
    udev

RUN pip install --break-system-packages black
RUN pip install --break-system-packages pyserial
RUN pip install --break-system-packages PyYAML


ARG MTB_VERSION
# Environment variables
ENV HOME=/home/ubuntu
COPY modustoolbox_3.4.0.17114_Linux_x64.deb ${HOME}
ENV CY_TOOLS_PATH=/opt/Tools/ModusToolbox/tools_3.4

#Install MTB
RUN apt install -y ${HOME}/modustoolbox_3.4.0.17114_Linux_x64.deb
ENV PATH="${CY_TOOLS_PATH}/openocd/bin:${CY_TOOLS_PATH}/library-manager:${CY_TOOLS_PATH}/fw-loader/bin:${CY_TOOLS_PATH}/gcc/bin:$PATH"

CMD ["/bin/bash"]

