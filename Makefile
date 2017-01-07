help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  update     to make a Composer update then a Bower update"
	@echo "  clean      to remove and warmup cache"
	@echo "  assets     to install assets"
	@echo "  optimize   to optimize sandbox"
	@echo "  start      to start docker container"
	@echo "  stop       to stop docker container"

assets: clean-assets install-assets

clean-assets:
	rm -rf ./data/code/web/assets/*
	rm -rf ./data/code/web/bundles/*

install-assets:
	docker-compose run --rm symfony app/console --env=prod assets:install
	docker-compose run --rm symfony app/console --env=prod assetic:dump

clean:
	rm -rf ./data/code/app/cache/*
	rm -rf ./data/code/app/logs/*
	docker-compose run --rm symfony app/console cache:warmup --env=prod --no-debug
	docker-compose run --rm symfony app/console cache:warmup --env=dev

update: update-deps

update-deps:
	docker-compose run --rm symfony composer update

optimize:
	docker-compose run --rm symfony composer dump-autoload -o

start:
	docker-compose up -d

stop:
	docker-compose stop
