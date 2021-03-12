<%@page import="com.abastos.market.web.util.ActionNames"%>
<%@page import="com.abastos.market.web.util.ParameterNames"%>
<%@page import="com.abastos.market.web.util.AttributesNames"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, com.abastos.model.*, com.abastos.service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://localhost:8080/abastos/css/estilo.css">
<link rel="stylesheet" media="(min-width: 800px)" href="http://localhost:8080/abastos/css/prueba.css">
<script defer src="js/script.js"></script>
</head>
<body>
	<header class="sectionTiendas">
		<figure>
			<img src="http://localhost:8080/abastos/img/logo_Mesa de trabajo 1.jpg" alt="">
		</figure>
		<section>
		<% String localidad = (String)request.getAttribute(AttributesNames.LOCALIDAD);%>
			<h1>Todos los ayuntamientos</h1>
			<form action="http://localhost:8080/abastos/tienda" method="post">
			<input type="hidden" name=<%=ParameterNames.LOCALIDAD%> value=<%=localidad%>>
			<input type="hidden" name=<%=ActionNames.ACTION %> value=<%=ActionNames.BUSCAR%>/>
			<input type="text" name="nombre">
			<input class="Buscar header" type="submit" value="buscar">
			</form>
		</section>
	</header>
	<section class="tiendas">
		<div class="tiendas2">
	</section>
	<section>
		<nav>
			<label class="menu" for="menu"> <input type="checkbox" />
				<div></div>
				<ul>
				
					<%List<Categoria> catServ = (List<Categoria>)request.getAttribute(AttributesNames.CATEGORIAS);%>
					<%for(Categoria cat: catServ){%>
					
					<li><a href="http://localhost:8080/abastos/tienda?action=buscar&categoria=<%=cat.getId()%>&localidad=<%=localidad%>"><%=cat.getNombre()%></a></li>
					<%}%>
					<form action="http://localhost:8080/abastos/tienda" method="post">
					<input type="hidden" name=<%=ActionNames.ACTION%> value=<%=ActionNames.BUSCAR%>/>
					
					<input type="hidden" name=<%=ActionNames.ACTION%> value=<%=localidad%>>
						<label>Envio a domicilio</label>
						<input type="checkbox" name=<%=ParameterNames.ENVIO_DOMICILIO%> value="true">
						<h5>Categoria</h5>
						<select name=<%=ParameterNames.CATEGORIA%>>
							<option disabled selected>todas las categorias</option>
							<option value="1">Deportes</option>
							<option value="2">Alimentaci�n</option>
							<option value="3">Juguetes</option>
							<option value="4">Droguer�a y salud</option>
							<option value="5">Moda y accesorios</option>
							<option value="6">Mascotas</option>
							<option value="7">Electr�nica e inform�tica</option>
							<option value="8">casa y jard�n</option>
						</select>
					
						<input type="submit"
							name="buscar" value="buscar">
					</form>
				</ul>
			</label>
		</nav>
	</section>
	<section class="tiendas producto">
		<div class="tiendas2">
		<%
		List<Tienda> results = (List<Tienda>) request.getAttribute(AttributesNames.TIENDA);
		%>
		<%
		for(Tienda t : results){
			%>
		
			<div>
				<figure>
					<a href="productos.html"><img src="http://localhost:8080/abastos/imgs/tiendas/<%=t.getId()%>-principal.jpg" alt="">
				</figure>
				<p>
					<a href="http://localhost:8080/abastos/tienda?action=detalle&id=<%=t.getId()%>"><%=t.getNombre()%></a>
				</p>
				<p><%=t.getDireccionDto().getLocalidad()%></p>
				<span><%=t.getPuntuacionMedia().getValoracionMedia()%></span>
			</div>
			<% 
			}
		%>
		</div>
	</section>
	<input type="radio" id="null" name="seleccion" checked>
	<input type="radio" id="foNav" name="seleccion">
	<input type="radio" id="registro" name="seleccion">
	<input type="radio" id="Idiomas" name="seleccion">
	<input type="radio" id="logIn" name="seleccion">

	<div class="footerNav">

		<div>
			<label primerBloque="a"for=registro>Registrarse</label><label segundoBloque="l" for="logIn">Inicio
				Sesi�n</label><label   for="foNav"><div ></div></label><label  for=null><div tercerBloque="z"></div></label><label
				cuartoBloque="b"for="Idiomas">Idioma</label>
		</div>
		<div class="forma">

			<label for="particular">Particular</label> <input type="radio"
				id="particular" name="perfil" checked> <label for="empresa">Empresa</label>
			<input type="radio" id="empresa" name="perfil">


			<button class="cerrarLabel"></button>

			<form>

				<label for="nomUsu">Nombre de usuario </label><br> <input
					type="text" id="nomUsu" required><br> <label
					for="email">Correo electr�nico </label><br> <input
					type="email" id="email" required><br> <label
					for="password">Contrase�a </label><br> <input type="password"
					id="password" required><br> <label for="password">Repetir
					Contrase�a </label><br> <input type="password" id="password"><br>
				<label for="pais">Pais</label><br> <input type="text" id="pais"><br>
				<label for="comunidadAutonoma">Comunidad autonoma</label><br> <input
					type="text" id="comunidadAutonoma"><br> <label
					for="provincia">Provincia</label><br> <input type="text"
					id="provincia"><br> <label for="localidad">Localidad</label><br>
				<input type="text" id="localidad"><br> <label
					for="codigoPostal">Codigo postal</label><br> <input
					type="text" id="codigoPostal"><br> <label for="calle">Calle</label><br>
				<input type="text" id="calle"><br> <label for="piso">Piso</label><br>
				<input type="text" id="piso"><br>
				<button type="submit">Registrarse</button>
			</form>
			<!--forma empresa-->


			<form>

				<label for="nomTien">Nombre de Tienda </label><br> <input
					type="text" id="nomTien" required><br> <label>Categoria
					de la tienda</label><br> <select name="categoria" id="categoria">
					<option value="cat1">ca</option>
					<option value="cat2">categoria</option>
					<option value="cat3">categoria</option>
					<option value="cat4">categoria</option>
					<option value="cat5">categoria</option>
					<option value="cat6">categoria</option>
					<option value="cat7">categoria</option>
					<option value="cat8">categoria</option>
				</select> <label for="nomUsu">Nombre de usuario</label><br> <input
					type="text" id="nomUsu" required><br> <label
					for="email">Correo electr�nico </label><br> <input
					type="email" id="email" required><br> <label
					for="telf">Tel�fono </label><br> <input type="text" id="telf"
					required><br> <label for="mov">M�vil </label><br>
				<input type="text" id="mov" required><br> <label
					for="password">Repetir Contrase�a </label><br> <input
					type="password" id="password"><br> <label for="pais">Pais</label><br>
				<input type="text" id="pais"><br> <label
					for="comunidadAutonoma">Comunidad autonoma</label><br> <input
					type="text" id="comunidadAutonoma"><br> <label
					for="provincia">Provincia</label><br> <input type="text"
					id="provincia"><br> <label for="localidad">Localidad</label><br>
				<input type="text" id="localidad"><br> <label
					for="codigoPostal">Codigo postal</label><br> <input
					type="text" id="codigoPostal"><br> <label for="calle">Calle</label><br>
				<input type="text" id="calle"><br> <label for="piso">Piso</label><br>
				<input type="text" id="piso"><br> <label for="cif">CIF</label><br>
				<input type="text" id="cif"><br>
				<p>Para mantener la calidad y confianza es neccesario verificar
					la existencia de la empresa.</p>

				<p>Una vez verificados los datos recibira un c�digo en el correo
					indicado.</p>
				<button type="submit">Registrarse</button>

			</form>
		</div>
		
		 <div class="registro">
			<button class="cerrarLabel"></button>
			<form action="http://localhost:8080/abastos/particular" method="post">
				<input type="hidden" name="action" value="logIn"/>
				<label for="particularLog">Particular</label> <input type="radio"
				id="particularLog" name="perfil" value="1" checked> <label for="empresaLog">Empresa</label>
			<input type="radio" id="empresaLog" value="2" name="perfil"><br>
			<label for="usuario">Usuario o email</label><br>
				 <input
					type="text" name=<%=ParameterNames.NOMBRE_USUARIO%>><br> <label for="password" >Contrase�a</label><br>
				<input type="password" name=<%=ParameterNames.PASSWORD %>><br> <input type="submit">
			</form>
		</div>
		<div class="idiomas">
			<label for="espanol">Espa�ol</label> <input type="radio" id="espanol"
				name="idioma"> <label for="ingles">Ingl�s</label> <input
				type="radio" id="ingles" name="idioma">
		</div>
		<figure>
			<img src="http://localhost:8080/abastos/imgs/logo_Mesa de trabajo 1.jpg" alt="">
		</figure>
		<section>
			<h1>Todos los ayuntamientos</h1>
			<form action="http://localhost:8080/abastos/tienda" method="post">
			<input type="hidden" name="localidad" value=<%=localidad%>>
			<input type="hidden" name="action" value="buscar"/>
			<input type="text" name="nombre">
			<input class="Buscar header" type="submit" value="buscar">
			</form>
		</section>
	</div>



</body>
</html>