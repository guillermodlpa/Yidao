<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<!DOCTYPE html>
<html lang="es">

	<head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inside.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/yidao.js"></script>
        <title>Yidao - Cuenta</title>
    </head>

    <body> 
		<div id="document">			
			
			<%@include file="WEB-INF/jspf/header-inside.jspf"%>
			
			<div id="page">
				<div id="central">
				
					<div id="settings-nav">
						<ul>
							<li> <input type="button" class="button" id="settings-profile-button" value="Perfil"/> </li>
							<li> <input type="button" class="button" id="settings-learn-button" value="Aprender"/> </li>
							<li> <input type="button" class="button" id="settings-teach-button" value="Enseñar"/> </li>
							<li> <input type="button" class="button" id="settings-notif-button" value="Notificaciones"/> </li>
							<li> <input type="button" class="button" id="settings-data-button" value="Datos de cuenta"/> </li>
							<li> <input type="button" class="button" id="settings-password-button" value="Contraseña"/> </li>
						</ul>
					</div>
				
				    <!-- PREFERENCIAS DE PERFIL -->
					<div id="settings-profile-view" class="settings-view">
						<div class="box-header"> 
							<p>Perfil</p>
						</div>
						<div class="form-box settings-box box-content">
							<div>
								<div class="left-div">
									<div>
										<img id="profile-img" src="img/profile/${ currentSessionUser.picture }.jpg"/>
										<p><a href="" class="small-button">Cambiar imagen</a></p>
									</div>
								</div>
								<div class="right-div">
								
								
									<p><label>Nombre<input class="atributo" type="text" value="${ currentSessionUser.firstName }"/></label></p>
									<p><label>Apellido<input class="atributo" type="text" value="${ currentSessionUser.lastName }"/></label></p>
									<p><label>Ubicación<input class="atributo" type="text" value="${ currentSessionUser.region }"/></label></p>
									<p>Usar localización actual de manera aproximada</p>
									<p><label>Fecha de nacimiento<input class="atributo" type="text" value="${ currentSessionUser.birthday }"/></label></p>
									<p><label><input type="checkbox" name="show-birthday"> Mostrar cumpleaños en el perfil</label>
								</div>
							</div>
							
							<div>
								<label for="bio-textarea">Descríbete en unas frases. Se mostrará en tu perfil</label>
								<textarea id="bio-textarea" name="bio">${ currentSessionUser.bio }</textarea>
							</div>
							<p class="p-center"><a href="" class="button">Guardar cambios</a></p>
						</div>
					</div>
					
					<!-- LO QUE SABE -->
					<div id="settings-learn-view" class="settings-view hidden">
						<div class="box-header"> 
							<p>Lo que puedo enseñar</p>
						</div>
						<div class="settings-box zhidao-box box-content">
	
							<c:if test="${currentSessionUser.teach1_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.teach1_title }</span>
									<textarea>${ currentSessionUser.teach1_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.teach2_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.teach2_title }</span>
									<textarea>${ currentSessionUser.teach2_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.teach3_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.teach3_title }</span>
									<textarea>${ currentSessionUser.teach3_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.teach4_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.teach4_title }</span>
									<textarea>${ currentSessionUser.teach4_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.teach5_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.teach5_title }</span>
									<textarea>${ currentSessionUser.teach5_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.teach6_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.teach6_title }</span>
									<textarea>${ currentSessionUser.teach6_text }</textarea>
								</div>
							</c:if>
							
							
							<p><a class="small-button" href="">Añadir nuevo ítem</a></p>
							<p class="p-center"><a href="" class="button">Guardar cambios</a></p>
						</div>

					</div>


					<div id="settings-teach-view" class="settings-view hidden">
						<div class="box-header"> <!-- LO QUE QUIERE APRENDER -->
							<p>Lo que quiero aprender</p>
						</div>
						<div class="settings-box zhidao-box box-content">
							
							<c:if test="${currentSessionUser.learn1_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.learn1_title }</span>
									<textarea>${ currentSessionUser.learn1_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.learn2_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.learn2_title }</span>
									<textarea>${ currentSessionUser.learn2_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.learn3_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.learn3_title }</span>
									<textarea>${ currentSessionUser.learn3_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.learn4_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.learn4_title }</span>
									<textarea>${ currentSessionUser.learn4_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.learn5_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.learn5_title }</span>
									<textarea>${ currentSessionUser.learn5_text }</textarea>
								</div>
							</c:if>
							<c:if test="${currentSessionUser.learn6_title != null}">
								<div>
									<img class="icon" src=""/><span class="zhidao">${ currentSessionUser.learn6_title }</span>
									<textarea>${ currentSessionUser.learn6_text }</textarea>
								</div>
							</c:if>
								
							<p><a class="small-button" href="">Añadir nuevo ítem</a></p>
							<p class="p-center"><a href="" class="button">Guardar cambios</a></p>
						</div>
					</div>
					
					<!-- NOTIFICACIONES -->
					<div id="settings-notif-view" class="settings-view hidden">
						<div class="box-header">
							<p>Notificaciones</p>
						</div>
						<div class="settings-box form-box box-content">
							<div>
								<p>Con estas opciones puedes elegir cuándo recibirás correos electrónicos</p>
								<p><label><input type="checkbox"/> Al recibir un nuevo mensaje </label></p>
								<p><label><input type="checkbox"/> Al recibir un agradecimiento </label></p>
								<p><label><input type="checkbox"/> Novedades en la web </label></p>
								<p><label><input type="checkbox"/> Eventos de tu interés </label></p>
								<p>
								  <input type="button" class="button" value="Activar todos"/> 
								  <input type="button" class="button" value="Desactivar todos"/> 
								</p>
								<p class="p-center"><a href="" class="button">Guardar cambios</a></p>
							</div>
						</div>
					</div>
					
					<!-- PREFERENCIAS DE CUENTA -->
					<div id="settings-data-view" class="settings-view hidden">
						<div class="box-header">
							<p>Preferencias de cuenta</p>
						</div>
						<div class="settings-box form-box box-content">
							<div>
								<p><label>Nombre de Usuario<input class="atributo" type="text" value="${ currentSessionUser.username }"/></label></p>
								<p><label>Email<input class="atributo" type="text" value="abadabanades@gmail.com"/></label></p>
								<p><label>Contraseña actual<input class="atributo" type="text"/></label></p>
								<p><label>Nueva contraseña<input class="atributo"type="text"/></label></p>
								<p><label>Confirmar nueva contraseña<input class="atributo"type="text"/></label></p>
								
							</div>
							<p class="p-center"><a href="" class="button">Guardar cambios</a></p>
						</div>
					</div>
					
					<!-- CONTRASEÑA -->
					<div id="settings-password-view" class="settings-view hidden">
						<div class="box-header">
							<p>Cambio de contraseña</p>
						</div>
						<div class="settings-box form-box box-content">
							<div>
								<p><label>Contraseña actual<input class="atributo" type="text"/></label></p>
								<p><label>Nueva contraseña<input class="atributo"type="text"/></label></p>
								<p><label>Confirmar nueva contraseña<input class="atributo"type="text"/></label></p>
								
							</div>
							<p class="p-center"><a href="" class="button">Guardar cambios</a></p>
						</div>
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
					
				</div>
			</div>			
		</div>			
	</body>
</html>
