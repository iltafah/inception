
COMPOSE-FILE-PATH = ./srcs/docker-compose.yml


build:
	@docker compose -f $(COMPOSE-FILE-PATH) build --no-cache --progress plain 2>/dev/null | ./script.bash

start:
	docker compose -f $(COMPOSE-FILE-PATH) up -d 

stop:
	docker compose -f $(COMPOSE-FILE-PATH) stop

restart:
	docker compose -f $(COMPOSE-FILE-PATH) restart

clean:
	docker compose -f $(COMPOSE-FILE-PATH) down -v