<?php
    include("../CONF/conexion.php");
    $fechaini=$_GET['fechaini'];
    $fechafin=$_GET['fechafin'];
    $vista=$_GET['vista'];
	$connexion=mysqli_connect($host,$user,$contra,$db);
    $consulta="CREATE VIEW ".$vista." AS";
	$consulta="SELECT *,(TIMESTAMPDIFF(hour, salida, entrada)+1) AS diferencias FROM horas WHERE fecha>'$fechaini' AND fecha<'$fechafin' ORDER BY fecha ASC";
	$consultasuma="SELECT SUM(DIFERENCIAS) FROM horas";
	
    $resultado=mysqli_query($conex, $consulta);
	
	
?>
	
<!DOCTYPE html>
<html>
<head>
    <title>LISTADO</title>
</head>
<body>
    <h1 align="center">LISTADO DE HORAS <?php echo $vista ?></h1>
    <table width="50%" border="1px" align="center">

    <tr align="center" bgcolor="#5AD538">
		<td>ID</td>
        <td>FECHA</td>
        <td>PROVINCIA</td>
        <td>ENTRADA</td>
        <td>SALIDA</td>
        <td>OBRA</td>
        <td>DSEMANA</td>
		<td>DIFERENCIAS</td>
        
    </tr>
    <?php
		
			while($fila=mysqli_fetch_array($resultado)){
				
        ?>
            <tr align="center">
                <td><?php echo $fila[0]?></td>
                <td><?php echo $fila[1]?></td>
                <td><?php echo $fila[2]?></td>
                <td><?php echo $fila[3]?></td>
                <td><?php echo $fila[4]?></td>
                <td><?php echo $fila[5]?></td>
				<td><?php echo $fila[6]?></td>
				<td><?php echo $fila[7]?></td>
                
            </tr>
           
    
	
	
	 <?php   
        }
        mysqli_close($connexion)
	
     ?>
	</table>	
		
</body>
</html>