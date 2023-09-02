UID := $(shell id -u)
GID := $(shell id -g)
UNAME_USER := $(shell whoami)
GNAME_USER := $(shell id -gn)
USER_PASSWORD := "dev@dev"

build:
	docker build -t=docker-permissions:0.1 --build-arg UID=${UID} --build-arg GID=${GID} --build-arg UNAME=${UNAME_USER} --build-arg GNAME=${GNAME_USER} --build-arg USER_PASSWORD=${USER_PASSWORD} .

run:
	docker run -v /data -u ${UID}:${GID} -d docker-permissions:0.1 /bin/bash -c "while true; do sleep 1; done"

docker-build-compose:
	docker compose build --build-arg UID=${UID} --build-arg GID=${GID} --build-arg UNAME=${UNAME_USER} --build-arg GNAME=${GNAME_USER} --build-arg USER_PASSWORD=${USER_PASSWORD}