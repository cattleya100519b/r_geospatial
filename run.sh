# macOS (arm64) でのみ実行
if [ "$(uname -m)" = "arm64" ]; then
  export DOCKER_DEFAULT_PLATFORM=linux/amd64
fi

# build image -> run container -> run bash -> remove container
docker-compose run --rm --build app bash