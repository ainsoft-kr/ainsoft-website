# ===============================
# Unified Sync DSL
# ===============================

.PHONY: sync

# ===== TARGET 매핑 =====
SYNC_ROOT_root   := .
SYNC_ROOT_app    := jungto-app-server
SYNC_ROOT_docker := jungto-docker-server
SYNC_ROOT_backend := $(if $(wildcard backend),backend,jungto-backend-server)
SYNC_ROOT_nhost  := $(if $(wildcard backend),backend,jungto-nhost-server)

SYNC_REMOTE_root   := .
SYNC_REMOTE_app    := app-server
SYNC_REMOTE_docker := docker-server
SYNC_REMOTE_backend := backend
SYNC_REMOTE_nhost  := docker-nhost

SYNC_ROOT := $(or $(SYNC_ROOT_$(TARGET)),$(error TARGET must be root, app, docker, or backend))
SYNC_REMOTE_DIR := $(SYNC_REMOTE_$(TARGET))

# ===== SYNC_HOST 계산 =====
compute_sync_host = \
  $(if $(NAME), \
    $(if $(ENV),jungto-$(NAME)-$(ENV),jungto-$(NAME)), \
    $(if $(ENV),jungto-$(ENV),jungto))

# ===== ENV 검증 (docker 전용 사용 가능) =====
validate_env = \
  $(if $(filter $(1),prod dev staging),, \
    $(error ENV must be prod dev staging))

# ===== docker 전용 exclude =====
compute_excludes = \
  $(foreach e,$(filter-out $(1),prod dev staging),--exclude 'data/$(e)')

# ===============================
# Sync Entry
# ===============================
sync:
	$(eval SYNC_HOST := $(call compute_sync_host))
	@echo "TARGET=$(TARGET)"
	@echo "SYNC_HOST=$(SYNC_HOST)"
	@echo "REMOTE_DIR=$(SYNC_REMOTE_DIR)"

ifeq ($(TARGET),root)

	@echo "Syncing root-level infra files..."

	@rsync -avz \
		-e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
		mk/ \
		ec2-user@$(SYNC_HOST):mk/

	@rsync -avz \
		-e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
		Makefile README \
		ec2-user@$(SYNC_HOST):

else ifeq ($(TARGET),app)

	@rsync -avz \
	  $(call compute_excludes,$(ENV)) \
		--exclude 'data/$(ENV)/logs' \
		--exclude 'app/$(ENV)' \
		-e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
		--progress $(SYNC_ROOT)/ ec2-user@$(SYNC_HOST):$(SYNC_REMOTE_DIR)/ --delete

else ifeq ($(TARGET),docker)

	$(call validate_env,$(ENV))

	@rsync -avz \
		--exclude '.*' \
		$(call compute_excludes,$(ENV)) \
		--exclude 'data/$(ENV)/logs' \
		--exclude 'data/$(ENV)/alloy/data' \
		--exclude 'data/$(ENV)/nginx/www' \
		--exclude 'data/$(ENV)/postgresql/primary/data' \
		--exclude 'data/$(ENV)/postgresql/secondary/data' \
		--exclude 'data/$(ENV)/postgresql/replica/data' \
		--exclude 'data/$(ENV)/mariadb/data' \
		--exclude 'data/$(ENV)/mongodb/data' \
		--exclude 'data/$(ENV)/certbot' \
		--exclude 'data/$(ENV)/plane/logs' \
		--exclude 'data/$(ENV)/plane/uploads' \
		-e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
		--progress $(SYNC_ROOT)/ ec2-user@$(SYNC_HOST):$(SYNC_REMOTE_DIR)/ --delete

	@if [ "$(SYNC_HOST)" = "jungto-global-web-prod" ]; then \
		ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ec2-user@$(SYNC_HOST) \
		'cd ~/docker-server/data/$(ENV)/nginx/conf && rm -rf sites-enabled && ln -s sites-global-enabled sites-enabled'; \
	fi

	@if [ "$(SYNC_HOST)" = "jungto-prod" ]; then \
		ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ec2-user@$(SYNC_HOST) \
		'cd ~/docker-server/data/$(ENV)/nginx/conf && rm -rf sites-enabled && ln -s sites-jungto-enabled sites-enabled'; \
	fi

else ifeq ($(TARGET),backend)

	@rsync -avz \
		--exclude 'data/logs' \
		--exclude 'functions/pnpm-lock.yaml' \
		--exclude 'functions/.pnpm-store' \
		--exclude '.nhost' \
		--exclude 'functions/node_modules' \
		-e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
		--progress $(SYNC_ROOT)/ ec2-user@$(SYNC_HOST):$(SYNC_REMOTE_DIR)/ --delete

else ifeq ($(TARGET),nhost)

	@rsync -avz \
		--exclude 'data/logs' \
		--exclude 'functions/pnpm-lock.yaml' \
		--exclude 'functions/.pnpm-store' \
		--exclude '.nhost' \
		--exclude 'functions/node_modules' \
		-e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
		--progress $(SYNC_ROOT)/ ec2-user@$(SYNC_HOST):$(SYNC_REMOTE_DIR)/ --delete

else
	$(error TARGET must be root, app, docker, or backend)
endif
