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
        <title>Yidao - Inicio</title>
    </head>
    
    <body> 
		<div id="document">
			
			<%@include file="WEB-INF/jspf/header-inside.jspf"%>
			
			<div id="page">
				<div id="central">
				
					<div id="colIzquierda">
						<div>	<!-- NOVEDADES -->
							<div class="box-header">
								<p>Novedades</p>
							</div>

							<div class="box-content" id="news">
								<a href="${pageContext.request.contextPath}/perfil"><img src="img/profile/${ currentSessionUser.picture }.jpg"/></a>
								<p>Hola ${ currentSessionUser.firstName }</p>
								<p>Sin novedades desde la última visita</p>
							</div>
							
							<div class="box-header">
								<p>Novedades en Yidao</p>
							</div>
							<div class="box-content">
								
								<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. In ullamcorper dui in leo gravida in porttitor arcu laoreet. Pellentesque eu mauris magna. Vivamus nec ante a est luctus blandit.</p>
								<p>Proin eget nunc ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum eget feugiat quam.</p>
							</div>
							
						</div>
						
						
					</div>
					
					<div id="colDerecha">
						
						<%-- 
						<div>	<!-- COMPLETAR PERFIL -->
							<div class="box-header">
								<p>Completa tu perfil</p>
							</div>
							<div class="box-content" id="complete-profile">
								<p>¿Dónde has estudiado?</p>
								<form>
									<input id="complete-profile-input" name=""/>
									<input class="button" type="submit" value="Enviar"/>
									<a class="button" href="">Siguiente</a>
								</form>
							</div>
						</div>
						--%>
						
						<div> <!-- LO QUE TE PODRÍA INTERESAR -->
							<div class="box-header">
								<p>Lo que te podría interesar</p>
							</div>
							<div class="box-content" id="recommendations">
							
								<c:forEach items="${recommendations}" var="user">
									<div>
										<div>
											<p><a href="${pageContext.request.contextPath}/perfil/${ user.username }">${ user.firstName } ${ user.lastName }</a></p>
											<a href="${pageContext.request.contextPath}/perfil/${ user.username }"><img src="img/profile/${ user.picture }.jpg"></a>
											<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.teach1_title }">${ user.teach1_title }</a></p>
											</br>
										</div>
									</div>
								</c:forEach>

								<br/>
							</div>
						</div>
						
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
					
				</div>
				

			</div>			
		</div>			
	</body>
</html>