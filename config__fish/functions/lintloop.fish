function lintloop -d "lint looper"
  ino (pwd) golangci-lint run --enable-all *.go
end
