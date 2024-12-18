<?php
function loadClass($c)
{
	include ROOT."/model/".$c.".class.php";
}
function alert_show($message){
	echo "<script> alert('$message'); </script>";
}
function getIndex($index, $value='none')
{
	$data = isset($_GET[$index])? $_GET[$index]:$value;
	return $data;
}

function postIndex($index, $value='none')
{
	$data = isset($_POST[$index])? $_POST[$index]:$value;
	return $data;
}

function requestIndex($index, $value='none')
{
	$data = isset($_REQUEST[$index])? $_REQUEST[$index]:$value;
	return $data;
}