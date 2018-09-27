<?php

class Login extends Conexion{

	private function Documents(){

		try {
			$SQL = "SELECT * FROM tipos_documentos where Estado_Tipo_Documento = 'A'";
			$result = $this->Conectar()->prepare($SQL);
			$result->execute();
			return $result->fetchAll(PDO::FETCH_OBJ);
		}catch (Exception $e){
			die('Error IniciarSession(Documents) '.$e->getMessage());
		} finally{
			$result = null;
		}

	}
	public function getDocuments(){
		return $this->Documents();
	}
	
	private function ValidarSession($data){
		try{
			$SQL= "SELECT * FROM usuarios where Id_Tipo_Documento = ? and Numero_Documento = ? and Contraseña_Encriptada = ? and Estado_Usuario = 'A'";
			$result = $this->Conectar()->prepare($SQL);
			$result->execute(array(
									$data['documentos'],
									$data['num_document'],
									$data['contrasena']
			));
			return $result;
		} catch(Exception $e){
			die('Error IniciarSession (ValidarSession)'.$e->getMessage());
		} finally{
			$result= null;
		}
	}

	public function getValidarSession($data){
		return $this->ValidarSession($data);
	}
}


?>