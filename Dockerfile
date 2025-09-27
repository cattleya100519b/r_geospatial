FROM rocker/tidyverse:latest

WORKDIR /app/src

# 必要なシステムライブラリをインストール
# sf に必要なライブラリ（libgdal, libgeos, libproj）を追加
RUN apt-get update && apt-get install -y \
    libzmq3-dev \
    python3-venv \
    python3-pip \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libudunits2-dev \
    libjq-dev \
    && rm -rf /var/lib/apt/lists/*

# Python仮想環境を作成し、その中に Jupyter をインストール
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install jupyter

# 環境変数を設定
ENV PATH="/opt/venv/bin:$PATH"

# R のパッケージをインストール
COPY install_packages.R .
RUN Rscript install_packages.R

# IRKernel（JupyterでRを使うためのカーネル）をセットアップ
RUN R -e "IRkernel::installspec(user = FALSE)"

# R のパスを通す & CRAN ミラー設定
RUN echo 'options(repos = c(CRAN = "https://cloud.r-project.org"))' >> ~/.Rprofile