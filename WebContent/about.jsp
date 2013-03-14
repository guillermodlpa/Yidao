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
        <title>Yidao - Sobre yidao</title>
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
							<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. In ullamcorper dui in leo gravida in porttitor arcu laoreet. Pellentesque eu mauris magna. Vivamus nec ante a est luctus blandit. Nunc sed quam scelerisque sapien fermentum volutpat. Nunc sollicitudin ullamcorper felis ut feugiat. Fusce sollicitudin massa id quam tincidunt cursus. Vivamus vulputate leo sed diam eleifend eget blandit sapien egestas. Pellentesque malesuada felis quis felis viverra viverra. Cras non sapien neque. Donec laoreet orci sit amet risus gravida gravida lacinia tellus vulputate.</p>

							<p>Nulla consequat mattis massa sit amet facilisis. Quisque posuere lacus sit amet urna suscipit imperdiet. Nulla eget arcu vitae risus rutrum sagittis. Sed massa velit, vehicula at interdum vitae, mattis eu neque. Donec egestas felis ultricies augue venenatis imperdiet. Praesent tincidunt augue vel nibh elementum commodo. Pellentesque venenatis tortor sit amet augue eleifend egestas. Pellentesque hendrerit ultricies sodales.</p>

							<p>	Maecenas sapien dolor, feugiat vitae commodo ut, volutpat ut eros. Nullam bibendum, velit eu molestie malesuada, ante lorem ornare nunc, quis mattis quam elit id felis. Etiam porttitor vulputate augue et tempor. Curabitur nec elit eget ante accumsan condimentum. Suspendisse ut enim lacus. Nulla aliquet tristique nisl, eget consequat ligula euismod non. Vivamus imperdiet, tortor non scelerisque faucibus, libero quam vulputate tellus, sed varius libero nibh nec tortor. Nulla imperdiet consectetur eros, vitae vehicula mauris viverra elementum.</p>

							<p>Etiam a est in diam dapibus elementum non sit amet lorem. Pellentesque mauris eros, consectetur eu faucibus ut, pharetra nec lacus. Integer laoreet quam ac lorem venenatis at euismod neque ultricies. Aliquam erat volutpat. Aliquam id mauris a dui ultrices facilisis. Integer mattis dui vel dui facilisis consectetur. Integer venenatis elementum velit nec pulvinar.</p>

							<p>Proin eget nunc ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum eget feugiat quam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ut urna elit, et pellentesque nisi. Vestibulum vel ante justo. Quisque blandit, ligula id faucibus molestie, risus elit tristique metus, vitae lobortis lorem mi ac lacus.</p>
						</div>
					</div>
					
					<%@include file="WEB-INF/jspf/footer.jspf"%>
				
				</div>
				
				
				
			</div>
			
			
		</div>
	</body>
	
</html>