<?php 
  include("../CONF/conexion.php");
	//conectamos Con el servidor
	$conex=mysqli_connect($host,$user,$contra,$db) or die("poblemas al conectar");
	//verificamos la conexion
	if(!$conex){
		echo"No Se Pudo Conectar Con El Servidor";
	}else{
        //echo"conectado bien <br>";
		$base=mysqli_select_db($conex, $db);
		if(!$base){
			echo"No Se Encontro La Base De Datos";			
		}
	}
	
	$usuario=$_GET['usuario'];
	$password=$_GET['password'];
	
	$sql="select * from user where username='$usuario' and password='$password'";
	$ejecutar=mysqli_query($conex, $sql);
	//verificamos la ejecucion
	if(!$ejecutar){
		echo"Hubo Algun Error";
	}else{
        mysqli_close($conex);
		echo" USUARIO IDENTIFICADO <br>
    PULSE PARA SEGUIR <br>
   
	<a href='../index.html'>Volver</a>";
	}



?>