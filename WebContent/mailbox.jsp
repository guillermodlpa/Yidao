<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>

<%-- Comprobación de que se ha abierto una sesion --%>
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
        <link rel="stylesheet" href="css/inside.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="js/yidao.js"></script>
        <title>Yidao - Mensajes</title>
    </head>
    
    <body> 
		<div id="document">
			
			<%@include file="WEB-INF/jspf/header-inside.jspf"%>
			
			<div id="page">
				<div id="central">
				
					<div class="box-header">
						<p>Tus mensajes</p>
					</div>
					<div id="mailbox" class="box-content">
						<div>
						 
						 <c:forEach items="${conversations}" var="cvr">

								<div class="conversation conversation-closed">
									<button class="show-button"></button>
									
									
									<a href=""><img class="msg-profile" src=""></a>
									<a href=""><img class="msg-delete" src=""></a>
									<p class="msg-date">${ cvr.timestamp }</p>
									<a href="${pageContext.request.contextPath}/perfil/${ cvr.other_user_bean.username }">
										<img class="msg-img" src="${pageContext.request.contextPath}/img/profile/${ cvr.other_user_bean.username }.jpg">
									</a>
									<p><a href="${pageContext.request.contextPath}/perfil/${ cvr.other_user_bean.username }">${ cvr.other_user_bean.firstName } ${ cvr.other_user_bean.lastName }</a></p>
									
									<p class="summary">${ cvr.last_summary }</p>
									
									
									<c:forEach items="${cvr.messages}" var="msg" varStatus="status">
									
										<div class="answer-div">
										
											<%-- Tratamos de forma diferente al primer mensaje recuperado, que es el último de la conversación --%>
											<c:if test="${status.first }">
											
												<%-- Si el último mensaje de la conversación es del usuario que ha hecho login, mostramos su foto --%>
												<c:if test="${ cvr.self_user_id eq msg.idSender }">
													<a href="${pageContext.request.contextPath}/perfil/${ currentSessionUser.username }">
														<img class="msg-img" src="${pageContext.request.contextPath}/img/profile/${ currentSessionUser.username }.jpg">
													</a>
												</c:if>
												
												<p>${ msg.content }</p>
												<form method="post" action="enviarMensaje">
													<textarea name="respuesta" title="Escribe aquí tu respuesta">Escribe aquí tu respuesta...</textarea>
													<input type="submit" class="button" value="Enviar"/>
													<input type="hidden" name="conversation-id" value="${cvr.id }"/>
													<input type="hidden" name="other-user-id" value="${cvr.other_user_bean.id }"/>
												</form>
												
											</c:if>
									
											<%-- El resto de mensajes (los que no son el último) aparecen anidados --%>
											<c:if test="${not status.first }">

												<div class="conversation conversation-closed">
													<button class="show-button"></button>
													
													<%-- Damos a la variable sender el objeto de UserBean que envía el mensaje --%>
													<c:if test="${ cvr.self_user_id eq msg.idReceiver }">
														<c:set var="sender" value="${ cvr.other_user_bean }"/>
														
													</c:if>
													<c:if test="${ cvr.self_user_id eq msg.idSender }">
														<c:set var="sender" value="${ currentSessionUser }"/>
													</c:if>
													
													<%-- La variable sender contiene los datos del usuario que envía, sea el que ha hecho login o el otro --%>
													<a href=""><img class="msg-profile" src=""></a>
													<a href=""><img class="msg-delete" src=""></a>
													<p class="msg-date">${ msg.timestamp }</p>
													<a href="${pageContext.request.contextPath}/perfil/${ sender.username }">
														<img class="msg-img" src="${pageContext.request.contextPath}/img/profile/${ sender.username }.jpg">
													</a>
													<p><a href="${pageContext.request.contextPath}/perfil/${ sender.username }">${ sender.firstName } ${ sender.lastName }</a></p>
													<p class="summary">${ msg.summary }</p>
													
													<div class="answer-div">
														<p>${ msg.content }</p>
													</div>
				
												</div>
											
											
											</c:if>
											
											
										</div>
									
									</c:forEach>

								</div>

							</c:forEach>
							
						</div>
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
				
				</div>
				
				
			</div>
			
			
		</div>
	</body>
	
</html>