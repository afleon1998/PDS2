<?php

class LoginController extends Login{

	function Index(){
	require_once('views/All/Header.php');
	require_once('views/Aprendiz/Index.php');
	require_once('views/All/Footer.php');
	}

	function ValidarSession(){

		if($_POST['documentos']==0 || empty($_POST['num_document']) || empty($_POST['contrasena'])){
			echo "Campos Incompletos";
		}else{
			$data = array(
				'documentos'   => $_POST['documentos'],
				'num_document' => $_POST['num_document'],
				'contrasena'   => MD5($_POST['contrasena'])
				);
			if(parent::getValidarSession($data)->fetchColumn() > 0){

				$filas = parent::getValidarSession($data)->fetch();

				if($filas['Id_Tipo_Documento'] == $data['documentos'] && $filas['Numero_Documento'] == $data['num_document'] && $filas['Contraseña_Encriptada']==$data['contrasena']){
			
					$rol = $filas['Id_Rol'];

						switch ($rol){
							case 1:
								require_once('views/Aprendiz/Index.php');
								echo "Aprendiz";
									break;
							case 2:
								require_once('views/Lider-Area/Index.php');
								echo "Lider de Area";
									break;
							case 3:
								require_once('views/Instructor/Index.php');
								echo "Instructor";
									break;
							case 4:
								require_once('views/Salud/Index.php');
								echo "Enfermera";
									break;
							default:
									break;
						}
				}
			}else{
				echo '<script language="javascript">alert("Los Datos son Incorrectos");</script>';
			}
		}
	}
}

?>