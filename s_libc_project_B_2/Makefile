# Variables
CC=gcc
CFLAGS=-m32
LDFLAGS=-L./lib
LDLIBS=-ls_libc
SRC_DIR=./src
BUILD_DIR=./build
LIB_DIR=./lib
TEST_DIR=./test
INC_DIR=./include

# Noms des bibliothèques à construire
LIB_NAME=libs_libc.so

SRCS=$(SRC_DIR)/s_string.s $(SRC_DIR)/s_maths.s $(SRC_DIR)/s_stdlib.s $(SRC_DIR)/s_stdio.s
OBJS=$(SRCS:$(SRC_DIR)/%.s=$(BUILD_DIR)/%.o)

.PHONY: all clean library test

all: library test

library: $(OBJS)
	mkdir -p $(LIB_DIR)
	$(CC) $(CFLAGS) -shared -o $(LIB_DIR)/$(LIB_NAME) $(OBJS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TEST_DIR)/main.c library
	$(CC) $(CFLAGS) $(TEST_DIR)/main.c -o $(TEST_DIR)/test $(LDFLAGS) -Wl,-rpath=$(LIB_DIR) $(LDLIBS) -I$(INC_DIR)
	./$(TEST_DIR)/test

clean:
	rm -rf $(BUILD_DIR)/* $(LIB_DIR)/* $(TEST_DIR)/test
