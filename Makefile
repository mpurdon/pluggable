PLATFORM= darwin
BUILD_CMD= env GOOS=${PLATFORM} go build -ldflags="-s -w" -o
BUILD_PLUGINS_CMD= env GOOS=${PLATFORM} go build -buildmode=plugin -ldflags="-s -w" -o

build:
	go mod tidy
	${BUILD_PLUGINS_CMD} plugins/cipher.so plugins/cipher.go
	${BUILD_CMD} pluggable main.go

clean:
	rm plugins/cipher.so
	rm pluggable
