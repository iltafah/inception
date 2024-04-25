
COMPOSE-FILE-PATH = ./srcs/docker-compose.yml

# @docker compose -f $(COMPOSE-FILE-PATH) build --no-cache --progress plain 2>/dev/null | ./script.bash;

build:
	@docker compose -f $(COMPOSE-FILE-PATH) build --no-cache --progress plain 2>/dev/null | ./script.bash
# @if $? -ne 0 then echo "Bro go and turn on the Docker Deamon"; fi;

start:
	docker compose -f $(COMPOSE-FILE-PATH) up -d 

stop:
	docker compose -f $(COMPOSE-FILE-PATH) stop

restart:
	docker compose -f $(COMPOSE-FILE-PATH) restart

clean:
	docker compose -f $(COMPOSE-FILE-PATH) down -v
	
#docker volume rm $(docker volume ls -q)