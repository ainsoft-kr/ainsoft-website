WEB_RUN_HOST ?= 0.0.0.0
WEB_RUN_PORT ?= 3900

.PHONY: web-run

web-run:
	@set -eu; \
	echo "Starting web dev server at http://localhost:$(WEB_RUN_PORT)"; \
	flutter run \
		-d web-server \
		--web-hostname="$(WEB_RUN_HOST)" \
		--web-port="$(WEB_RUN_PORT)"
