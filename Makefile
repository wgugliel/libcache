CC = gcc
CFLAGS += -std=c99 -Wall -pedantic -D_DEFAULT_SOURCE -g
INCLUDES = -I./include

SRC = src
OUT = out

OBJECT_FILES = \
	$(OUT)/libcache.o \
	$(OUT)/test.o

all: libcache_test

test:
	out/libcache_test

libcache_test: $(OBJECT_FILES)
	@mkdir -p $(OUT)
	$(CC) $(CFLAGS) $(INCLUDES) $(OPTFLAGS) -o $(OUT)/$@ $(OBJECT_FILES)

$(OUT)/%.o: $(SRC)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDES) $(OPTFLAGS) -c -o $@ $<
 $(LDFLAGS)

clean:
	rm -rf $(OUT)

.PHONY: all libcache_test test clean
