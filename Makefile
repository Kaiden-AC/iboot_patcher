CPPFLAGS=-Iinclude
CFLAGS=-O2 -pipe -Wall -Wno-unused-function -D__target_arm__
TOOLS=iboot_patcher
IBOOT_PATCHER_OBJECTS=src/ibootsup.o src/patch.o src/util.o src/iboot_patcher.o
KERNEL_PATCHER_OBJECTS=src/patch.o src/util.o

all: $(TOOLS)

iboot_patcher: $(IBOOT_PATCHER_OBJECTS)
	$(CC) $(CFLAGS) $(IBOOT_PATCHER_OBJECTS) -o $@

kernel_patcher: $(KERNEL_PATCHER_OBJECTS)
	$(CC) $(CFLAGS) $(KERNEL_PATCHER_OBJECTS) -o $@

%.o: src/%.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<

clean:
	rm -f $(TOOLS) src/*.o
