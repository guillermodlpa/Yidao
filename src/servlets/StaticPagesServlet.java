package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet para encaminar los forward de las páginas estáticas, como el about o los términos de servicio
 * Simplemente no merece la pena hacer un servlet para cada página estática
 */
public class StaticPagesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaticPagesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getAttribute("action") == null) {
			response.sendRedirect(request.getContextPath()+"/404");
		}
		else{
			String action = request.getAttribute("action").toString();
			ServletContext contexto = getServletContext();
			request.setAttribute("servlet",true);
			
			if ( action.equals("about") ) {
				RequestDispatcher dispatcher = contexto.getRequestDispatcher("/about.jsp");
				dispatcher.forward(request, response);
			} else if ( action.equals("terms") ) {
				RequestDispatcher dispatcher = contexto.getRequestDispatcher("/terms.jsp");
				dispatcher.forward(request, response);
			} else if ( action.equals("contact") ) {
				RequestDispatcher dispatcher = contexto.getRequestDispatcher("/contact.jsp");
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath()+"/404");
			}
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
