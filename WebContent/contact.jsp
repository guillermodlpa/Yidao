<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<% 

	//Comprobamos que venimos de un servlet. Así la dirección /pagina.jsp redireccionará a 404
	if(request.getAttribute("servlet") == null ){ 
		ServletContext contexto = getServletContext();
		RequestDispatcher dispatcher = contexto.getRequestDispatcher("/404.jsp");
		dispatcher.forward(request, response);
	} 

%>

<!DOCTYPE html>
<html lang="es">

	<head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="css/inside.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <title>Yidao - Contacto</title>
    </head>
    
    <body> 
		<div id="document">
			
			<%-- Comprobación de que se ha abierto una sesion. Dependiendo de ello cargamos el header público o privado--%>
			<% 
				session = request.getSession();
				if(session.getAttribute("currentSessionUser") == null ) {
			%>
				<%@include file="WEB-INF/jspf/header-public.jspf"%>
			<% } else { %>
				<%@ include file="WEB-INF/jspf/header-inside.jspf" %>
			<% }  %>
			
			<div id="page">
				<div id="central">
				
					<div class="box-header">
						<p>Dinos lo que quieras</p>
					</div>
					<div id="about-box" class="box-content">
						<div id="contact-data">
							<p>
								<label>Nombre
									<input class="atributo" type="text" value="tu nombre">
								</label>
							</p>
							<p>
								<label>Email
									<input class="atributo" type="text" value="tunombre@ejemplo.com">
								</label>
							</p>
						</div>
						<div>
							<textarea>Grandísima idea la vuestra, solo escribía para daros la enhorabuena</textarea>
						</div>
						<p class="p-center">
							<a class="small-button" href="">Envíar</a>
						</p>
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
				
				</div>
				
			</div>
			
		</div>
	</body>
	
</html>