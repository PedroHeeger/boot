# 2) Python para Cientistas de Dados (21)
## 2.4) Curso: Estruturas Condicionais e de Repetição em Python (2)
### 2.4.1) Estruturas Condicionais e de Repetição
#### 2.4.1.1) Indentação e blocos
print("Indentação:")
def sacar(valor):
    saldo = 500

    if saldo >= valor:
        print("valor sacado!")
        print("retire o seu dinheiro na boca do caixa.")
    print("Obrigado por ser nosso cliente, tenha um bom dia!")

sacar(1000)     
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Indentação:")
sacar(100)      
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.4.1.2) Estruturas condicionais
print("If:")
saldo = 2000.0
saque = float(input("Informe o valor de saque: "))

if saldo >= saque:
    print("Realizando saque!")

if saldo < saque:
    print("Saldo insuficiente!")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("If/else:")
saldo = 2000.0
saque = float(input("Informe o valor de saque: "))

if saldo >= saque:
    print("Realizando saque!")
else:
    print("Saldo insuficiente!")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("If/elif/else:")
import sys
opcao = int(input("Informe uma opção: \n[1] Sacar \n[2] Extrato: \n"))

if opcao == 1:
    valor = float(input("Informe a quantia para o saque: "))
    print("Realizando saque!")
elif opcao == 2:
    print("Exibindo o extrato...")
else:
    sys.exit("Opção inválida!")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("If/elif/else aninhado:")
conta_normal = True
conta_universitaria = False
saldo = 2000
saque = 500
cheque_especial = 450

if conta_normal:
    if saldo >= saque:
        print("Saque realizado com sucesso!")
    elif saque <= (saldo + cheque_especial):
        print("Saque realizado com uso do cheque especial!")
elif conta_universitaria:
    if saldo >= saque:
        print("Saque realizado com sucesso!")
    else:
        print("Saldo insuficiente!")
else:
    print("O sistema não reconheceu seu tipo de conta, entre em contato com o seu gerente.")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("If ternário:")
saldo = 2000
saque = 500
status = "Sucesso" if saldo >= saque else "Falha"
print(f"{status} ao realizar o saque!")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.4.1.3) Estruturas de Repetição
print("Comando for:")
texto = input("Informe um texto: ")
VOGAIS = "AEIOU"

for letra in texto:
    if letra.upper() in VOGAIS:
        print(letra, end="")
else:
    print()
    print("Executado no final do laço.")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Função Range:")
for numero in range(0, 11):
    print(numero, end=" ")
print()
for numero in range (0, 51, 5):
    print (numero, end= " ")
print()
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Comando While:")
opcao = -1
while opcao != 0:
    opcao = int(input("[1] Sacar \n[2] Extrato \n[0] Sair \n"))

    if opcao == 1:
        print("Sacando...")
    elif opcao == 2:
        print("Exibindo o extrato...")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Comando While com break:")
while True:
    numero = int(input("Informe um número: "))
    if numero == 10:
        break
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Comando While com break e continue:")
while True:
    numero = int(input("Informe um número: "))
    if numero == 10:
        break
    if numero % 2 == 0:
        continue
    print(numero)
print("------//------//------//------//------//------//------//------//------//------//------//------//")
