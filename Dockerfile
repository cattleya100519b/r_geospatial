FROM rocker/tidyverse:latest

WORKDIR /app/src

# 必要なシステムライブラリをインストール
RUN apt-get update && apt-get install -y \
    libzmq3-dev \
    python3-venv \
    python3-pip

# Python仮想環境を作成し、その中に Jupyter をインストール
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install jupyter

# 環境変数を設定
ENV PATH="/opt/venv/bin:$PATH"

# Rのパッケージをインストール
COPY install_packages.R .
RUN Rscript install_packages.R

# IRKernel（JupyterでRを使うためのカーネル）をセットアップ
RUN R -e "IRkernel::installspec(user = FALSE)"

# Rのパスを通す
RUN R -e "file.create('~/.Rprofile'); write('options(repos = c(CRAN = \"https://cloud.r-project.org\"))', file = '~/.Rprofile', append = TRUE)"
