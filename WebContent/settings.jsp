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
        <link rel="stylesheet" href="css/inside.css"/>
        <link href='http://fonts.googleapis.com/css?family=Clicker+Script' rel='stylesheet' type='text/css'/>
        <title>Yidao - Cuenta</title>
    </head>

    <body> 
		<div id="document">			
			
			<%@include file="WEB-INF/jspf/header-inside.jspf"%>
			
			<div id="page">
				<div id="central">
					<div class="box-header"> <!-- PREFERENCIAS DE PERFIL -->
						<p>Perfil</p>
					</div>
					<div class="form-box settings-box box-content">
						<div>
							<div class="left-div">
								<div>
									<img id="profile-img" src="img/profile/${ currentSessionUser.username }.jpg"/>
									<p><a href="" class="small-button">Cambiar imagen</a></p>
								</div>
							</div>
							<div class="right-div">
								<p><label>Nombre<input class="atributo" type="text" value="${ currentSessionUser.firstName }"/></label></p>
								<p><label>Apellido<input class="atributo" type="text" value="${ currentSessionUser.lastName }"/></label></p>
								<p><label>Ciudad<input class="atributo" type="text" value="${ currentSessionUser.region }"/></label></p>
								<p><label>Fecha de nacimiento<input class="atributo" type="text" value="${ currentSessionUser.birthday }"/></label></p>
								
								<div>
									<p><label><input type="radio" name="profile-status"/><img class="profile-status" src="" title="Tengo tiempo para intercambios"/> Estoy disponible para intercambios</p>
									<p><label><input type="radio" name="profile-status"/><img class="profile-status" src="" title="Tengo tiempo para intercambios"/> No estoy disponible para intercambios, pero podemos hablar por mensajes</p>
									<p><label><input type="radio" name="profile-status"/><img class="profile-status" src="" title="Tengo tiempo para intercambios"/> Demasiado ocupado ahora mismo</p>
								</div>
							</div>
						</div>
						<div>
							<label for="bio-textarea">Descríbete en unas frases. Se mostrará en tu perfil</label>
							<textarea id="bio-textarea" name="bio">${ currentSessionUser.bio }</textarea>
						</div>
						<p class="p-center"><a href="" class="button">Guardar cambios</a></p>
					</div>

					<div class="box-header"> <!-- LO QUE SABE -->
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

					<div class="box-header">  <!-- PREFERENCIAS DE CUENTA -->
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
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
					
				</div>
			</div>			
		</div>			
	</body>
</html>
