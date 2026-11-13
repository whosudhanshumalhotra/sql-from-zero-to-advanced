.PHONY: up down logs shell test reset

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f postgres

shell:
	docker exec -it sql-learning-postgres psql -U learner -d sql_learning

test:
	./scripts/verify.sh

# DESTRUCTIVE: removes the local PostgreSQL volume and all practice data.
reset:
	docker compose down -v
	docker compose up -d
