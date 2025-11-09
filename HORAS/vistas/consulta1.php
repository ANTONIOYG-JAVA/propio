<?php
    include("../CONF/conexion.php");
    

    $fechaini=$_GET['fechaini'];
    $fechafin=$_GET['fechafin'];
	$conex = mysqli_connect($host, $user, $contra ,$db) or trigger_error(mysql_error(),E_USER_ERROR);
    $resultado=mysqli_query($connexion, "SELECT fecha, entrada, salida, nombre_dia AS dia FROM horas INNER JOIN dia_semana ON horas.dsemana = dia_semana.dsemana WHERE fecha>'$fechaini' AND fecha<'$fechafin'");
    $dif = mysqli_query($connexion, "SELECT TIMEDIFF('salida', 'entrada')");
?>
	
<!DOCTYPE html>
<html>
<head>
    <title>LISTADO</title>
</head>
<body>
    <h1 align="center">LISTADO DE HORAS</h1>
    <table width="70%" border="1px" align="center">

    <tr align="center" background-color:green;>
        <td>FECHA</td>
        <td>ENTRADA</td>
        <td>SALIDA</td>
        <td>DIA</td>
        <td>DIFERENCIA</td>
    </tr>
    <?php 
        while($fila=mysqli_fetch_array($resultado)){
        ?>
            <tr align="center">
                <td><?php echo $fila[0]?></td>
                <td><?php echo $fila[1]?></td>
                <td><?php echo $fila[2]?></td>
                <td><?php echo $fila[3]?></td>
                <td><?php echo $fila[$dif] ?></td>                
            </tr>
            <?php   
        }
        mysqli_close($connexion)

     ?>
    </table>

</body>
</html>