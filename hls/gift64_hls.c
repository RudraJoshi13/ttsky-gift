/*
 * GIFT-64-128 encryption, input for HLS (Bambu).
 *
 * This is enc64() from the GIFT designers' reference implementation
 * (giftcipher/gift, implementations/reference/GIFT64-128_cipher.cpp,
 * Siang Meng Sim, MIT licence). The cipher statements are copied unchanged.
 * Only three things differ from the original:
 *   1. All printing (cout) is removed, because hardware cannot print.
 *   2. The number of rounds is fixed at 28 instead of being a parameter.
 *   3. The file is plain C (no iostream). The S-box, permutation and
 *      round-constant tables are copied unchanged (all 62 constants are
 *      kept, although GIFT-64 reads only the first 28); the inverse tables,
 *      used only for decryption, are left out.
 *
 * Nibble order, as in the reference:
 *   input     = MSB [15][14]...[1][0] LSB   (16 nibbles, one per byte)
 *   masterkey = MSB [31][30]...[1][0] LSB   (32 nibbles, one per byte)
 * The ciphertext is written back into input[].
 */

//Sbox
const unsigned char GIFT_S[16] = { 1,10, 4,12, 6,15, 3, 9, 2,13,11, 7, 5, 0, 8,14};

//bit permutation
const unsigned char GIFT_P[]={
/* Block size = 64 */
  0, 17, 34, 51, 48,  1, 18, 35, 32, 49,  2, 19, 16, 33, 50,  3,
  4, 21, 38, 55, 52,  5, 22, 39, 36, 53,  6, 23, 20, 37, 54,  7,
  8, 25, 42, 59, 56,  9, 26, 43, 40, 57, 10, 27, 24, 41, 58, 11,
 12, 29, 46, 63, 60, 13, 30, 47, 44, 61, 14, 31, 28, 45, 62, 15
};

// round constants
const unsigned char GIFT_RC[62] = {
    0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3E, 0x3D, 0x3B, 0x37, 0x2F,
    0x1E, 0x3C, 0x39, 0x33, 0x27, 0x0E, 0x1D, 0x3A, 0x35, 0x2B,
    0x16, 0x2C, 0x18, 0x30, 0x21, 0x02, 0x05, 0x0B, 0x17, 0x2E,
    0x1C, 0x38, 0x31, 0x23, 0x06, 0x0D, 0x1B, 0x36, 0x2D, 0x1A,
    0x34, 0x29, 0x12, 0x24, 0x08, 0x11, 0x22, 0x04, 0x09, 0x13,
    0x26, 0x0c, 0x19, 0x32, 0x25, 0x0a, 0x15, 0x2a, 0x14, 0x28,
    0x10, 0x20
};

void gift64_enc(unsigned char input[16], unsigned char masterkey[32])
{
    unsigned char key[32];
    for (int i=0; i<32;i++){
        key[i] = masterkey[i];
    }

    unsigned char bits[64], perm_bits[64];
    unsigned char key_bits[128];
    unsigned char temp_key[32];
    for (int r=0; r<28; r++){

        //SubCells
        for (int i=0; i<16; i++){
            input[i] = GIFT_S[input[i]];
        }

        //PermBits
        //input to bits
        for (int i=0; i<16; i++){
            for (int j=0; j<4; j++){
                bits[4*i+j] = (input[i] >> j) & 0x1;
            }
        }
        //permute the bits
        for (int i=0; i<64; i++){
            perm_bits[GIFT_P[i]] = bits[i];
        }
        //perm_bits to input
        for (int i=0; i<16; i++){
            input[i]=0;
            for (int j=0; j<4; j++){
                 input[i] ^= perm_bits[4*i+j] << j;
            }
        }

        //AddRoundKey
        //input to bits
        for (int i=0; i<16; i++){
            for (int j=0; j<4; j++){
                bits[4*i+j] = (input[i] >> j) & 0x1;
            }
        }
        //key to key_bits
        for (int i=0; i<32; i++){
            for (int j=0; j<4; j++){
                key_bits[4*i+j] = (key[i] >> j) & 0x1;
            }
        }

        //add round key
        int kbc=0;  //key_bit_counter
        for (int i=0; i<16; i++){
            bits[4*i] ^= key_bits[kbc];
            bits[4*i+1] ^= key_bits[kbc+16];
            kbc++;
        }

        //add constant
        bits[3] ^= GIFT_RC[r] & 0x1;
        bits[7] ^= (GIFT_RC[r]>>1) & 0x1;
        bits[11] ^= (GIFT_RC[r]>>2) & 0x1;
        bits[15] ^= (GIFT_RC[r]>>3) & 0x1;
        bits[19] ^= (GIFT_RC[r]>>4) & 0x1;
        bits[23] ^= (GIFT_RC[r]>>5) & 0x1;
        bits[63] ^= 1;

        //bits to input
        for (int i=0; i<16; i++){
            input[i]=0;
            for (int j=0; j<4; j++){
                 input[i] ^= bits[4*i+j] << j;
            }
        }

        //key update
        //entire key>>32
        for(int i=0; i<32; i++){
            temp_key[i] = key[(i+8)%32];
        }
        for(int i=0; i<24; i++) key[i] = temp_key[i];
        //k0>>12
        key[24] = temp_key[27];
        key[25] = temp_key[24];
        key[26] = temp_key[25];
        key[27] = temp_key[26];
        //k1>>2
        key[28] = ((temp_key[28]&0xc)>>2) ^ ((temp_key[29]&0x3)<<2);
        key[29] = ((temp_key[29]&0xc)>>2) ^ ((temp_key[30]&0x3)<<2);
        key[30] = ((temp_key[30]&0xc)>>2) ^ ((temp_key[31]&0x3)<<2);
        key[31] = ((temp_key[31]&0xc)>>2) ^ ((temp_key[28]&0x3)<<2);
    }
}
