/*
 * Native check of gift64_top() in gift64_hls_opt.c before HLS: compile with
 * the normal C compiler (it ignores the HLS pragmas) and run it against the
 * 3 official GIFT-64 vector files.
 *
 *   cc -O2 -Wno-unknown-pragmas -o tb_top tb_top.c gift64_hls_opt.c && ./tb_top
 *   cc -O2 -Wno-unknown-pragmas -DUNROLL_ROUNDS -o tb_top tb_top.c gift64_hls_opt.c && ./tb_top
 */
#include <stdio.h>
#include <string.h>

unsigned long long gift64_top(unsigned long long pt, unsigned long long key_hi, unsigned long long key_lo);

/* Read the hex digits after "<label> =" (spaces between bytes allowed) into
 * a number: up to 128 bits returned as two 64-bit halves. */
static int read_hex(FILE *f, const char *label, unsigned long long *hi, unsigned long long *lo, int ndigits)
{
    char line[512];
    rewind(f);
    while (fgets(line, sizeof line, f)) {
        if (strncmp(line, label, strlen(label)) != 0) continue;
        int k = 0;
        *hi = 0; *lo = 0;
        for (char *p = strchr(line, '=') + 1; *p && k < ndigits; p++) {
            int v = (*p >= '0' && *p <= '9') ? *p - '0'
                  : (*p >= 'a' && *p <= 'f') ? *p - 'a' + 10
                  : (*p >= 'A' && *p <= 'F') ? *p - 'A' + 10 : -1;
            if (v < 0) continue;
            *hi = (*hi << 4) | (*lo >> 60);   /* shift the 128-bit value left by one digit */
            *lo = (*lo << 4) | (unsigned long long)v;
            k++;
        }
        return k == ndigits;
    }
    return 0;
}

int main(void)
{
    int fails = 0;
    for (int v = 1; v <= 3; v++) {
        char path[128];
        snprintf(path, sizeof path, "../model/vectors/GIFT64_test_vector_%d.txt", v);
        FILE *f = fopen(path, "r");
        if (!f) { printf("cannot open %s\n", path); return 2; }
        unsigned long long z, pt, key_hi, key_lo, ct;
        if (!read_hex(f, "Plaintext =", &z, &pt, 16) || !read_hex(f, "masterkey =", &key_hi, &key_lo, 32)
            || !read_hex(f, "Ciphertext =", &z, &ct, 16)) { printf("bad file %s\n", path); return 2; }
        fclose(f);

        unsigned long long got = gift64_top(pt, key_hi, key_lo);
        int ok = got == ct;
        fails += !ok;
        printf("vector %d: pt=%016llx ct=%016llx expected=%016llx %s\n", v, pt, got, ct, ok ? "PASS" : "FAIL");
    }
    printf(fails ? "FAILED: %d\n" : "ALL PASS\n", fails);
    return fails != 0;
}
