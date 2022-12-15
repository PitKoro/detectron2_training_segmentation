FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

RUN apt-get -y update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get -y install git
RUN apt-get install -y wget

RUN python -m pip install pyyaml==5.1
RUN python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'
RUN pip install tqdm opencv-python jupyterlab fiftyone
WORKDIR /app

EXPOSE 8888
ENTRYPOINT jupyter lab --ip=0.0.0.0 --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password=''