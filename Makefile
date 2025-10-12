.PHONY: build install uninstall clean help

EXECUTABLE_NAME := vale-mcp-server
BUILD_DIR := build
MAIN_FILE := $(BUILD_DIR)/index.js

help:
	@echo "Vale MCP Server - Make targets:"
	@echo "  make build      - Compile TypeScript to JavaScript"
	@echo "  make install    - Build and install executable globally via npm link"
	@echo "  make uninstall  - Remove executable from global npm"
	@echo "  make clean      - Remove build directory"
	@echo ""
	@echo "After installation, you can use: $(EXECUTABLE_NAME)"

build:
	@echo "Building Vale MCP Server..."
	@npm run build
	@echo "Build complete!"

install: build
	@echo "Installing Vale MCP Server globally..."
	@npm link
	@echo ""
	@echo "✓ Successfully installed $(EXECUTABLE_NAME)"
	@echo ""
	@echo "You can now use: $(EXECUTABLE_NAME)"
	@echo ""
	@echo "To find installation path, run: which $(EXECUTABLE_NAME)"
	@echo ""
	@echo "Note: The server will start even without Vale installed,"
	@echo "but you'll need Vale (https://vale.sh) for linting features."

uninstall:
	@echo "Uninstalling Vale MCP Server..."
	@npm unlink -g vale-mcp-server || true
	@echo "Uninstall complete!"

clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)
	@echo "Clean complete!"
