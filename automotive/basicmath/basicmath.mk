.PHONY: all automotive-basicmath
all: automotive-basicmath

SRCS_C = $(wildcard $(MIBENCH_DIR)/automotive/basicmath/*.c)

automotive-basicmath:
	$(CC) $(INCLUDES) $(CCFLAGS) $(SRCS_C) -o $(MIBENCH_DIR)/bin/basicmath.car.l2.elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/basicmath.car.l2.elf > $(MIBENCH_DIR)/bin/basicmath.car.l2.dump

.PHONY: clean
clean:
	rm -rf basicmath output*
