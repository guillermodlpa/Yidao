package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Este servlet maneja las HTTP requests dirigidas a /cuenta
 * Comprueba que el usuario haya hecho login. Si no, redirecciona a /index
 * Además, pone el atributo "servlet" a true para que settings.jsp compruebe que viene del sitio correcto
 */

public class SettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SettingsServlet() {
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
		
			ServletContext contexto = getServletContext();
			request.setAttribute("servlet",true);
			RequestDispatcher dispatcher = contexto.getRequestDispatcher("/settings.jsp");
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
