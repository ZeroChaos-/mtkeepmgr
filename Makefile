TARGET=medump

OBJ=	medump.o	\
	mt7610.o	\
	utils.o

CFLAGS += -Wall -g

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

.PHONY: clean
clean:
	rm -rf $(TARGET) $(OBJ)
