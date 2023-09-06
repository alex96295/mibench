#include "snipmath.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <printf.h>
#include "util.h"

/* The printf's may be removed to isolate just the math calculations */

int main(/*int argc, char** argv*/void)
{
//    if(argc < 2) {
//        PRINTF(stderr, "ERROR: number of runs not provided!\n");
//        PRINTF(stderr, "USAGE: ./basicmath [RUNS]\n");
//        return 1;
//    }

    int runs = 1 /*atoi(argv[1])*/;
    int j;

    for(j = 0; j < runs; j++) {

      double  a1 = 1.0, b1 = -10.5, c1 = 32.0, d1 = -30.0;
      double  x[3];
      double X;
      int     solutions;
      int i;
      unsigned long l = 0x3fed0169L;
      struct int_sqrt q;
      long n = 0;

      /* solve soem cubic functions */
      PRINTF("********* CUBIC FUNCTIONS ***********\n");
      /* should get 3 solutions: 2, 6 & 2.5   */
      SolveCubic(a1, b1, c1, d1, &solutions, x);  
      PRINTF("Solutions:");
      for(i=0;i<solutions;i++)
        PRINTF(" %f",x[i]);
      PRINTF("\n");

//      a1 = 1.0; b1 = -4.5; c1 = 17.0; d1 = -30.0;
//      /* should get 1 solution: 2.5           */
//      SolveCubic(a1, b1, c1, d1, &solutions, x);  
//      PRINTF("Solutions:");
//      for(i=0;i<solutions;i++)
//        PRINTF(" %f",x[i]);
//      PRINTF("\n");
//
//      a1 = 1.0; b1 = -3.5; c1 = 22.0; d1 = -31.0;
//      SolveCubic(a1, b1, c1, d1, &solutions, x);
//      PRINTF("Solutions:");
//      for(i=0;i<solutions;i++)
//        PRINTF(" %f",x[i]);
//      PRINTF("\n");
//
//      a1 = 1.0; b1 = -13.7; c1 = 1.0; d1 = -35.0;
//      SolveCubic(a1, b1, c1, d1, &solutions, x);
//      PRINTF("Solutions:");
//      for(i=0;i<solutions;i++)
//        PRINTF(" %f",x[i]);
//      PRINTF("\n");
//
//      a1 = 3.0; b1 = 12.34; c1 = 5.0; d1 = 12.0;
//      SolveCubic(a1, b1, c1, d1, &solutions, x);
//      PRINTF("Solutions:");
//      for(i=0;i<solutions;i++)
//        PRINTF(" %f",x[i]);
//      PRINTF("\n");
//
//      a1 = -8.0; b1 = -67.89; c1 = 6.0; d1 = -23.6;
//      SolveCubic(a1, b1, c1, d1, &solutions, x);
//      PRINTF("Solutions:");
//      for(i=0;i<solutions;i++)
//        PRINTF(" %f",x[i]);
//      PRINTF("\n");
//
//      a1 = 45.0; b1 = 8.67; c1 = 7.5; d1 = 34.0;
//      SolveCubic(a1, b1, c1, d1, &solutions, x);
//      PRINTF("Solutions:");
//      for(i=0;i<solutions;i++)
//        PRINTF(" %f",x[i]);
//      PRINTF("\n");
//
//      a1 = -12.0; b1 = -1.7; c1 = 5.3; d1 = 16.0;
//      SolveCubic(a1, b1, c1, d1, &solutions, x);
//      PRINTF("Solutions:");
//      for(i=0;i<solutions;i++)
//        PRINTF(" %f",x[i]);
//      PRINTF("\n");
//
//      /* Now solve some random equations */
//      for(a1=1;a1<10;a1+=1) {
//        for(b1=10;b1>0;b1-=.25) {
//          for(c1=5;c1<15;c1+=0.61) {
//           for(d1=-1;d1>-5;d1-=.451) {
//            SolveCubic(a1, b1, c1, d1, &solutions, x);  
//            PRINTF("Solutions:");
//            for(i=0;i<solutions;i++)
//              PRINTF(" %f",x[i]);
//            PRINTF("\n");
//           }
//          }
//        }
//      }


      PRINTF("********* INTEGER SQR ROOTS ***********\n");
      /* perform some integer square roots */
      for (i = 0; i < /*100000*/ 1; i+=2)
        {
          usqrt(i, &q);
                // remainder differs on some machines
         // PRINTF("sqrt(%3d) = %2d, remainder = %2d\n",
         PRINTF("sqrt(%3d) = %2d\n",
             i, q.sqrt);
        }
//      PRINTF("\n");
//      for (l = 0x3fed0169L; l < 0x3fed4169L; l++)
//        {
//         usqrt(l, &q);
//         //PRINTF("\nsqrt(%lX) = %X, remainder = %X\n", l, q.sqrt, q.frac);
//         PRINTF("sqrt(%lX) = %X\n", l, q.sqrt);
//        }


      PRINTF("********* ANGLE CONVERSION ***********\n");
      /* convert some rads to degrees */
    /*   for (X = 0.0; X <= 360.0; X += 1.0) */
      for (X = 0.0; X <= 360.0; X += .001)
        PRINTF("%3.0f degrees = %.12f radians\n", X, deg2rad(X));
      puts("");
    /*   for (X = 0.0; X <= (2 * PI + 1e-6); X += (PI / 180)) */
      for (X = 0.0; X <= (2 * PI + 1e-6); X += (PI / 5760))
        PRINTF("%.12f radians = %3.0f degrees\n", X, rad2deg(X));
      
      
    }

    return 0;
}
