<?php
chdir(dirname(__FILE__));
//error_reporting(0);
include "../lib/connection.php";
require_once "../lib/GJPCheck.php";
require_once "../lib/exploitPatch.php";
$ep = new exploitPatch();
require_once "../lib/mainLib.php";
$gs = new mainLib();
$gjp = $ep->remove($_POST["gjp"]);
$id = $ep->remove($_POST["accountID"]);
if($id != "" AND $gjp != ""){
	$GJPCheck = new GJPCheck();
	$gjpresult = $GJPCheck->check($gjp,$id);
	if($gjpresult == 1){
		$permState = $gs->getMaxValuePermission($id, "actionRequestMod");
		echo $permState;
	}else{
		echo -1;
	}
}else{
	echo -1;
}

if($id == $a Or $b){
echo 2;
}
else
{
echo -1;
}
$a = "1";
$b = "71";
//If you want to add more elder mod you must add more $. Example:(> if($id == $a Or $b Or $c Or $d) and $c and $d is the accountsID<)
?>
