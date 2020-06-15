<?php

	$host = 'localhost';
	$db_name = 'bd';
	$db_user = 'mysql';
	$db_pass = 'mysql';

	$options = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION];

	try {
		$db = new PDO("mysql:host=$host;dbname=$db_name;charset=utf8", $db_user, $db_pass, $options);
	} catch (PDOException $e) {
		die ('Подключение не удалось!');
	}

?>