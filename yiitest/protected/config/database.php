<?php

// This is the database connection configuration.
return array(
	'class'=>'CDbConnection',
	'connectionString' => 'mysql:host=localhost;port=3306;dbname=testdb',
	'emulatePrepare' => true,
	'username' => 'yiitest',
	'password' => 'yiitest',
	'charset' => 'utf8',
);