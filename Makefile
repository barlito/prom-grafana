stack_name=prometheus

# Container
app_container_id = $(shell docker ps --filter name="$(stack_name)" -q)

.PHONY: bash
bash:
	docker exec -it -u root $(app_container_id) sh

.PHONY: deploy
deploy:
	docker compose up -d

.PHONY: undeploy
undeploy:
	docker compose down

.Phone: restart
restart:
	make undeploy
	make deploy

.PHONY: logs
logs:
	docker compose logs -f
