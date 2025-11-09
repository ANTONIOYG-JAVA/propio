<?php
    
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
	//recuperar las variables
	$fecha=$_GET['fecha'];
	$provincia=$_GET['provincia'];
	$entrada=$_GET['entrada'];
	$salida=$_GET['salida'];
	$obra=$_GET['obra'];
	$dsemana=$_GET['dsemana'];
	//hacemos la sentencia de sql
	$sql="INSERT into horas (fecha, provincia, entrada, salida, obra, dsemana) VALUES ('$fecha', '$provincia', '$entrada', '$salida', '$obra', '$dsemana')";
    //ejecutamos la sentencia de sql
	$ejecutar=mysqli_query($conex, $sql);
	//verificamos la ejecucion
	if(!$ejecutar){
		echo"Hubo Algun Error";
	}else{
        mysqli_close($conex);
		echo" Datos Guardados Correctamente<br>
    
   
	<a href='../index.php'>Volver</a>";
	}
?>
