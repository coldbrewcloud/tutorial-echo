build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o echo

deploy: build
	coldbrew deploy

.PHONY: build deploy
