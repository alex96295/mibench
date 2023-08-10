.PHONY: all automotive-qsort automotive-qsort-small automotive-qsort-large
all: automotive-qsort

automotive-qsort: automotive-qsort-small automotive-qsort-large

automotive-qsort-small:
	$(CC) $(INCLUDES) $(CCFLAGS) $(SRCS_C) -o $(MIBENCH_DIR)/bin/qsort_small.car.l2.elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/qsort_small.car.l2.elf > $(MIBENCH_DIR)/bin/qsort_small.car.l2.dump

automotive-qsort-large:
	$(CC) $(INCLUDES) $(CCFLAGS) $(SRCS_C) -o $(MIBENCH_DIR)/bin/qsort_large.car.l2.elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/qsort_large.car.l2.elf > $(MIBENCH_DIR)/bin/qsort_large.car.l2.dump

.PHONY: clean
clean:
	rm -rf qsort_small qsort_large output*
