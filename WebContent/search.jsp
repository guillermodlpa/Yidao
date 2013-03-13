<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<% 
	//Comprobamos que venimos de un servlet. Así la dirección /pagina.jsp redireccionará a 404
	if(request.getAttribute("servlet") == null ){ 
		ServletContext contexto = getServletContext();
		RequestDispatcher dispatcher = contexto.getRequestDispatcher("/404.jsp");
		dispatcher.forward(request, response);
	} 
	//Si el usuario NO ha iniciado sesión, entonces el atributo currentSessionUser será nulo. Redirección a /index
	else {
		session = request.getSession();
		if(session.getAttribute("currentSessionUser") == null ) 
			response.sendRedirect(request.getContextPath()+"/index");
	}

%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="es">

	<head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inside.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <title>Yidao - Búsqueda</title>
    </head>
    
    <body> 
		<div id="document">
			
			<%@include file="WEB-INF/jspf/header-inside.jspf"%>
			
			<div id="page">
				<div id="central">
				
					<div class="box-header"> <c:out value=""></c:out>
						<p>Búsqueda de usuarios</p>
					</div>
					<div id="search" class="box-content">
						
						<form method="post" action="${pageContext.request.contextPath}/busqueda">
						
							<input type="submit" id="search-submit" class="button" value="Encontrar"/>
							<div id="search-input-box">
								<label for="search-input">¿Qué quieres aprender?</label>
								<input id="search-input" name="search-input" value="${searchInput}"/>
							</div>
							<div id="search-filters">
								<div>
									<p><input type="radio" name="location" id="filter-location-all" value="all"/> <label for="filter-location-all">Todos</label></p>
									<p><input type="radio" name="location" id="filter-location-local" value="local"/> <label for="filter-location-local">Sólo en mi provincia</label></p>
								</div>
							</div>
							
						</form>
						
						<c:if test="${ result[0] != null }">
							<div>
								<c:forEach items="${result}" var="user">
									<div class="search-result">
									
										<a href="${pageContext.request.contextPath}/perfil/${ user.username }" class="button">Ver perfil completo</a>
										<p><a href="${pageContext.request.contextPath}/perfil/${ user.username }">${ user.firstName } ${ user.lastName }</a></p>
										
										<a href="${pageContext.request.contextPath}/perfil/${ user.username }"><img src="${pageContext.request.contextPath}/img/profile/${ user.username }.jpg"/></a>
										<div>
											<p class="info">${ user.region }</p>
											<p><span class="zhidao">${ user.teach1_title }</span> ${ user.teach1_text }</p>
										</div>
										<a class="info search-result-ref" href="${pageContext.request.contextPath}/perfil/${ user.username }">5 referencias</a>
									</div>
								</c:forEach>
							</div>
						</c:if>
						
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
					
				</div>
				
				
				
			</div>
			
			
		</div>
	</body>
	
</html>