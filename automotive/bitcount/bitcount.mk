.PHONY: all automotive-bitcount
all: automotive-bitcount

BITCOUNT_SRCS_C = $(wildcard $(MIBENCH_DIR)/automotive/bitcount/*.c)

automotive-bitcount:
	$(CC) $(INCLUDES) $(CCFLAGS) $(BITCOUNT_SRCS_C) -o $(MIBENCH_DIR)/bin/bitcount.$(ELF_PREFIX).elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/bitcount.$(ELF_PREFIX).elf > $(MIBENCH_DIR)/bin/bitcount.$(ELF_PREFIX).dump

.PHONY: bitcount-clean
bitcount-clean:
	rm -rf bitcount output*
