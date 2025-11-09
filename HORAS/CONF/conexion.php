<?php
$host = "localhost";
$db = "horashechas";
$user = "root";
$contra = "Avance25";
$conex = mysqli_connect($host, $user, $contra ,$db) or trigger_error(mysql_error(),E_USER_ERROR);


// se crea la conexión

$conex = new mysqli($host, $user, $contra, $db);

// se valida la conexión

if ($conex->connect_error) {

    die('Hubo un fallo en la conexión ' . $conex->connect_error);
};

?>