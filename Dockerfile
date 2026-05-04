FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel

WORKDIR /workspace

# 修复已停止维护的 Ubuntu 软件源
RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

# 安装编译 Dlib 需要的系统库
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake libopenblas-dev liblapack-dev libx11-dev libgtk-3-dev \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python 依赖
RUN pip install --no-cache-dir torchvision==0.5.0 opencv-python==4.2.0.34 dlib==19.21.0 jupyterlab

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--notebook-dir=/workspace"]
