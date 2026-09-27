# Makefile to Lua and SQL scripts from their templates

PWD=$(shell pwd)
IMPORT_DIR=$(PWD)/import
BUILD_DIR=$(PWD)/build
NODE=node

all: $(BUILD_DIR)/tags.lua $(BUILD_DIR)/signal_features.sql $(BUILD_DIR)/operators.sql

clean:
	rm -f $(BUILD_DIR)/tags.lua $(BUILD_DIR)/signal_features.sql $(BUILD_DIR)/operators.sql

$(BUILD_DIR)/tags.lua: $(IMPORT_DIR)/tags.lua.js
	mkdir -p $(BUILD_DIR)
	$(NODE) "$<" "$(PWD)/features" > "$@"

$(BUILD_DIR)/signal_features.sql: $(IMPORT_DIR)/sql/signal_features.sql.js
	mkdir -p $(BUILD_DIR)
	$(NODE) "$<" "$(PWD)" > "$@"

$(BUILD_DIR)/operators.sql: $(IMPORT_DIR)/sql/operators.sql.js
	mkdir -p $(BUILD_DIR)
	$(NODE) "$<" "$(PWD)/features" > "$@"
