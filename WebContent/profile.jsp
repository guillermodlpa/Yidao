<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<% 

	//Comprobamos que venimos de un servlet. Así la dirección /pagina.jsp redireccionará a 404
	if(request.getAttribute("servlet") == null ){ 
		ServletContext contexto = getServletContext();
		RequestDispatcher dispatcher = contexto.getRequestDispatcher("/404.jsp");
		dispatcher.forward(request, response);
	}
%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="es">

	<head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inside.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <title>Yidao - Perfil</title>
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
				
					<div id="colIzquierda">
						<div>	<!-- INFORMACIÓN  DE USUARIO -->
							<div class="box-header">
								<p>Información de usuario</p>
							</div>
							<div class="box-content">
								<img id="profile-status" src="" title="Tengo tiempo para intercambios"/>
								<img id="profile-send" src="" title="Enviar un mensaje"/>
								<div>
									<p id="profile-name">${ user.firstName } ${ user.lastName }</p>
									<img id="profile-img" src="${pageContext.request.contextPath}/img/profile/${ user.username }.jpg"/>
								</div>
								
								<p>Usuario: ${ user.username }</p>
								<p>Provincia: ${ user.region }</p>
								<p>Fecha nac: ${ user.birthday }</p>
								<%--<p>Se conecta a menudo</p>--%>
								
								<c:if test="${ user.bio != null }">
									<div class="box-header">
										Bio
									</div>
									<p id="bio">${ user.bio }</p>
								</c:if>
								
								<p class="p-center"><a href="" class="button">Enviar mensaje</a></p>
								
							</div>
						</div>
						
						
					</div>
					
					<div id="colDerecha">

						<div> <!-- LO QUE SABE -->
							<div class="box-header">
								<p>Lo que puede aportar</p>
							</div>
							<div class="box-content">
								<c:if test="${user.teach1_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.teach1_title }">${ user.teach1_title }</a> ${ user.teach1_text }</p>
								</c:if>
								<c:if test="${user.teach2_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.teach2_title }">${ user.teach2_title }</a> ${ user.teach2_text }</p>
								</c:if>
								<c:if test="${user.teach3_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.teach3_title }">${ user.teach3_title }</a> ${ user.teach3_text }</p>
								</c:if>
								<c:if test="${user.teach4_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.teach4_title }">${ user.teach4_title }</a> ${ user.teach4_text }</p>
								</c:if>
								<c:if test="${user.teach5_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.teach5_title }">${ user.teach5_title }</a> ${ user.teach5_text }</p>
								</c:if>
								<c:if test="${user.teach6_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.teach6_title }">${ user.teach6_title }</a> ${ user.teach6_text }</p>
								</c:if>
								
								<c:if test="${user.teach1_title == null and
											  user.teach2_title == null and
											  user.teach3_title == null and
											  user.teach4_title == null and
											  user.teach5_title == null and
											  user.teach6_title == null}">
									<p>Este usuario no quiere decir qué puede ofrecer al mundo :(</p>	  
								</c:if>
							</div>
						</div>
						
						<div> <!-- LO QUE QUIERE SABER -->
							<div class="box-header">
								<p>Lo que quiere aprender</p>
							</div>
							<div class="box-content">
								<c:if test="${user.learn1_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.learn1_title }">${ user.learn1_title }</a> ${ user.learn1_text }</p>
								</c:if>
								<c:if test="${user.learn2_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.learn2_title }">${ user.learn2_title }</a> ${ user.learn2_text }</p>
								</c:if>
								<c:if test="${user.learn3_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.learn3_title }">${ user.learn3_title }</a> ${ user.learn3_text }</p>
								</c:if>
								<c:if test="${user.learn4_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.learn4_title }">${ user.learn4_title }</a> ${ user.learn4_text }</p>
								</c:if>
								<c:if test="${user.learn5_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.learn5_title }">${ user.learn5_title }</a> ${ user.learn5_text }</p>
								</c:if>
								<c:if test="${user.learn6_title != null}">
									<p><a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ user.learn6_title }">${ user.learn6_title }</a> ${ user.learn6_text }</p>
								</c:if>
								
								<c:if test="${user.learn1_title == null and
											  user.learn2_title == null and
											  user.learn3_title == null and
											  user.learn4_title == null and
											  user.learn5_title == null and
											  user.learn6_title == null}">
									<p>Este usuario no quiere aprender nada nuevo :(</p>	  
								</c:if>
							</div>
						</div>
						
						<div>	<!-- REFERENCIAS -->
							<div class="box-header">
								<p>Agradecimientos</p>
							</div>
							<div class="box-content">
							
								<c:forEach items="${references}" var="reference">
									<div class="ref">
										<div class="ref-img" >
											<a href="${pageContext.request.contextPath}/perfil/${ reference.sender.username }"><img src="${pageContext.request.contextPath}/img/profile/${reference.sender.username}.jpg"></a>
										</div>
										<div class="ref-text">
											<p class="msg-date">${ reference.timestamp }</p>
											<p><a class="ref-name" href="${pageContext.request.contextPath}/perfil/${ reference.sender.username }">
												${reference.sender.firstName} ${reference.sender.lastName}</a> de ${reference.sender.region}
											</p>
											<c:if test="${ reference.exchange }">
												<p>Enseñó <a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ reference.teach }">${ reference.teach }</a>
												 y aprendió <a class="zhidao" href="${pageContext.request.contextPath}/busqueda/${ reference.learn }">${ reference.learn }</a></p>
											</c:if>
											<p>${ reference.content }</p>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
					
				</div>
				
			</div>			
		</div>			
	</body>
</html>