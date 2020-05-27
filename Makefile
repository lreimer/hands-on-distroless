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
	$(call green, "   make distroless/java    - Step 5: Build a Distroless image for plain Java")
	$(call green, "   make distroless/payara  - Step 6: Build a Distroless image for Payara Micro")
	$(call green, "   make distroless/spring  - Step 7: Build a Distroless image for Spring Boot")

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

	docker history gcr.io/distroless/base-debian10
	@echo ""

	docker history gcr.io/distroless/cc-debian10
	@echo ""

	docker history gcr.io/distroless/java:8
	@echo ""

	docker history gcr.io/distroless/java:11

distroless/busybox:
	@docker build -t lreimer/hands-on-distroless:busybox distroless-busybox/
	@echo ""
	$(call green, "Try with 'docker run --rm -it lreimer/hands-on-distroless:busybox'")

distroless/golang:
	@docker build -t lreimer/hands-on-distroless:golang distroless-golang/
	@echo ""
	$(call green, "Try with 'docker run --rm -it -p 8080:8080 lreimer/hands-on-distroless:golang'")

distroless/java:
	@docker build -t lreimer/hands-on-distroless:java distroless-java/
	@echo ""
	$(call green, "Try with 'docker run --rm -it -p 8080:8080 lreimer/hands-on-distroless:java'")

distroless/payara:
	@docker build -t hands-on-distroless:payara distroless-payara/
	@echo ""
	$(call green, "Try with 'docker run --rm -it -p 8080:8080 lreimer/hands-on-distroless:payara'")

distroless/spring:
	@docker build -t hands-on-distroless:spring distroless-spring/
	@echo ""
	$(call green, "Try with 'docker run --rm -it -p 8080:8080 lreimer/hands-on-distroless:spring'")
