package itm; 

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 * SearchDAO proporciona una interfaz para obtener los resultados de una búsqueda asociada a un String searchInput
 */

public class SearchDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null;
	
	public static List<UserBean> getUsers(String searchInput) {
		
		List<UserBean> result = new ArrayList<UserBean>();
		
		//preparing some objects for connection 
		PreparedStatement stmt = null;    
		
		String searchQuery = "SELECT idusers, username, firstname, lastname, region, nrefs, bio, birthday, teach1_title, teach1_text, teach2_title, teach2_text, teach3_title, teach3_text " +
				"FROM users " +
				"WHERE ( teach1_title = ? or teach2_title = ? or teach3_title = ? ) ";
		    
		try {
			//connect to DB 
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.prepareStatement(searchQuery);
			stmt.setString(1,searchInput);
			stmt.setString(2,searchInput);
			stmt.setString(3,searchInput);
			rs = stmt.executeQuery();	        

			while ( rs.next() ) {

				UserBean u = new UserBean();
				u.setFirstName( rs.getString("firstname") );
				u.setLastName( rs.getString("lastname") );
				u.setUsername( rs.getString("username") );
				u.setRegion( rs.getString("region") );
				
				u.setNreferences( rs.getInt( "nrefs" ) ); //Debe ser la última columna la de las referencias
				if ( rs.getInt("picture") == 0)
					u.setPicture( UserBean.getDefaultPicName() );
				else 
					u.setPicture( u.getUsername() );
				
				if (rs.getString("teach1_title").equalsIgnoreCase( searchInput)  ) {
					u.setTeach1_title( rs.getString("teach1_title") );
					u.setTeach1_text( rs.getString("teach1_text") );
				} else if (rs.getString("teach2_title").equalsIgnoreCase( searchInput)  ) {
					u.setTeach1_title( rs.getString("teach2_title") );
					u.setTeach1_text( rs.getString("teach2_text") );
				} else if (rs.getString("teach3_title").equalsIgnoreCase( searchInput)  ) {
					u.setTeach1_title( rs.getString("teach3_title") );
					u.setTeach1_text( rs.getString("teach3_text") );
				} 

				result.add(u);

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
				
		return result;
					
	}
}