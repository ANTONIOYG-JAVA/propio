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
	$nombre=$_GET['nombre'];
	$apellidos=$_GET['apellidos'];
	$username=$_GET['usuario'];
	$email=$_GET['email'];
	$password=$_GET['password'];
	
	$sql="INSERT INTO user (nombre,apellidos,username,email,password) VALUES('$nombre','$apellidos','$username','$email','$password')";
    //ejecutamos la sentencia de sql
	$ejecutar=mysqli_query($conex, $sql);
	//verificamos la ejecucion
	if(!$ejecutar){
		echo"Hubo Algun Error";
	}else{
        mysqli_close($conex);
		echo" USUARIO REGISTRADO<br>
		
		<a href='../index.html'>Volver</a>";
	}
	
?>