/*
  Tinyfib

  Print some figures of fibonacci, but quickly, tinily, efficiently

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation
  the rights to use, copy, modify, merge, publish, distribute, sublicense,
  and/or sell copies of the Software, and to permit persons to whom the Software
  is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
  OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>
#include <stdlib.h>

enum ExitStatus {
  E_SUCCESS = 0,
  E_FUCKED,
};

int main(int argc, char *argv[]) {
  long f = 0;
  long f0;
  long l = 1;

  if (argc != 2) {
    printf("tinyfib\n");
    printf("\t%s <nth value number>\n", argv[0]);

    return E_FUCKED;
  }

  printf("%ld\n", l);

  for (int i = 1; i < atoi(argv[1]); i++) {
    printf("%ld\n", f+l);
    f0 = f;
    f = l;
    l = f0 + l;
  }
}
