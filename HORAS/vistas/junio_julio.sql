CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `junio_julio` AS
    SELECT 
        `horas`.`FECHA` AS `FECHA`,
        `horas`.`PROVINCIA` AS `PROVINCIA`,
        `horas`.`ENTRADA` AS `ENTRADA`,
        `horas`.`SALIDA` AS `SALIDA`,
        `horas`.`OBRA` AS `OBRA`,
        `horas`.`DSEMANA` AS `DSEMANA`
    FROM
        `horas`
    WHERE
        ((`horas`.`FECHA` > '2020-06-20')
            AND (`horas`.`FECHA` < '2020-07-21'))