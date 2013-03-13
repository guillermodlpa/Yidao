package servlets;

import itm.SearchDAO;
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
 * Este servlet maneja las HTTP requests dirigidas a /search
 * Comprueba que el usuario haya hecho login. Si no, redirecciona a /index
 * Además, pone el atributo "servlet" a true para que mailbox.jsp compruebe que viene del sitio correcto
 * Se encarga de usar SearchDAO para obtener la búsqueda resultado de searchInput
 */

public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Si venimos de /busqueda/(algo para buscar), tratamos la petición como si fuera un post con el campo de búsqueda de formulario
		if ( request.getParameter("search-input-url") != null )
			doPost( request, response );
		
		else {

			HttpSession session = request.getSession();
			if(session.getAttribute("currentSessionUser") == null ) 
				response.sendRedirect(request.getContextPath()+"/index");
			
			else{
				
				ServletContext contexto = getServletContext();
				request.setAttribute("servlet",true);
				RequestDispatcher dispatcher = contexto.getRequestDispatcher("/search.jsp");
				dispatcher.forward(request, response);
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("currentSessionUser") == null ) 
			response.sendRedirect(request.getContextPath()+"/index");
		
		else{
		
			String searchInputForm = request.getParameter("search-input");
			String searchInputURL = request.getParameter("search-input-url");
			String searchInput = "";
			
			//Si el input proviene del formulario, lo pasamos a UTF8
			if (searchInputForm != null) {
				searchInput = searchInputForm;
				searchInput = new String(searchInput.getBytes("8859_1"),"UTF8");
			} 
			//Si el input proviene de la URL, adaptamos los espacios
			else if ( searchInputURL != null) {
				searchInput = searchInputURL;
				searchInput = searchInput.replace("%20", " ");
			}
			
			
			if (searchInput != null) {
				
				try {	
					
					List<UserBean> result = SearchDAO.getUsers(searchInput);
					   
					request.setAttribute("result",result); 
					
				} catch (Exception e) {
					System.err.println(e);
				}
				
			}
			
			ServletContext contexto = getServletContext();
			request.setAttribute("servlet",true);
			request.setAttribute("searchInput",searchInput);
			RequestDispatcher dispatcher = contexto.getRequestDispatcher("/search.jsp");
			dispatcher.forward(request, response);
		
		}
	}

}
