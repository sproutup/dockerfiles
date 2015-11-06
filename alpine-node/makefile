REPO=sproutupco
NAME=alpine-node
CORE_VERSION=HEAD

all: build

prepare:

build:
	docker build -t $(REPO)/$(NAME) --rm .

tag_latest:
	docker tag $(REPO):$(NAME) $(NAME):latest

test:

push:
	docker push $(REPO)/$(NAME)

run:
	docker run -p 9000:9000 -it --rm $(REPO)/$(NAME) /bin/sh
