<?php
/*----------------------------------------*/
// @name: CSA                             //
// @author: Catover203                    //
// @version: 1.2                          //
/*----------------------------------------*/
namespace Catover203\Crypto;
class CSA{
	function __construct($debug = 0){
	    $this->debug = $debug;
	    $this->encrypt = 'sNUAD*\XnF5\W<ZoIM!^+U[>Udn';
	}
	function private_key_to_public_key($private_key){
		if(!empty($private_key)){
			$key = $this->text2ascii($this->crypt_key(base64_decode($private_key)));
			$eak = $this->ekey($key);
			$keysize = count($key);
			$cipher = "";
			for($i = 0; $i < $keysize; $i++){
				$cipher .= chr($key[$i] ^ $eak);
			}
			if($this->debug == 1){
				echo "\nConverting key to public";
			}
			return base64_encode($this->crypt_key($cipher));
		}else{
			return false;
			$this->error('turn private key to public key', 'missing private key');
		}
	}
	 function decrypt($text, $private_key) {
		if(!empty($private_key)){
			$key = $this->text2ascii($this->crypt_key(base64_decode($private_key)));
			$eak = $this->ekey($key);
			$text = $this->text2ascii($text);
			$keysize = count($key);
			$text_size = count($text);
			$crypt = "";
			for ($i = 0; $i < $text_size; $i++){
				$crypt .= chr($text[$i] ^ ($key[$i % $keysize] ^ $eak));
			}
			if($this->debug == 1){
				echo "\nDecrypting";
			}
			return $crypt;
		}else{
			return false;
			$this->error('decrypt','missing private key');
		}
	}
	 function encrypt($text, $public_key){
		if(!empty($public_key)){
			$key = $this->text2ascii($this->crypt_key(base64_decode($public_key)));
			$eak = $this->ekey($key);
			$text = $this->text2ascii($text);
			$keysize = count($key);
			$text_size = count($text);
			$cipher = "";
			for($i = 0; $i < $text_size; $i++){
				$cipher .= chr($text[$i] ^ $key[$i % $keysize]);
			}
			if($this->debug == 1){
				echo "\nEncrypting";
			}
			return $cipher;
		}else{
			return false;
			$this->error('encrypt', 'missing public key');
		}
	 }
	 function create_private_key($bit = 2048){
		if(in_array($bit, array(512, 1024, 2048, 4096, 8192, 16384))){
			$key = '';
			$e = 0;
			for($x = 0; $x < $bit; $x++){
				$rand = rand(32, 126);
				$key .= chr($rand);
				$e = $e+$rand;
				if($this->debug == 1 && $x % 2 == 0){
					if($rand > 63){
						echo '+';
					}else{
						echo '.';
					}
				}
			}
			if($this->debug == 1){
				echo "\ngenerate key finissed, e is ".$e;
			}
			return base64_encode($this->crypt_key($key));
		}else{
			return false;
			$this->error('Create private key', 'invalid bit length');
		}
	}
	private function crypt_key($text){
		$key = $this->text2ascii($this->encrypt);
		$text = $this->text2ascii($text);
		$keysize = count($key);
		$text_size = count($text);
		$cipher = "";
		for($i = 0; $i < $text_size; $i++){
			$cipher .= chr($text[$i] ^ $key[$i % $keysize]);
		}
		if($this->debug == 1){
			echo "\nCrypting key";
		}
		return $cipher;
	}
	private function text2ascii($text){
		return array_map('ord', str_split($text));
	}
	private function ekey($ascii) {
		$text = 0;
		foreach($ascii as $char){
			$text = $text+$char;
		}
		return $text;
	}
	private function error($name, $reason){
		echo "<br><b>CSA Error:</b> Could not ".$name.", ".$reason." in <b>".$_SERVER['DOCUMENT_ROOT'].substr($_SERVER['SCRIPT_NAME'],1)."</b>.";
	}
}
?>
