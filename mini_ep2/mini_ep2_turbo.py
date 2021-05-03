# miniEP1
# Isabela Blucher, 9298170
# python mini_ep1.py

N = 1 << int(input())
primos = 0
primos_especiais = 0

crivo = [True] * ((N + 1) // 2)

# incluindo o 2 como primo e primo especial pré-loop
# (o loop faz a lógica para todos os ímpares)
primos += 1
primos_especiais += 1

for i in range(3, N + 1, 2):
    if crivo[i // 2]:
        primos = primos + 1
        if i % 4 != 3:
            primos_especiais = primos_especiais + 1
        for j in range(i * 3, N + 1, i * 2):
            crivo[j//2] = False


print(primos, primos_especiais)
