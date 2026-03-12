# 프로젝트 전용 설정
TARGET ?= docker
BACKEND_APPS := postgres,opensearch,traefik,graphql,auth,storage,functions,dashboard,configserver,console
APPS ?= $(if $(filter nhost backend,$(TARGET)),$(BACKEND_APPS),nginx)
WEB_BUILD_BASE_HREF ?= /

STACK_NAME := jungto

HAS_JUNGTO := $(wildcard jungto-app-server jungto-docker-server jungto-backend-server jungto-nhost-server)

STACK_ROOT := \
	$(if $(filter root,$(TARGET)),root, \
		$(if $(filter app,$(TARGET)), \
			$(if $(HAS_JUNGTO),jungto-app-server,app-server), \
		$(if $(filter docker,$(TARGET)), \
			$(if $(HAS_JUNGTO),jungto-docker-server,docker-server), \
			$(if $(filter nhost backend,$(TARGET)), \
				$(if $(wildcard backend),backend,$(if $(HAS_JUNGTO),jungto-backend-server,$(if $(wildcard nhost),nhost,nhost-server))), \
				$(error TARGET must be root, app, docker, or backend)))))

.PHONY: help web-build
help:
	@echo "Usage:"
	@echo "  make sync  TARGET=<root|app|docker|backend> ENV=<dev|staging|prod> [NAME=<host-suffix>]"
	@echo "  make web-run [WEB_RUN_PORT=<port>]"
	@echo "  make web-build [WEB_BUILD_BASE_HREF=/your-path/]"
	@echo ""
	@echo "Examples (명령어별):"
	@echo "  make sync TARGET=docker ENV=prod"
	@echo "    - docker 서버 소스를 원격 호스트로 동기화합니다."
	@echo "  make login-ghcr GHCR_USER=<user> GHCR_TOKEN=<token>"
	@echo "    - GHCR 레지스트리에 로그인합니다."
	@echo "  make web-run"
	@echo "    - Flutter web 개발 서버를 실행하고 브라우저에서 접근할 수 있는 URL을 제공합니다."
	@echo "  make web-build"
	@echo "    - 배포용 Flutter web 정적 파일을 build/web 에 생성합니다."
	@echo "  make web-build WEB_BUILD_BASE_HREF=/corp/"
	@echo "    - 서브 경로 배포용 base href 를 반영해 build/web 을 생성합니다."

web-build:
	@set -eu; \
	echo "Building Flutter web app"; \
	echo "  base href: $(WEB_BUILD_BASE_HREF)"; \
	flutter build web --release --base-href "$(WEB_BUILD_BASE_HREF)"; \
	echo "Build output: $(CURDIR)/build/web"

include mk/stack.sync.mk
include mk/e2e.mk
