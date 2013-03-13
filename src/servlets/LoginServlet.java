package servlets;


import itm.UserBean;
import itm.UserDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Este servlet maneja las HTTP requests dirigidas a /login
 * Recoge los parámetros de nombre de usuario o email y contraseña y usa UserDAO para comprobar que el usuario es válido.
 * Si lo es, se redirige a inicio. Si no, se redirige a index informando del error (aún no implementado)
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	    

			UserBean user = new UserBean();
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));

			user = UserDAO.getUser(user,false);
			   		    
			if (user.isValid()) {
			        
				HttpSession session = request.getSession(true);	    
				session.setAttribute("currentSessionUser",user); 
				response.sendRedirect("inicio"); //logged-in page      		
			}

			else 
				response.sendRedirect("index"); //error page 
		} 
					
		catch (Throwable theException) {
			System.err.println(theException); 
		}
	}


}
