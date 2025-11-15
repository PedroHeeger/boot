# Função para verificar se o corpo do e-mail contém palavras suspeitas de phishing
def verificar_phishing(mensagem):
    # Lista de palavras que indicam possíveis e-mails de phishing
    palavras_suspeitas = ["ganhe", "prêmio", "urgente", "desconto", "click",  "promoção"]
    
    # TODO: Verifique se alguma palavra suspeita está presente no corpo do e-mail:
    for palavra in palavras_suspeitas:
        if palavra.lower() in mensagem.lower():
            return "Phishing"
    
    return "Seguro"
        
email_usuario = input()

email_usuario = email_usuario.strip()

resultado = verificar_phishing(email_usuario)

print(f"Classificação: {resultado}")