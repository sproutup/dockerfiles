REPO=sproutupco
NAME=alpine-java-openjdk
CORE_VERSION=HEAD

all: prepare build

prepare:
	git archive -o docker/echoapp.tar HEAD

build:
	docker build -t $(REPO)/$(NAME) --rm .

tag_latest:
	docker tag $(REPO):$(NAME) $(NAME):latest

test:
	nosetests -sv

push:
	docker push $(REPO)/$(NAME)

run:
	docker run -p 9000:9000 -it --rm $(REPO)/$(NAME) /bin/sh
