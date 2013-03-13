package itm; 

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 * UserDAO es una interfaz para recuperar el usuario dado por parámetro
 * Para ello tiene el método público getUser(), que permite seleccionar el usuario dado por username en el objeto UserBean bean
 * Puede usarse para obtener la información de un usuario (isLogin=false) o para comprobar su contraseña y darle acceso(isLogin=true)
 */

public class UserDAO {
	
		
	static Connection currentCon = null;
	static ResultSet rs = null;

	/**
	 * 
	 * @param bean
	 * @param isLogin indica si la información se recupera por hacer login o no
	 * @return
	 */
	public static UserBean getUser(UserBean bean, boolean isLogin) {
		
		//preparing some objects for connection 
		PreparedStatement stmt = null;    
		
		String username = bean.getUsername();    
		String password = bean.getPassword();   
		
		String searchQuery;
		
		
		    
		try {
			//Conectar a la base de datos
			currentCon = ConnectionManager.getConnection();
			
			//Preparamos una consulta en función de si es comprobación de login o no
			if (isLogin) {
				searchQuery = "SELECT * FROM users where username = ? AND password = ?";
				stmt = currentCon.prepareStatement(searchQuery);
				stmt.setString(1,username);
				stmt.setString(2,password);
			} 
			else { 
				searchQuery = "SELECT * FROM users where username = ?";
				stmt = currentCon.prepareStatement(searchQuery);
				stmt.setString(1,username);
			}
			
			rs = stmt.executeQuery();	        
			boolean more = rs.next();
		   
			// if user does not exist set the isValid variable to false
			if (!more) {
				bean.setValid(false);
			} 
		    
			//if user exists set the isValid variable to true, y recogemos toda su información
			else if (more) {

				bean.setId( rs.getLong("idusers") );
				bean.setFirstName( rs.getString("firstname") );
				bean.setLastName(  rs.getString("lastname") );
				bean.setRegion( rs.getString("region") );
				bean.setBio( rs.getString("bio") );
				bean.setBirthday( rs.getDate("birthday") );
				
				bean.setTeach1_title( rs.getString("teach1_title") );
				bean.setTeach1_text( rs.getString("teach1_text") );
				bean.setTeach2_title( rs.getString("teach2_title") );
				bean.setTeach2_text( rs.getString("teach2_text") );
				bean.setTeach3_title( rs.getString("teach3_title") );
				bean.setTeach3_text( rs.getString("teach3_text") );
				bean.setTeach4_title( rs.getString("teach4_title") );
				bean.setTeach4_text( rs.getString("teach4_text") );
				bean.setTeach5_title( rs.getString("teach5_title") );
				bean.setTeach5_text( rs.getString("teach5_text") );
				bean.setTeach6_title( rs.getString("teach6_title") );
				bean.setTeach6_text( rs.getString("teach6_text") );
				
				bean.setLearn1_title( rs.getString("learn1_title") );
				bean.setLearn1_text( rs.getString("learn1_text") );
				bean.setLearn2_title( rs.getString("learn2_title") );
				bean.setLearn2_text( rs.getString("learn2_text") );
				bean.setLearn3_title( rs.getString("learn3_title") );
				bean.setLearn3_text( rs.getString("learn3_text") );
				bean.setLearn4_title( rs.getString("learn4_title") );
				bean.setLearn4_text( rs.getString("learn4_text") );
				bean.setLearn5_title( rs.getString("learn5_title") );
				bean.setLearn5_text( rs.getString("learn5_text") );
				bean.setLearn6_title( rs.getString("learn6_title") );
				bean.setLearn6_text( rs.getString("learn6_text") );
				
				bean.setValid(true);
				
			}
		
		}catch (Exception ex) {
		     System.err.println(ex);
		} 
	    
		//Hay que cerrar los recursos
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
				
		return bean;
					
	}
}