.PHONY: all bench build configure test clean

LUAU := luau
ROJO := rojo
DARKLUA := darklua
WALLY := wally
AFTMAN := aftman
WALLY_TYPES := wally-package-types

BUILD_DIR := build
PACKAGES_DIR := Packages
TESTS_DIR := tests
BENCHES_DIR := benches

SRC_DIRS := assets client server modules std ui sys

all: configure build test bench

bench:
	@echo "Running benchmarks..."
	@for file in $(BENCHES_DIR)/*.bench.luau; do \
		echo "Running $$file"; \
		$(LUAU) $$file --codegen -O2 || exit 1; \
	done

build: configure
	@echo "Building project..."
	@if [ ! -d "$(PACKAGES_DIR)" ]; then \
		$(MAKE) configure; \
	fi
	$(ROJO) sourcemap default.project.json --output sourcemap.json
	@rm -rf $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)
	@for dir in $(SRC_DIRS); do \
		echo "Processing $$dir..."; \
		ROBLOX_DEV=false $(DARKLUA) process --config .darklua.json $$dir $(BUILD_DIR)/$$dir || exit 1; \
	done
	$(ROJO) build build.project.json --output $(BUILD_DIR)/output.rbxlx

configure:
	@echo "Configuring development environment..."
	$(AFTMAN) install
	$(WALLY) install
	$(ROJO) sourcemap default.project.json -o sourcemap.json
	$(WALLY_TYPES) --sourcemap sourcemap.json $(PACKAGES_DIR)/

test:
	@echo "Running tests..."
	@for file in $(TESTS_DIR)/*.spec.luau; do \
		echo "Testing $$file"; \
		$(LUAU) $$file || exit 1; \
	done

clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)
	rm -f sourcemap.json

help:
	@echo "Available targets:"
	@echo "  all        - Run configure, build, test, and bench targets"
	@echo "  bench      - Run all benchmark files"
	@echo "  build      - Build the project"
	@echo "  configure  - Set up development environment"
	@echo "  test       - Run all test files"
	@echo "  clean      - Remove build artifacts"
	@echo "  help       - Show this help message"