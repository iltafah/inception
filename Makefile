# define my_func
#     $(eval $@_PROTOCOL = "https:")
#     $(eval $@_HOSTNAME = $(1))
#     $(eval $@_PORT = $(2))
#     echo "${$@_PROTOCOL}//${$@_HOSTNAME}:${$@_PORT}/"
# endef

# my-target:
#     @$(call my_func,"example.com",8000)


COMPOSE_FILE_PATH = ./srcs/docker-compose.yml

# IMG_BUILT ?= 0
# EXIT_AND_DNT_PRINT_MAKEFILE_ERROR =  || if [[ $? -ne 0 ]]; then echo meow; ERR = 1 ; echo ERR = $(ERR) && exit 0; fi

# ERR?=5

#WHEN RUNNING IT ONLY WITH ONE SERVICE IT WON'T WORK - Well Not any more :3
up:
# @echo $$?
# @err=`cat .env.mk | grep ERR | cut -d "=" -f2-`; echo $$err; if [[ $$err -eq 1337 ]]; then echo a; make build 2>/dev/null; echo b; fi;
	@echo "ERR=1337" > .env.mk
	@make build
	@err=`cat .env.mk | grep ERR | cut -d "=" -f2-`;\
		if [[ $$err -eq 1337 ]];\
		then\
			make create;\
		fi;
	@rm .env.mk
# @make build 2>/dev/null || echo uwu
# @echod geijrog
# @echo $$?
# @make create 2>/dev/null

build:
	@(docker compose -f $(COMPOSE_FILE_PATH) build --no-cache --progress plain 2>&1 | ./script.bash $(COMPOSE_FILE_PATH)) || echo "ERR=42" > .env.mk

create:
	@docker compose -f $(COMPOSE_FILE_PATH) up -d

start:
	@docker compose -f $(COMPOSE_FILE_PATH) start

stop:
	@docker compose -f $(COMPOSE_FILE_PATH) stop

restart:
	@docker compose -f $(COMPOSE_FILE_PATH) restart

clean:
	@docker compose -f $(COMPOSE_FILE_PATH) down -v --rmi all
	@rm -rf /Users/iltafah/Desktop/Temp\ Volume/WordPress/WordPress

re:
	@make clean
	@make
