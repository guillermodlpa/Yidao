<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<% 

	//Comprobamos que venimos de un servlet. Así la dirección /pagina.jsp redireccionará a 404
	if(request.getAttribute("servlet") == null ){ 
		ServletContext contexto = getServletContext();
		RequestDispatcher dispatcher = contexto.getRequestDispatcher("/404.jsp");
		dispatcher.forward(request, response);
	} 
	//Si el usuario ha iniciado sesión, entonces el atributo currentSessionUser no será nulo. Redirección a /inicio
	else {
		session = request.getSession();
		if(session.getAttribute("currentSessionUser") != null ) 
			response.sendRedirect(request.getContextPath()+"/inicio");
	}

%>

<!DOCTYPE html>
<html lang="es">

	<head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="css/main.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <title>Yidao</title>
    </head>
    
    <body> 
		<div id="document">
		
			
			<div id="header">
				<div>
					<p id="more-info-button"><a href="about.jsp">Más información</a></p>
					<h1><a href="">Yidao</a></h1>
				</div>
			</div>
			
			<div id="page">
			
				<div id="background">
					<img src="img/figuras1c.jpg"/>
				</div>
			
				<div id="central"> <!-- div central que contiene los dos divs que ocupan la mitad -->
					<div class="left">
						<h2>Sapere Aude</h2>
						<p>Aprende, enseña y crece</p>
						<p>Red social para el intercambio gratuito de conocimientos y habilidades entre personas</p>
					</div>
					
					<div class="right">
					<form method="post" action="login">
						<ul>
							<li>
								<label for="username">Usuario:</label>
								<input id="username" name="username"/>
							</li>
							<li>
								<label for="password">Contraseña:</label>
								<input type="password" id="password" name="password"/>
							</li>
						</ul>
						<input class="submit" type="submit" value="Login"/>
					</form>
					</div>
					
					
					<div class="right">
						<p>Yidao se encuentra en estado de beta privada, no obstante puedes registrarte para que en cuanto se abra te avisemos.</p>
						<!--<p id="new-account-button" ><a href="">Solicitar cuenta</a></p>-->
						<form>
							<ul>
							<li>
								<label for="name">Email:</label>
								<input id="name" name="name"/>
							</li>
							<li>
								<label for="username">Usuario:</label>
								<input id="username" name="username"/>
							</li>
						</ul>
						<input class="submit" type="submit" value="Solicitar cuenta"/>
						</form>
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>	
				</div>

			</div> 
			
		</div> 
	</body>
</html>