.PHONY = build clean rebuild publish
NAME = OPR\ Tokens\ Remover

SRC_DIR = src
BIN_DIR = dist
PUBLISH_DIR = $${HOME}/.local/share/Tabletop Simulator/Saves/Saved Objects/

#######################################################################

build:	\
	$(BIN_DIR)/$(NAME).json \
	$(BIN_DIR)/$(NAME).png

clean:
	rm -rf $(BIN_DIR)/*

rebuild:
	make clean build

publish: \
	$(BIN_DIR)/$(NAME).json \
	$(BIN_DIR)/$(NAME).png

	cp dist/* "$(PUBLISH_DIR)"

#######################################################################

node_modules:
	npm install

$(BIN_DIR)/$(NAME).json: \
	$(SRC_DIR)/object.json \
	$(SRC_DIR)/script.lua \
	$(SRC_DIR)/customUiAssets.json \
	$(SRC_DIR)/ui.xml \
	| $(BIN_DIR) \
	node_modules

	npx hbs-cli \
		--helper ./$(SRC_DIR)/helpers.js \
		--partial $(SRC_DIR)/script.lua \
		--partial $(SRC_DIR)/customUiAssets.json \
		--partial $(SRC_DIR)/ui.xml \
		--output $(BIN_DIR) \
		--extension json \
		$(SRC_DIR)/object.json && \
	mv $(BIN_DIR)/object.json "$@"

$(BIN_DIR)/$(NAME).png:	$(SRC_DIR)/thumb.png
	cp $< "$@"

$(BIN_DIR):
	mkdir $(BIN_DIR)
