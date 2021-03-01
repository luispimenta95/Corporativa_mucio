<?php
require 'mailer/PHPMailerAutoload.php';
$mail = new PHPMailer;
$mail->IsSMTP();        // Ativar SMTP
$mail->SMTPDebug = false;       // Debugar: 1 = erros e mensagens, 2 = mensagens apenas
$mail->SMTPAuth = true;     // Autenticação ativada
$mail->SMTPSecure = 'ssl';  // SSL REQUERIDO pelo GMail
$mail->Host = 'smtp.gmail.com'; // SMTP utilizado
$mail->Port = 465;
$mail->Username = 'luisfelipearaujopimenta@gmail.com';
$mail->Password = 'Mpl13151319';
$mail->SetFrom('luisfelipearaujopimenta@gmail.com', 'seu nome(ou qualquer coisa que quiser)');
$mail->addAddress('luisfelipearaujopimenta@gmail.com', 'qualquer coisa que quiser');
$mail->Subject = ("Assunto");
$mail->msgHTML("Sua mensagem");
if ($mail->send()) {
    echo "A";
} else {
    $mail->ErrorInfo;
}
