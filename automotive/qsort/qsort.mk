.PHONY: all automotive-qsort automotive-qsort-small automotive-qsort-large
all: automotive-qsort

automotive-qsort: automotive-qsort-small automotive-qsort-large

automotive-qsort-small:
	$(CC) $(INCLUDES) $(CCFLAGS) $(MIBENCH_DIR)/automotive/qsort/qsort_small.c -o $(MIBENCH_DIR)/bin/qsort_small.$(ELF_PREFIX).elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/qsort_small.$(ELF_PREFIX).elf > $(MIBENCH_DIR)/bin/qsort_small.$(ELF_PREFIX).dump

automotive-qsort-large:
	$(CC) $(INCLUDES) $(CCFLAGS) $(MIBENCH_DIR)/automotive/qsort/qsort_large.c -o $(MIBENCH_DIR)/bin/qsort_large.$(ELF_PREFIX).elf $(LDFLAGS) $(LDLINK) $(LDLIBS) -lm
	$(OBJDUMP) -d -S $(MIBENCH_DIR)/bin/qsort_large.$(ELF_PREFIX).elf > $(MIBENCH_DIR)/bin/qsort_large.$(ELF_PREFIX).dump

.PHONY: qsort-clean
qsort-clean:
	rm -rf qsort_small qsort_large output*
