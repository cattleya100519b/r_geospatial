packages <- c(
  "IRkernel",   # Jupyter Notebook で R を使用するためのカーネル
  "tidyverse",  # データ解析のためのパッケージ群（ggplot2, dplyr などを含む）
  "ggplot2",    # データ可視化ライブラリ
#   "dplyr",    # データ操作用のツール（tidyverse に含まれるが個別にも指定可能）
#   "shiny",    # Web アプリケーションを作成するためのパッケージ
  "data.table", # 高速なデータ処理・集計を可能にするライブラリ
  "pbdZMQ"      # ZeroMQ メッセージングライブラリの R バインディング
)

# 必要なパッケージを一括インストール
lapply(packages, install.packages)
