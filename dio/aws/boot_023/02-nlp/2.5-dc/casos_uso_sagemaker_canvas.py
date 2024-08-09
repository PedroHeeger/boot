# Recebe a Entrada do usuário e armazena na variável "entrada"
entrada = input()

# Função responsável por receber um caso de uso e retornar sua respectiva descrição.
def descrever_casos(caso):
	if caso == "Resumir o conteúdo":
			return "Produza resumos concisos com as informações mais importantes"
			
	# TODO: Preencha corretamente a descrição de cada caso, considerando as condições abaixo e Saídas possíveis:			
	elif caso == "Gerar conteúdo de vendas e marketing":
	    return "Crie conteúdo de vendas e marketing personalizado"
	    
	elif caso == "Planejar o inventário com eficiência":
	    return "Preveja os níveis do inventário combinando dados"	
	
	elif caso == "Prever a rotatividade de clientes":
	    return "Descubra padrões de rotatividade de clientes"
	    	    
	elif caso == "Extrair informações de documentos":
	    return "Analise e extraia informações de uma variedade de documentos"
 
print(descrever_casos(entrada))