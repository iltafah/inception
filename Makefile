
include $(PWD)/srcs/.env
COMPOSE_FILE_PATH = ./srcs/docker-compose.yml


#WHEN RUNNING IT ONLY WITH ONE SERVICE IT WON'T WORK - Well Not any more :3
up:
	@echo 'Creating Wordpress & MariaDb volumes:'
	@mkdir -p $(MariaDbVolumePath)
	@echo "Mariadb Volume has been created: $(MariaDbVolumePath)"
	@mkdir -p $(WordPressVolumePath)
	@echo "WordPress Volume has been created: $(WordPressVolumePath)"
	@echo "ERR=1337" > .env.mk
	@make build
	@err=`cat .env.mk | grep ERR | cut -d "=" -f2-`;\
		if [ $$err -eq 1337 ];\
		then\
			make create;\
		fi;
	@rm .env.mk

build:
	@(docker compose -f $(COMPOSE_FILE_PATH) build --no-cache --progress plain 2>&1 | ./WhaleScript.bash $(COMPOSE_FILE_PATH)) || echo "ERR=42" > .env.mk

create:
	@docker compose -f $(COMPOSE_FILE_PATH) up -d

start:
	@docker compose -f $(COMPOSE_FILE_PATH) start

stop:
	@docker compose -f $(COMPOSE_FILE_PATH) stop

restart:
	@docker compose -f $(COMPOSE_FILE_PATH) restart

down:
	@docker compose -f $(COMPOSE_FILE_PATH) down

clean:
	@docker compose -f $(COMPOSE_FILE_PATH) down --remove-orphans -v --rmi all
	@rm -rf $(WordPressVolumePath)
	@rm -rf $(MariaDbVolumePath)

re:
	@make clean
	@make
