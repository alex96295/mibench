.PHONY: all automotive-bitcount
all: automotive-bitcount

SRCS_C = $(wildcard $(MIBENCH_DIR)/automotive/bitcount/*.c)

automotive-basicmath:
	$(CC) $(INCLUDES) $(CCFLAGS) $(SRCS_C) -o $(MIBENCH_DIR)/bin/bitcount.car.l2.elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/bitcount.car.l2.elf > $(MIBENCH_DIR)/bin/bitcount.car.l2.dump

.PHONY: clean
clean:
	rm -rf bitcount output*
