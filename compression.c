#include <stdint.h>
#include <stdio.h>
#include <assert.h>

typedef int sample;
//typedef sample uncompressedFrame[FRAME_SIZE];


static inline uint16_t getBits(unsigned int offset, unsigned int size, 
			       const uint8_t* restrict data) {
  uint16_t mask = (1 << size) - 1;
  uint16_t* restrict data16 = (uint16_t* restrict)data;
  int bitoffset = offset & (16 - 1);
  int wordoffset = offset >> 4;
  if( bitoffset + size < 16 ) { 
    return (data16[wordoffset] >> bitoffset) & mask;
  } else {
    return ((data16[wordoffset] >> bitoffset) & mask) |
      ((data16[wordoffset+1] << (16-bitoffset)) & mask);
  }
} 
static inline void setBits(unsigned int offset, unsigned int size, 
			   uint8_t* restrict data, uint16_t value) {
  uint16_t mask = (1 << size) - 1;
  assert( (value&mask) == value );
  uint16_t* restrict data16 = (uint16_t* restrict)data;
  int bitoffset = offset & (16 - 1);
  int wordoffset = offset >> 4;
  if( bitoffset + size < 16 ) { 
    data16[wordoffset] &= ~(mask << bitoffset);
    data16[wordoffset] |= (value << bitoffset);
  } else {
    data16[wordoffset] &= ~(mask << bitoffset);
    data16[wordoffset] |= (value << bitoffset);
    data16[wordoffset+1] &= ~(mask >> (16-bitoffset));
    data16[wordoffset+1] |= (value >> (16-bitoffset));
  }
} 

#define REPRCAST(ty, v) (*(ty*)(typeof(v)*)&v)


#define DIFFERENTIAL_BITS 6
#define DIFFERENTIAL_MAX ((1 << (DIFFERENTIAL_BITS-1))-1)
#define DIFFERENTIAL_MIN (-(1 << (DIFFERENTIAL_BITS-1)))

void compressSamples(const int n, const sample* restrict input, uint8_t* restrict output) {
  assert( n > 0 );

  unsigned int offset = 0;
  sample lastValue;


  // Write key sample
  setBits(offset, 10, output, input[0]);
  offset += 10;
  lastValue = input[0];

  // Write differential samples
  for(int i=1; i < n; i++) {
    int diff = input[i] - lastValue;
    if( diff > DIFFERENTIAL_MAX ) diff = DIFFERENTIAL_MAX;
    if( diff < DIFFERENTIAL_MIN ) diff = DIFFERENTIAL_MIN;

    setBits(offset, DIFFERENTIAL_BITS, output, diff - DIFFERENTIAL_MIN);
    lastValue += diff;
    offset += DIFFERENTIAL_BITS;
  }
}
void uncompressSamples(const int n, const uint8_t* restrict input, sample* restrict output) {
  assert( n > 0 );

  unsigned int offset = 0;
  sample lastValue;

  // Write key sample
  output[0] = getBits(offset, 10, input);
  offset += 10;
  lastValue = output[0];

  // Write differential samples
  for(int i=1; i < n; i++) {
    uint16_t diffraw = getBits(offset, DIFFERENTIAL_BITS, input);
    int diff = diffraw + DIFFERENTIAL_MIN;
    lastValue += diff;
    output[i] = lastValue;
    offset += DIFFERENTIAL_BITS;
  }
}


void compressSamplesLog(const int n, sample* input, uint8_t* output) {
  assert( n > 0 );

  unsigned int offset = 0;
  sample lastValue;


  // Write key sample
  setBits(offset, 10, output, input[0]);
  offset += 10;
  lastValue = input[0];

  // Write differential samples
  for(int i=1; i < n; i++) {
    int diff = input[i] - lastValue;
    int actualstep = diff, origstep = diff;
    int sign = 1;
    if( diff < 0 ) { diff = -diff; sign = 0; }
    if( diff > 15 ) {
      diff = (diff >> 4) + 15;
      actualstep = (actualstep / 16) * 16;
    }
    printf("step %d (%x) %d\n", actualstep, (sign << 5) | diff, origstep);

    setBits(offset, 6, output, (sign << 5) | diff);
    lastValue += actualstep;
    offset += 6;
  }
}
void uncompressSamplesLog(const int n, uint8_t* input, sample* output) {
  assert( n > 0 );

  unsigned int offset = 0;
  sample lastValue;

  // Write key sample
  output[0] = getBits(offset, 10, input);
  offset += 10;
  lastValue = output[0];

  // Write differential samples
  for(int i=1; i < n; i++) {
    uint16_t diffraw = getBits(offset, 6, input);
    int v = diffraw & ((1 << 5) - 1);
    if( v > 15 ) {
      v = (v - 15) << 4;
    }
    int diff = (diffraw & (1 << 5)) ? v : -v;
    printf("step %d (%x)\n", diff, diffraw);
    lastValue += diff;
    output[i] = lastValue;
    offset += 6;
  }
}

int main() {
  uint64_t v = 0xdeafbeefabcdef12UL;
  uint8_t* d = &v;
  //for(int i=0; i<24; i += 16) {
  printf("%llx: %x, %x, %x, %x, %x\n", 
	 v,
	 getBits(0, 5, d),
	 getBits(8, 6, d),
	 getBits(13, 4, d),
	 getBits(15, 8, d),
	 getBits(16, 8, d));
  //}

  setBits(13, 8, d, 0x11);
  setBits(20, 6, d, 7);

  printf("%llx: %x, %x, %x, %x, %x\n", 
	 v,
	 getBits(0, 5, d),
	 getBits(8, 6, d),
	 getBits(13, 4, d),
	 getBits(15, 8, d),
	 getBits(16, 8, d));

  {
    sample test[] = {1, 5, 10, 0, 40, 40, 131, 138, 0, 0};
    uint8_t out[16];
    for( int i=0; i<10; i++) {
      printf("%d\n", test[i]);
    }

    compressSamples(10, test, out);
    printf("0x%016llx\n", *(uint64_t*)out);
    uncompressSamples(10, out, test);

    for( int i=0; i<10; i++) {
      printf("%d\n", test[i]);
    }
  }
  printf("=======================\n");
  {
    sample test[] = {1, 5, 10, 0, 40, 40, 131, 138, 0, 0};
    uint8_t out[16];
    for( int i=0; i<10; i++) {
      printf("%d\n", test[i]);
    }

    compressSamplesLog(10, test, out);
    printf("0x%016llx\n", *(uint64_t*)out);
    uncompressSamplesLog(10, out, test);

    for( int i=0; i<10; i++) {
      printf("%d\n", test[i]);
    }
  }
}
