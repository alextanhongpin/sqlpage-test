include .env
export

install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install sqlpage
	sqlpage


up:
	@docker compose up -d


down:
	@docker compose down


pg:
	docker compose exec -it postgres psql -U $(DB_USER) -d $(DB_NAME)
