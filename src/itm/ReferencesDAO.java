package itm; 

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

/**
 * ReferencesDAO proporciona una interfaz en forma de método estático para obtener las referencias asociadas a un usuario
 */

public class ReferencesDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null;
	
	
	public static List<ReferenceBean> getReferences(UserBean currentUser) {
		
		List<ReferenceBean> references = new ArrayList<ReferenceBean>();
		
		//preparing some objects for connection 
		PreparedStatement stmt = null;    
		
		String searchQuery = "SELECT * FROM refs,users where refs.idreceiver = ? and users.idusers = refs.idsender";
		    
		try {
			//connect to DB 
			currentCon = ConnectionManager.getConnection();
			stmt = currentCon.prepareStatement(searchQuery);
			
			stmt = currentCon.prepareStatement(searchQuery);
			stmt.setLong(1, currentUser.getId() );
			
			rs = stmt.executeQuery();	        

			while (rs.next()) {

				ReferenceBean b = new ReferenceBean();
				b.setIdReceiver( rs.getLong("idreceiver") );
				
				UserBean sender = new UserBean();
				sender.setId(rs.getLong("idsender"));
				sender.setUsername( rs.getString("username") );
				sender.setFirstName (rs.getString("firstname") );
				sender.setLastName( rs.getString("lastname") );
				sender.setRegion( rs.getString("region") );
				if ( rs.getInt("picture") == 0)
					sender.setPicture( UserBean.getDefaultPicName() );
				else 
					sender.setPicture( sender.getUsername() );
				b.setSender( sender );
				
				b.setExchange( rs.getInt("exchange") != 0 );  //Con eso convertimos int{0,1} a boolean{false,true}
				b.setTeach( rs.getString("teach") );
				b.setLearn( rs.getString("learn") );
				b.setContent( rs.getString("content") );
				b.setTimestamp( rs.getDate("timestamp") );
				
				references.add(b);

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
				
		return references;
					
	}
}