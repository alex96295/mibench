.PHONY: all automotive-susan
all: automotive-susan

SUSAN_SRCS_C = $(wildcard $(MIBENCH_DIR)/automotive/susan/*.c)

automotive-susan:
	$(CC) $(INCLUDES) $(CCFLAGS) $(SUSAN_SRCS_C) -o $(MIBENCH_DIR)/bin/susan.$(ELF_PREFIX).elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/susan.$(ELF_PREFIX).elf > $(MIBENCH_DIR)/bin/susan.$(ELF_PREFIX).dump

.PHONY: clean
clean:
	rm -rf susan output*
