.PHONY: all automotive-basicmath
all: automotive-basicmath

BASICMATH_SRCS_C = $(wildcard $(MIBENCH_DIR)/automotive/basicmath/*.c)

automotive-basicmath:
	$(CC) $(INCLUDES) $(CCFLAGS) $(BASICMATH_SRCS_C) -o $(MIBENCH_DIR)/bin/basicmath.$(ELF_PREFIX).elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/basicmath.$(ELF_PREFIX).elf > $(MIBENCH_DIR)/bin/basicmath.$(ELF_PREFIX).dump

.PHONY: basicmath-clean
basicmath-clean:
	rm -rf basicmath output*
