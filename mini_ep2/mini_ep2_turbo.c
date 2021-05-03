// miniEP2
// Isabela Blucher, 9298170
// compilar: gcc -std=c99 -Wall -O2 mini_ep2_turbo.c -o mini_ep2_turbo
// rodar: ./mini_ep2_turbo

#include <stdio.h>
#include <stdlib.h>

int main() { 
    int N, input;
    int primos = 0;
    int primos_especiais = 0;
    int *crivo;

    scanf("%d", &input);

    N = 1 << input;

    crivo = malloc(((N + 1) / 2) * sizeof(int));
    
    for(int i = 0; i < ((N + 1) / 2); i++) {
        crivo[i] = 1;
    }

    // incluindo o 2 como primo e primo especial pré-loop
    // (o loop faz a lógica para todos os ímpares)
    primos++;
    primos_especiais++;

    for(int i = 3; i <= N; i = i + 2) {
        if(crivo[i / 2] == 1) {
            primos++;
            if(i % 4 != 3)
                primos_especiais++;
            for(int j = i * 3; j <= N; j = j + (i * 2)) {
                crivo[j / 2] = 0;
            }
        }
    }

    printf("%d %d\n", primos, primos_especiais);

    free(crivo);
    
    return 0;
}