FROM tensorflow/tensorflow:1.0.1-gpu
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update && apt-get install -y --no-install-recommends git wget && \ 
	rm -rf /var/lib/apt/lists/* && \
	wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb && \
        dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb && \
        apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
        apt-get update && \
        apt-get -y install cuda

RUN pip install keras==1.0.1 jupyter tqdm

WORKDIR /home/sg/
RUN mkdir /home/sg/data && git clone https://github.com/da03/Attention-OCR.git

CMD jupyter-notebook --notebook-dir=/home/sg --port=8887


