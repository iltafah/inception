
COMPOSE-FILE-PATH = ./srcs/docker-compose.yml


build:
	docker compose -f $(COMPOSE-FILE-PATH) build --no-cache &
	./script.sh

start:
	docker compose -f $(COMPOSE-FILE-PATH) up -d 

stop:
	docker compose -f $(COMPOSE-FILE-PATH) stop

restart:
	docker compose -f $(COMPOSE-FILE-PATH) restart

clean:
	docker compose -f $(COMPOSE-FILE-PATH) down -v