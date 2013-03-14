package itm; 

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 * RecommendationsDAO proporciona una interfaz en forma de método estático para obtener las recomendaciones asociadas a un usuario
 */

public class RecommendationsDAO {
	
	private static final int NumberOfRecommendations = 6;
		
	static Connection currentCon = null;
	static ResultSet rs = null;
	
	
	public static List<UserBean> getUsers(UserBean currentUser) {
		
		List<UserBean> recommendations = new ArrayList<UserBean>();
		
		//preparing some objects for connection 
		PreparedStatement stmt = null;    
		
		String searchQuery = "SELECT * FROM users";
		    
		try {
			//connect to DB 
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.prepareStatement(searchQuery);
			
			rs = stmt.executeQuery();	        
			boolean more = rs.next();
		   
			int i = 0;
			
			while (more && i < NumberOfRecommendations) {

				UserBean u = new UserBean();
				u.setFirstName( rs.getString("firstname") );
				u.setLastName( rs.getString("lastname") );
				u.setTeach1_title( rs.getString("teach1_title") );
				u.setUsername( rs.getString("username") );
				
				recommendations.add(u);
				i++;
				more = rs.next();
			}
		
		}catch (Exception ex) {
		     System.err.println(ex);
		} 
	    
		  //some exception handling
		finally {
		     if (rs != null)	{
		        try {
		           rs.close();
		        } catch (Exception e) { System.err.println(e); }
		           rs = null;
		        }
		
		     if (stmt != null) {
		        try {
		           stmt.close();
		        } catch (Exception e) { System.err.println(e); }
		           stmt = null;
		        }
		
		     if (currentCon != null) {
		        try {
		           currentCon.close();
		        } catch (Exception e) { System.err.println(e); }
		
		        currentCon = null;
		     }
		}
				
		return recommendations;
					
	}
}