FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel
WORKDIR /workspace
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake libopenblas-dev liblapack-dev libx11-dev libgtk-3-dev \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir torchvision==0.5.0 opencv-python==4.2.0.34 dlib==19.21.0 jupyterlab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--notebook-dir=/workspace"]