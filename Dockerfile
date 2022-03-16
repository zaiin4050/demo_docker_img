FROM nvcr.io/nvidia/tensorrt:20.12-py3
# CUDA 11.1 / cuDNN 8.0.5 / TensorRT 7.2.2 - nvidia-driver 450.80 or higher

WORKDIR /
RUN ["/bin/bash"]

# Disable the interactive modal during the package install process
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install -y -q

# Common package installation (for openv build and demo operation)
RUN apt-get update && apt install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt install -y --no-install-recommends wget git cmake pkg-config unzip \
        build-essential libssl-dev protobuf-compiler libprotoc-dev \
        libopenblas-dev gfortran libjpeg8-dev libxslt1-dev libfreetype6-dev sudo \
        x11-apps libgtk-3-dev

# opencv 3.4.5 download & build 
RUN wget https://soynet.io/demo/opencv_345_install.sh
RUN bash ./opencv_345_install.sh
