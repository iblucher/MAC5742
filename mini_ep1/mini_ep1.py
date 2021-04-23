# miniEP1
# Isabela Blucher, 9298170
# python mini_ep1.py

N = 1 << int(input())
primos = 0
primos_especiais = 0

crivo = [True] * (N+1)

for i in range(2, N+1):
    if crivo[i]:
        primos += 1
        if i % 4 != 3:
            primos_especiais += 1
        for j in range(i*2, N+1, i):
            crivo[j] = False

print(primos, primos_especiais)
