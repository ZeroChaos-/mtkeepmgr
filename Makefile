TARGET=mtkeepmgr

OBJ=\
	con_file.o	\
	mt7610.o	\
	mt7620.o	\
	mt7628.o	\
	mtkeepmgr.o	\
	utils.o

DEP=$(OBJ:%.o=%.d)

DEFS=

CFLAGS += -Wall -g

DEPFLAGS=-MMD -MP

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(DEPFLAGS) $(CFLAGS) $(DEFS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(TARGET) $(OBJ)
	rm -rf $(DEP)

-include $(DEP)
