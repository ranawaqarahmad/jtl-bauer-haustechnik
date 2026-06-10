.PHONY: up down restart logs import-db shell-php shell-mysql status build

include .env
export

up:
	docker compose up -d --build
	@echo "Shop:       http://localhost:8080"
	@echo "phpMyAdmin: http://localhost:8081"

down:
	docker compose down

restart:
	docker compose restart

build:
	docker compose build --no-cache

logs:
	docker compose logs -f

logs-nginx:
	docker compose logs -f nginx

logs-php:
	docker compose logs -f php

import-db:
	@echo "Waiting for MySQL to be ready..."
	@docker compose exec mysql mysqladmin ping -h localhost -u root -p$(MYSQL_ROOT_PASSWORD) --wait=30 --silent
	@echo "Importing database..."
	@docker compose exec -T mysql mysql \
		-u root -p$(MYSQL_ROOT_PASSWORD) \
		--default-character-set=utf8mb4 \
		$(DB_NAME) < jtlshop_bauer_db.sql
	@echo "Updating shop URL for local development..."
	@docker compose exec mysql mysql \
		-u root -p$(MYSQL_ROOT_PASSWORD) \
		$(DB_NAME) -e "UPDATE teinstellungen SET cWert='http://localhost:8080/' WHERE cName='shop_url';" 2>/dev/null || true
	@echo "Import complete."

shell-php:
	docker compose exec php bash

shell-mysql:
	docker compose exec mysql mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME)

status:
	docker compose ps

clean:
	docker compose down -v
	@echo "All containers and volumes removed."
