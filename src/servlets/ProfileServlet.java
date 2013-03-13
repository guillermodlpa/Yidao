package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

import obj.ReferencesDAO;
import obj.UserDAO;
import obj.UserBean;
import obj.ReferenceBean;

/**
 * Este servlet maneja las HTTP requests dirigidas a /perfil
 * Dependiendo del atributo username, que viene de URLRewriter, y según esté vacío o no carga el perfil del usuario activo o del perfil solicitado
 * Además, pone el atributo "servlet" a true para que mailbox.jsp compruebe que viene del sitio correcto
 * Se encarga de usar ReferencesDAO para obtener las referencias asociados a ese usuario
 */

public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		
		String currentUserUsername = "";
		HttpSession session = request.getSession();
		if(session.getAttribute("currentSessionUser") != null )
			currentUserUsername = ( (UserBean)session.getAttribute("currentSessionUser") ).getUsername();
		
		if( username != null && !username.equals(currentUserUsername) ) {

			UserBean user = new UserBean();
			user.setUsername(username);

			user = UserDAO.getUser(user,false);
			request.setAttribute("user", user);
			
			if (user.getId() == null){
				
				ServletContext contexto = getServletContext();
				RequestDispatcher dispatcher = contexto.getRequestDispatcher("/404.jsp");
				dispatcher.forward(request, response); 
				
			} 
			else {

				List<ReferenceBean> references = ReferencesDAO.getReferences(user);
				request.setAttribute("references",references); 
				
				ServletContext contexto = getServletContext();
				request.setAttribute("servlet",true);
				RequestDispatcher dispatcher = contexto.getRequestDispatcher("/profile.jsp");
				dispatcher.forward(request, response);
			}
			
		} else if (username != null && username.equals(currentUserUsername) ) { 
			
			response.sendRedirect(request.getContextPath()+"/perfil");
		
		} else {
			
			session = request.getSession();	    
			request.setAttribute("user", session.getAttribute("currentSessionUser") );
			
			List<ReferenceBean> references = ReferencesDAO.getReferences( (UserBean)session.getAttribute("currentSessionUser") );
			request.setAttribute("references",references);
			
			ServletContext contexto = getServletContext();
			request.setAttribute("servlet",true);
			RequestDispatcher dispatcher = contexto.getRequestDispatcher("/profile.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
