<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<!DOCTYPE html>
<html lang="es">

	<head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inside.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <title>Yidao - 404</title>
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
						<p>Sobre nosotros</p>
					</div>
					<div id="about-box" class="box-content">
						<div>
							<p>Me parece que la página que has pedido no existe...</p>
						</div>
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
				
				</div>

				
			</div>
			
			
		</div>
	</body>
	
</html>