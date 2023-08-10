TIME=/usr/bin/time
TIME_FORMAT="%Es\telapsed\n%Us\tuser\n%Ss\tsystem\n%MkB\n"

ADPCM_INPUT=300000000
BASICMATH_RUNS=20
BITCOUNT_INPUT=140000000
BLOWFISH_INPUT=120000000
CRC_INPUT=1200000000
DIJKSTRA_INPUT=2000
FFT_WAVES=2048
FFT_LENGTH=32768
GSM_INPUT=51000000
JPEG_INPUT=6500 6500
LAME_INPUT=700
PATRICIA_INPUT=2000 5500
QSORT_LARGE_INPUT=10000000
QSORT_SMALL_INPUT=9500000
SHA_INPUT=1100000000
STRINGSEARCH_RUNS=5500
SUSAN_INPUT=2500 2500
TYPESET_INPUT=7000000

.PHONY: automotive
automotive: automotive-basicmath automotive-bitcount automotive-qsort automotive-susan

# Automotive
include $(MIBENCH_DIR)/automotive/basicmath/basicmath.mk
include $(MIBENCH_DIR)/automotive/bitcount/bitcount.mk
include $(MIBENCH_DIR)/automotive/qsort/qsort.mk
include $(MIBENCH_DIR)/automotive/susan/susan.mk

# TODO: Refactor the other tests
# Consumer
consumer_jpeg:
	$(MAKE) -C consumer/jpeg/jpeg-6a

consumer_lame:
	$(MAKE) -C consumer/lame/lame3.70

consumer_typeset:
	$(MAKE) -C consumer/typeset/lout-3.24

# Network
network_dijkstra:
	$(MAKE) -C network/dijkstra

network_patricia:
	$(MAKE) -C network/patricia

# Office
office_stringsearch:
	$(MAKE) -C office/stringsearch

# Security
security_blowfish:
	$(MAKE) -C security/blowfish

security_sha:
	$(MAKE) -C security/sha

# Telecomm
telecomm_CRC32:
	$(MAKE) -C telecomm/CRC32

telecomm_FFT:
	$(MAKE) -C telecomm/FFT

telecomm_adpcm:
	$(MAKE) -C telecomm/adpcm/src

telecomm_gsm:
	$(MAKE) -C telecomm/gsm

# Generate input
generate_input: 
	python $(MIBENCH_DIR)/input_generation/generate_adpcm_input.py $(ADPCM_INPUT)
	python $(MIBENCH_DIR)/input_generation/generate_blowfish_input.py $(BLOWFISH_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_crc_input.py $(CRC_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_dijkstra_input.py $(DIJKSTRA_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_gsm_input.py $(GSM_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_jpeg_input.py $(JPEG_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_lame_input.py $(LAME_INPUT)
	python $(MIBENCH_DIR)/input_generation/generate_patricia_input.py $(PATRICIA_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_qsort_large_input.py $(QSORT_LARGE_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_qsort_small_input.py $(QSORT_SMALL_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_sha_input.py $(SHA_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_susan_input.py $(SUSAN_INPUT) 
	python $(MIBENCH_DIR)/input_generation/generate_typeset_input.py $(TYPESET_INPUT) 

.PHONY: clean
clean:
	-rm -rf bin/*output*
	$(MAKE) -C $(MIBENCH_DIR)/automotive/basicmath clean
	$(MAKE) -C $(MIBENCH_DIR)/automotive/bitcount clean
	$(MAKE) -C $(MIBENCH_DIR)/automotive/qsort clean
	$(MAKE) -C $(MIBENCH_DIR)/automotive/susan clean
	$(MAKE) -C $(MIBENCH_DIR)/consumer/jpeg/jpeg-6a clean
	$(MAKE) -C $(MIBENCH_DIR)/consumer/lame/lame3.70 clean
	$(MAKE) -C $(MIBENCH_DIR)/consumer/typeset/lout-3.24 clean
	$(MAKE) -C $(MIBENCH_DIR)/network/dijkstra clean
	$(MAKE) -C $(MIBENCH_DIR)/network/patricia clean
	$(MAKE) -C $(MIBENCH_DIR)/office/stringsearch clean
	$(MAKE) -C $(MIBENCH_DIR)/security/blowfish clean
	$(MAKE) -C $(MIBENCH_DIR)/security/sha clean
	$(MAKE) -C $(MIBENCH_DIR)/telecomm/CRC32 clean
	$(MAKE) -C $(MIBENCH_DIR)/telecomm/FFT clean
	$(MAKE) -C $(MIBENCH_DIR)/telecomm/adpcm/src clean 
	$(MAKE) -C $(MIBENCH_DIR)/telecomm/gsm clean 
