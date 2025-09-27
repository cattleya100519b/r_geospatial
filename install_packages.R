packages <- c(
  "IRkernel",     # Jupyter Notebook で R を使用するためのカーネル
  "sf",           # GISデータ処理
  "NipponMap",    # 日本地図
  "RColorBrewer", # カラーパレット
  "geojsonio"     # sf オブジェクト（st_sf クラス）を notebook で表示
)

install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
}

invisible(lapply(packages, install_if_missing))