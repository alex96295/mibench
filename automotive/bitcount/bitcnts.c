/* +++Date last modified: 05-Jul-1997 */

/*
**  BITCNTS.C - Test program for bit counting functions
**
**  public domain by Bob Stout & Auke Reitsma
*/

#include <stdio.h>
#include <stdlib.h>
#include "conio.h"
#include <limits.h>
//#include <time.h>
#include <float.h>
#include "bitops.h"
#include <printf.h>
#include "regs/system_timer.h"
#include "util.h"

#define FUNCS  7

// Use lfsr isntead of rand
#define DEFAULT_SEED 0xcaca5a5adeadbeef
#define FEEDBACK 0x6c0000397f000032

uint64_t *lfsr_byte_feedback;

uint32_t lfsr_iter_bit(uint64_t lfsr) { return (lfsr & 1) ? ((lfsr >> 1) ^ FEEDBACK) : (lfsr >> 1); }

uint32_t lfsr_iter_byte(uint64_t lfsr, uint64_t *lfsr_byte_feedback) {
    uint32_t l = lfsr;
    for (int i = 0; i < 8; i++)
        l = lfsr_iter_bit(l);
    return l;
}

uint32_t lfsr_iter_word(uint64_t lfsr, uint64_t *lfsr_byte_feedback) {
    uint32_t l = lfsr_iter_byte(lfsr, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    return lfsr_iter_byte(l, lfsr_byte_feedback);
}

uint64_t lfsr_64bits(uint64_t lfsr, uint64_t *lfsr_byte_feedback) {
    uint64_t l = lfsr_iter_byte(lfsr, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    return lfsr_iter_byte(l, lfsr_byte_feedback);
}

static int CDECL bit_shifter(long int x);

int main(/*int argc, char *argv[]*/)
{
  clock_t start, stop;
  double ct, cmin = DBL_MAX, cmax = 0;
  int i, cminix, cmaxix;
  long j, n, seed;
  int iterations;
  static int (* CDECL pBitCntFunc[FUNCS])(long) = {
    bit_count,
    bitcount,
    ntbl_bitcnt,
    ntbl_bitcount,
    /*            btbl_bitcnt, DOESNT WORK*/
    BW_btbl_bitcount,
    AR_btbl_bitcount,
    bit_shifter
  };
  static char *text[FUNCS] = {
    "Optimized 1 bit/loop counter",
    "Ratko's mystery algorithm",
    "Recursive bit count by nybbles",
    "Non-recursive bit count by nybbles",
    /*            "Recursive bit count by bytes",*/
    "Non-recursive bit count by bytes (BW)",
    "Non-recursive bit count by bytes (AR)",
    "Shift and count bits"
  };
//  if (argc<2) {
//    PRINTF(stderr,"Usage: bitcnts <iterations>\n");
//    exit(-1);
//	}
  iterations=1000000;/*atoi(argv[1])*/
  
  PRINTF("Bit counter algorithm benchmark\r\n");

  seed = DEFAULT_SEED; 

  // We do not use time.h. Use our timer instead, if available
  for (i = 0; i < FUNCS; i++) {
      chs_playgnd_reset_timer();
      chs_playgnd_start_timer();
      //start = clock();
    
      for (j = n = 0, seed = lfsr_64bits(seed, lfsr_byte_feedback); j < iterations; j++, seed += 13) {
	 n += pBitCntFunc[i](seed);
      }
    
    //stop = clock();
    chs_playgnd_stop_timer();
      
    volatile uint32_t ct_cycles = chs_playgnd_get_timer_count();

    //ct = (stop - start) / (double)CLOCKS_PER_SEC;
    //if (ct < cmin) {
    //	 cmin = ct;
    //	 cminix = i;
    //}
    //if (ct > cmax) {
    //	 cmax = ct;
    //	 cmaxix = i;
    //}
    //
    //PRINTF("%-38s> Time: %7.3f sec.; Bits: %ld\n", text[i], ct, n);
    PRINTF("%-38s> Clock cycles: %d; Bits: %ld\r\n", text[i], ct_cycles, n);
  }
  //PRINTF("\nBest  > %s\n", text[cminix]);
  //PRINTF("Worst > %s\n", text[cmaxix]);
  return 0;
}

static int CDECL bit_shifter(long int x)
{
  int i, n;
  
  for (i = n = 0; x && (i < (sizeof(long) * CHAR_BIT)); ++i, x >>= 1)
    n += (int)(x & 1L);
  return n;
}
