package servlets;

import itm.ConversationBean;
import itm.MessagesDAO;
import itm.UserBean;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Este servlet maneja las HTTP requests dirigidas a /mensajes
 * Comprueba que el usuario haya hecho login. Si no, redirecciona a /index
 * Además, pone el atributo "servlet" a true para que mailbox.jsp compruebe que viene del sitio correcto
 * Se encarga de usar MessagesDAO para obtener los mensajes asociados a ese usuario
 */

public class MailboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailboxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if(session.getAttribute("currentSessionUser") == null ) 
			response.sendRedirect(request.getContextPath()+"/index");
		
		else{
			
			UserBean currentUser = (UserBean)session.getAttribute("currentSessionUser");

			
			// Situación de envío de mensaje
			if ( "sendMessage".equals(request.getAttribute("action"))) {
				
				if (    request.getParameter("other-user-id") != null 
						&& request.getParameter("respuesta") != null) 
				{
					long conversationId = -1;
					if (request.getParameter("conversation-id") != null )
						conversationId = Long.parseLong( request.getParameter("conversation-id") );
					
					
					// Si exito es false, que se presente un mensaje de error al usuario
					boolean exito = MessagesDAO.sendMessage( currentUser, 
						                                     conversationId, 
											                 Long.parseLong(request.getParameter("other-user-id")), 
							                                 request.getParameter("respuesta") );
					
					
					response.sendRedirect(request.getContextPath()+"/mensajes");
				}
				
				// Si hay alguna anomalía con los parámetros necesarios, a 404 como si no existiera
				else
					response.sendRedirect(request.getContextPath()+"/404");

			// Situación de recuperación de mensajes
			} else {
			
				List<ConversationBean> conversations = MessagesDAO.getMessages(currentUser);
				   
				session.setAttribute("conversations",conversations);
				
				ServletContext contexto = getServletContext();
				request.setAttribute("servlet",true);
				RequestDispatcher dispatcher = contexto.getRequestDispatcher("/mailbox.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
