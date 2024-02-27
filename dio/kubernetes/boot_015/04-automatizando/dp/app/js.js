$("#btn_salvar").on("click", function() {
    
    var txt_nome = $("#nome").val();
    var txt_mensagem = $("#mensagem").val(); 

    $.ajax({
        url: "http://aa0c30e5e1a444e24831e8ffd12cb086-725509074.us-east-1.elb.amazonaws.com//incluir.php",
        type: "post",
        data: {nome: txt_nome, mensagem: txt_mensagem},
        beforeSend: function() {
            $("#resposta").html("Enviando......");
        }
    }).done(function(e) {
        $("#resposta").html("Dados salvos......");
    })

})
