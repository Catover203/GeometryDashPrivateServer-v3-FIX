<?php
require __DIR__ . '/src/Exception.php';
require __DIR__ . '/src/CatBoomMailer.php';
require __DIR__ . '/src/SMTP.php';
use CatBoomMailer\CatBoomMailer\CatBoomMailer;
use CatBoomMailer\CatBoomMailer\Exception;

class CBMailer{
	function __construct($host, $port, $secure, $auth, $username, $password){
	$smtp = 
		[
		'host' => $host,
		'port' => $port,
		'secure' => $secure,
		'auth' => $auth,
		'username' => $username,
		'password' => $password
		];
     $this->smtp = $smtp;
}
	function send($to, $subject, $body, $header = ['isHTML' => false, 'From' => 'CatBoomMailer', 'to' => 'CatBoomMailerToUser']){
		$smtp = $this->smtp;
		$mail = new CatBoomMailer();
		$mail->IsSMTP();
		$mail->SMTPDebug  = 0;  
		$mail->SMTPAuth   = $smtp['auth'];
		$mail->SMTPSecure = $smtp['secure'];
		$mail->Port       = $smtp['port'];
		$mail->Host       = $smtp['host'];
		$mail->Username   = $smtp['username'];
		$mail->Password   = $smtp['password'];
		$mail->AddAddress($to, $header['to']);
		$mail->SetFrom($smtp['username'], $header['From']);
		$mail->Subject = $subject;
		$content = $body;
		if($header['isHTML'] == true){
			$mail->IsHTML($header['isHTML']);
			$mail->MsgHTML($content);
		}
		return $mail->send();
	}
}