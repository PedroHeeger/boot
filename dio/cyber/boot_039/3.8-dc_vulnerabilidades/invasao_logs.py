# Função para detectar tentativas de invasão em registros de log
def detectar_invasao(registros):
    # Variáveis para rastrear o ID do usuário atual e suas falhas consecutivas
    usuario_atual = None
    tentativas_consecutivas = 0
    invasor_detectado = None

    # TODO: Percorra cada registro de log:
    for registro in registros:
        # TODO: Separe o ID do usuário e o status do registro (sucesso ou falha):
        usuario, status = [campo.strip() for campo in registro.split(":")]

        # TODO: Verifique se o usuário atual é o mesmo da iteração anterior:
        if usuario == usuario_atual:
          if status.lower() == "falha":
            tentativas_consecutivas += 1
            # Se o status é "falha", incremente o contador de tentativas falhas
            if tentativas_consecutivas > 3:
              invasor_detectado = usuario
                    
          # Se a tentativa foi bem-sucedida, resete o contador de falhas
          else:
            tentativas_consecutivas = 0
              
        # TODO: Se mudar de usuário, verifique se o usuário anterior teve mais de 3 falhas consecutivas:
        else:
          if tentativas_consecutivas > 3:
            invasor_detectado = usuario_atual

          # TODO: Atualize para o novo usuário e reinicie a contagem de tentativas falhas:
          usuario_atual = usuario

          # Se a nova tentativa for "falha", inicie a contagem em 1; caso contrário, inicie em 0
          tentativas_consecutivas = 1 if status == "falha" else 0  # Reseta contagem

    # TODO: Após o loop, verifique se o último usuário teve mais de 3 tentativas de falha:
    if tentativas_consecutivas > 3:
      invasor_detectado = usuario_atual
      

    # Retorna o resultado final
    return invasor_detectado if invasor_detectado else "Nenhum invasor detectado"

# Função principal para executar o programa
def main():
    # Solicita ao usuário que insira os registros de log
    entrada = input()
    
    registros = [registro.strip().strip('"') for registro in entrada.split(",")]

    # TODO: Chama a função para detectar tentativas de invasão:
    resultado = detectar_invasao(registros)

    # Imprime o resultado
    print(resultado)

# Chama a função principal para executar o programa
if __name__ == "__main__":
    main()