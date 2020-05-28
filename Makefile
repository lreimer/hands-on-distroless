.PHONY: agenda

define green
      @tput setaf 2
      @echo $1
      @tput sgr0
endef

agenda:
	@echo ""
	$(call green, "   make distroless/pull    - Step 1: Pull Distroless base images")
	$(call green, "   make distroless/history - Step 2: Show history for Distroless base images")
	$(call green, "   make distroless/busybox - Step 3: Build a Distroless image with BusyBox shell")
	$(call green, "   make distroless/golang  - Step 4: Build a Distroless image for Golang")
	$(call green, "   make distroless/spring  - Step 5: Build a Distroless image for Spring Boot")
	$(call green, "   make distroless/payara  - Step 6: Build a Distroless image for Payara Micro")

distroless/pull:
	$(call green, "# Use for 'mostly-statically compiled' languages like Go")
	docker pull gcr.io/distroless/static-debian10
	@echo ""

	$(call green, "# Use for most other applications (and Go apps that require libc/cgo)")
	docker pull gcr.io/distroless/base-debian10
	@echo ""

	$(call green, "# Use for 'mostly-statically compiled' languages like Rust and D")
	docker pull gcr.io/distroless/cc-debian10
	@echo ""

	$(call green, "# Use for Java applications requiring a OpenJDK8 based runtime")
	docker pull gcr.io/distroless/java:8
	@echo ""

	$(call green, "# Use for Java applications requiring a OpenJDK11 based runtime")
	docker pull gcr.io/distroless/java:11

distroless/history:
	docker history gcr.io/distroless/static-debian10
	@echo ""
	$(call green, "# Contains 1 Layer with")
	$(call green, "  - ca-certificates")
	$(call green, "  - /etc/passwd entry for root user")
	$(call green, "  - a /tmp directory")
	$(call green, "  - tzdata")
	@echo ""

	docker history gcr.io/distroless/base-debian10
	@echo ""
	$(call green, "# Contains 2 Layers with")
	$(call green, "  - everything from Distroless static image")
	$(call green, "  - glibc")
	@echo ""

	docker history gcr.io/distroless/cc-debian10
	@echo ""
	$(call green, "# Contains 3 Layers with")
	$(call green, "  - everything from Distroless base image")
	$(call green, "  - libgcc1 and its dependencies")
	@echo ""

	docker history gcr.io/distroless/java:8
	@echo ""
	$(call green, "# Contains 4 Layers with")
	$(call green, "  - everything from Distroless base image")
	$(call green, "  - OpenJDK8 and its dependencies")
	@echo ""

	docker history gcr.io/distroless/java:11
	@echo ""
	$(call green, "# Contains 4 Layers with")
	$(call green, "  - everything from Distroless base image")
	$(call green, "  - OpenJDK11 and its dependencies")
	@echo ""

distroless/busybox:
	@docker build -t lreimer/hands-on-distroless:busybox distroless-busybox/
	@echo ""
	$(call green, "Show history with 'docker history lreimer/hands-on-distroless:busybox'")
	@echo ""
	$(call green, "Run with 'docker run --rm -it lreimer/hands-on-distroless:busybox'")

distroless/golang:
	@docker build -t lreimer/hands-on-distroless:golang distroless-golang/
	@echo ""
	$(call green, "Show history with 'docker history lreimer/hands-on-distroless:golang'")	
	@echo ""
	$(call green, "Run with 'docker run --rm -it -p 8080:8080 lreimer/hands-on-distroless:golang'")

distroless/payara:
	@docker build -t lreimer/hands-on-distroless:payara distroless-payara/
	@echo ""
	$(call green, "Show history with 'docker history lreimer/hands-on-distroless:payara'")
	@echo ""
	$(call green, "Run with 'docker run --rm -it -p 8080:8080 lreimer/hands-on-distroless:payara'")

distroless/spring:
	@docker build -t lreimer/hands-on-distroless:spring distroless-spring/
	@echo ""
	$(call green, "Show history with 'docker history lreimer/hands-on-distroless:spring'")
	@echo ""
	$(call green, "Run with 'docker run --rm -it -p 8080:8080 lreimer/hands-on-distroless:spring'")
