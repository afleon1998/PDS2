<div class="container col-md-12 border border-primary" >
	<div class="container d-flex justify-content-center">
		<div class="row">
			<div class="col-md-12">
				<br>
				<h3 class="text-capitalize text-center">iniciar sesión</h3>
				<br>
				<form action="?c=Login&m=ValidarSession" method="POST">
					<table class="table table">
						<tbody>
							<tr>
					  			<td><label for="documento" class="text-capitalize">tipo de documento</label></td>
					  				<div class="input-group">
					  					<td><select class="form-control text-capitalize" name="documentos">
					  							<option value="0">seleccione su documento</option>
					  							<?php
					  							foreach (parent::getDocuments()	as $data){
					  							?>
					  								<option value=<?php echo $data->Id_Tipo_Documento; ?> ><?php echo $data->Descripcion_Tipo_Documento; ?></option>
					  								<?php
												}
												?>
					  						</select>
					  					</td>
					  				</div>
					  		</tr>
					  		<tr>
					  			<td><label for="correo" class="text-capitalize">número  de documento:</label></td>
					  			<div class="input-group">
									<td><input type="number" class="form-control text-capitalize" name="num_document" placeholder="numero de documento"></td>
								</div>
							</tr>
							<tr>
								<td><label for="contrasen" class="text-capitalize">contraseña:</label></td>
								<div class="input-group">
									<td><input type="password" class="form-control" name="contrasena" placeholder=""></td>
								</div>
							</tr>
							<tr>
								<td><span></span> </td>
							</tr>
						</tbody>
					</table>
						  	<center><button type="submit" class="btn btn-outline-primary text-capitalize" name="">ingresar</button>
						  	</center>
				</form>
				<br>
					<center><a href="#" class="text-capitalize">olvidé mi contraseña?</a></center>
			</div>
		</div>
	</div>
	<br>
</div>