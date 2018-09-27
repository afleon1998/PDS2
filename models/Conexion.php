<?php

class Conexion{

	protected function Conectar(){
		try{
			$conexion = new PDO('mysql:host=localhost;dbname=deserciones;charset=utf8;','root','');

			$conexion->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
			return $conexion;
		} catch(Exception $e){
			die('Error Conexion(Conectar)'.$e->getMessage());
		}
 	}
}

?>