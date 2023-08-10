.PHONY: all automotive-susan
all: automotive-susan

SRCS_C = $(wildcard $(MIBENCH_DIR)/automotive/susan/*.c)

automotive-susan:
	$(CC) $(INCLUDES) $(CCFLAGS) $(SRCS_C) -o $(MIBENCH_DIR)/bin/susan.car.l2.elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/susan.car.l2.elf > $(MIBENCH_DIR)/bin/susan.car.l2.dump

.PHONY: clean
clean:
	rm -rf susan output*
