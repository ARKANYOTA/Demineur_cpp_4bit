#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>



/* --- PRINTF_BYTE_TO_BINARY macro's --- */  //https://stackoverflow.com/a/25108449/14943431
#define PRINTF_BINARY_PATTERN_INT8 "%c %c %c %c %c %c %c %c"
#define PRINTF_BYTE_TO_BINARY_INT8(i)    \
    (((i) & 0x80ll) ? '1' : '0'), \
    (((i) & 0x40ll) ? '1' : '0'), \
    (((i) & 0x20ll) ? '1' : '0'), \
    (((i) & 0x10ll) ? '1' : '0'), \
    (((i) & 0x08ll) ? '1' : '0'), \
    (((i) & 0x04ll) ? '1' : '0'), \
    (((i) & 0x02ll) ? '1' : '0'), \
    (((i) & 0x01ll) ? '1' : '0')

#define PRINTF_BINARY_PATTERN_INT16 \
    PRINTF_BINARY_PATTERN_INT8       "\n"        PRINTF_BINARY_PATTERN_INT8
#define PRINTF_BYTE_TO_BINARY_INT16(i) \
    PRINTF_BYTE_TO_BINARY_INT8((i) >> 8),   PRINTF_BYTE_TO_BINARY_INT8(i)
#define PRINTF_BINARY_PATTERN_INT32 \
    PRINTF_BINARY_PATTERN_INT16        "\n"      PRINTF_BINARY_PATTERN_INT16
#define PRINTF_BYTE_TO_BINARY_INT32(i) \
    PRINTF_BYTE_TO_BINARY_INT16((i) >> 16), PRINTF_BYTE_TO_BINARY_INT16(i)
#define PRINTF_BINARY_PATTERN_INT64    \
    PRINTF_BINARY_PATTERN_INT32      "\n"       PRINTF_BINARY_PATTERN_INT32
#define PRINTF_BYTE_TO_BINARY_INT64(i) \
    PRINTF_BYTE_TO_BINARY_INT32((i) >> 32), PRINTF_BYTE_TO_BINARY_INT32(i)
/* --- end macros --- */


// Maps Vars
unsigned long long int bombs = 0;
unsigned long long int flags = 0;
unsigned long long int disco = 0;
// Temp Vars
unsigned long int vars  = 0;
int pos = 0;

// On peut juste avoir pos au lieu de x et y:
// Pour accéder au y - 1, on fait pos - 8
// Pour accéder au y + 1, on fait pos + 8
// Pour accéder au x - 1, on fait pos - 1
// Pour accéder au x + 1, on fait pos + 1
// Pour vérifier si pos est dans la grille, 0 <= pos <= 0b111111  (63) ou
//                                          0 <= pos <  0b1000000 (64)


// Get bit => return (((Maps Vars) >> pos) & 1)
//
// Reset bit => Maps_Vars = Maps_Vars & ~(1 ull << pos)
//
// Set bit:
//  - Si le bit est inconnu:
//      Reset bit
//  - Puis 
//      => Maps_Vars = Maps_Vars | (new_bit ull << pos)
//      

void generate_bombs(){
    bombs = 0;
    int nb_bombs = 16;  // TODO Le get par ull(vars)
    while(nb_bombs > 0){
        pos = rand() % 0b1000000; // 64 (Le nombre de case)
        if(!((bombs >> pos) & 1)){  // Get bit: Ce n'est pas une bombe 
            // On sait que le bit est null donc pas besoin de le reset
            // Faut que le 1 soit un unsigned long long sinon sa marche pas, Il est possible que le problème arrive en assembleur
            // https://stackoverflow.com/questions/7401888/why-doesnt-left-bit-shift-for-32-bit-integers-work-as-expected-when-used
            bombs |= (1ull << pos);
            nb_bombs--;
        }
    }
    return;
}

int main(){
    // Définir un nombre random qui change a chaque lancement
    time_t t;
    srand((unsigned) time(&t));
    // A Commenter si tu veux faire plein de tests avec les mêmes valeurs

    generate_bombs(bombs);

    printf("Bombs   \n"PRINTF_BINARY_PATTERN_INT64 "\n", PRINTF_BYTE_TO_BINARY_INT64(bombs));
    printf("Flags   \n"PRINTF_BINARY_PATTERN_INT64 "\n", PRINTF_BYTE_TO_BINARY_INT64(flags));
    printf("Disco   \n"PRINTF_BINARY_PATTERN_INT64 "\n", PRINTF_BYTE_TO_BINARY_INT64(disco));

    return 0;
}
