repo:=jeyrce/whitebox_exporter
version:=latest
imageName:=${repo}:${version}
commitId:=$(shell git rev-parse --short HEAD)
buildAt:=$(shell date "+%Y-%m-%d %H:%M:%S")
branch:=$(shell git symbolic-ref --short -q HEAD)

.phony: all
all: lint binary image

.phony: binary
binary:
	go build -ldflags " \
		-X 'github.com/prometheus/common/version.Version=${version}' \
		-X 'github.com/prometheus/common/version.Revision=${commitId}' \
		-X 'github.com/prometheus/common/version.Branch=${branch}' \
		-X 'github.com/prometheus/common/version.BuildUser=skrbox' \
		-X 'github.com/prometheus/common/version.BuildDate=${buildAt}' \
	" -o whitebox_exporter .

.phony: image
image:
	docker build -t ${imageName} .
	docker push ${imageName}

.phony: lint
lint:
	@echo "make lint"
