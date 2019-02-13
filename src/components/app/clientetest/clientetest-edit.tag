
<clientetest-edit>
	<page id="clientetest-edit" title="Editar ClienteTests">
		<formbox title="Datos del ClienteTest" icon="fa fa-check-circle-o" action="update" return="clienteTest-admin">
			<div class="row">
				<div class="col-md-4">
				<inputbox id="Numero" type="number" pattern="[0-9]" onkeypress="return event.charCode >= 48 && event.charCode <= 57" label="Numero" value="" placeholder="Numero del ClienteTest" required=true disabled=false minsize=3 maxsize=100 />
				</div>
			
			<p hidden>1</p>
				<div class="col-md-4">	
				<inputbox id="Nombre" type="text" label="Nombre" value="" placeholder="Nombre del ClienteTest" required=true disabled=false />
				</div>
			
			<p hidden>2</p>
				<div class="col-md-4">	
				<inputbox id="Direccion" type="text" label="Direccion" value="" placeholder="Direccion del ClienteTest" required=true disabled=false />
				</div>
			</div>
			
			<p hidden>3</p>
		</formbox>
	</page>
</clientetest-edit>
