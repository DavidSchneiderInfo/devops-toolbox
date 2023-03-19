all:
	docker-compose build

no-cache:
	docker-compose build --no-cache