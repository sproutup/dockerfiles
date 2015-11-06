REPO=sproutupco
NAME=alpine-jenkins
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
