/*
 * Native check of gift64_hls.c before HLS: compile with the normal C
 * compiler and run it against the 3 official GIFT-64 vector files.
 *
 *   cc -O2 -o tb_native tb_native.c gift64_hls.c && ./tb_native
 *
 * Each file's "Plaintext =", "masterkey =" and the first "Ciphertext ="
 * line are read, so no vector is typed by hand.
 */
#include <stdio.h>
#include <string.h>

void gift64_enc(unsigned char input[16], unsigned char masterkey[32]);

/* Read the hex digits after "<label> =" into nibbles, MSB first in the
 * file, stored as the reference expects: out[n-1] is the first digit. */
static int read_field(FILE *f, const char *label, unsigned char *out, int n)
{
    char line[512];
    rewind(f);
    while (fgets(line, sizeof line, f)) {
        if (strncmp(line, label, strlen(label)) != 0) continue;
        int k = 0;
        for (char *p = strchr(line, '=') + 1; *p && k < n; p++) {
            int v = (*p >= '0' && *p <= '9') ? *p - '0'
                  : (*p >= 'a' && *p <= 'f') ? *p - 'a' + 10
                  : (*p >= 'A' && *p <= 'F') ? *p - 'A' + 10 : -1;
            if (v >= 0) out[n - 1 - k++] = (unsigned char)v;
        }
        return k == n;
    }
    return 0;
}

static void print_nibbles(const char *name, const unsigned char *x, int n)
{
    printf("%s=", name);
    for (int i = n - 1; i >= 0; i--) printf("%x", x[i]);
}

int main(void)
{
    int fails = 0;
    for (int v = 1; v <= 3; v++) {
        char path[128];
        snprintf(path, sizeof path, "../model/vectors/GIFT64_test_vector_%d.txt", v);
        FILE *f = fopen(path, "r");
        if (!f) { printf("cannot open %s\n", path); return 2; }
        unsigned char pt[16], key[32], ct[16], state[16];
        if (!read_field(f, "Plaintext =", pt, 16) || !read_field(f, "masterkey =", key, 32)
            || !read_field(f, "Ciphertext =", ct, 16)) { printf("bad file %s\n", path); return 2; }
        fclose(f);

        memcpy(state, pt, 16);
        gift64_enc(state, key);
        int ok = memcmp(state, ct, 16) == 0;
        fails += !ok;
        printf("vector %d: ", v);
        print_nibbles("pt", pt, 16); printf(" ");
        print_nibbles("ct", state, 16); printf(" ");
        print_nibbles("expected", ct, 16);
        printf(" %s\n", ok ? "PASS" : "FAIL");
    }
    printf(fails ? "FAILED: %d\n" : "ALL PASS\n", fails);
    return fails != 0;
}
