include .env
export

up: open
	@docker compose up -d


down:
	@docker compose down


open:
	@open http://localhost:3000


pg:
	docker compose exec -it postgres psql -U $(DB_USER) -d $(DB_NAME)


install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install sqlpage
	sqlpage


format:
	find . -name "*.sql" -exec npx sql-formatter --config sqlformatter.json --fix {} \;
