<?php
	echo "<pre>";
    
   
	include("../CONF/conexion.php");

	//conectamos Con el servidor

	$conex=mysqli_connect($host,$user,$contra,$db) or die("poblemas al conectar");

	//verificamos la conexion

	if(!$conex){
		echo"No Se Pudo Conectar Con El Servidor";
	}else{
        echo"conectado bien <br>";
		$base=mysqli_select_db($conex, $db);
		if(!$base){
			echo"No Se Encontro La Base De Datos";			
		}
	}
    $fechaini=$_GET['fechaini'];
    $fechafin=$_GET['fechafin'];
    $vista=$_GET['vista'];
   

	/* Creamos una vista a partir de una consulta que nos recupera los usuarios que tienen provincia 
	asignada, con el nombre de dicha provincia. */

	$consulta = "CREATE VIEW IF NOT EXISTS '$vista' AS ";
	$consulta .= "SELECT ";
	$consulta .= "horas.fecha, ";
	$consulta .= "horas.entrada, ";
	$consulta .= "horas.salida, ";
	$consulta .= "dia_semana.nombre_dia ";
	$consulta .= "FROM ";
	$consulta .= "horas ";
	$consulta .= "INNER JOIN dia_semana ";
	$consulta .= "ON horas.dsemana = dia_semana.dsemana ";
	$consulta .= "ORDER BY fecha;";
	$resul=mysqli_query($conex, $consulta);

	/* Recuperamos el contenido de la vista recién creada. */
	$consulta1 = "SELECT * FROM ";
	$consulta1  = "'$vista' ";
    $consulta1 = "WHERE horas.fecha>'$fechaini' AND horas.fecha<'$fechafin' ";
	$hacerConsulta = mysqli_query($conex, $consulta1);
	

	/* Mostramos la vista */
	echo "LA VISTA ORIGINAL:<br>";
	echo "==================<br>";
	var_dump($hacerConsulta);

	
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Documento sin título</title>
</head>

<body>
</body>
</html>