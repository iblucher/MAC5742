// miniEP1
// Isabela Blucher, 9298170
// compilar: gcc -std=c99 -Wall mini_ep1.c -o mini_ep1
// rodar: ./mini_ep1

#include <stdio.h>
#include <stdlib.h>

int main() { 
    int N, input;
    int primos = 0;
    int primos_especiais = 0;
    int *crivo;

    scanf("%d", &input);

    N = 1 << input;

    crivo = malloc((N + 1) * sizeof(int));

    for(int i = 0; i <= N; i++) {
        crivo[i] = 1;
    }
    
    for(int i = 2; i <= N; i++) {
        if(crivo[i] == 1) {
            primos++;
            if(i % 4 != 3)
                primos_especiais++;
            for(int j = i * 2; j <= N; j = j + i) {
                crivo[j] = 0;
            }
        }

    }

    printf("%d %d\n", primos, primos_especiais);
    
    return 0;
}