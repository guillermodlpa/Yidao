package itm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * ConnectionManager es una interfaz para obtener conexiones a la base de datos
 * Para ello, ofrece un método llamado getConnection() que devuelve el objeto conexión para hacer consultas a la base de datos
 */
public class ConnectionManager {

   static Connection con;
   static String url;
         
   public static Connection getConnection()
   {
     
      try
      {
         String url = "jdbc:mysql://localhost:3306/yidao"; 
         String mysql_username = "root";
         String mysql_password = "gpa_123";

         Class.forName("com.mysql.jdbc.Driver");
         
         try
         {
        	 //Lógica de obtención de la conexión
             con = DriverManager.getConnection(url,mysql_username,mysql_password); 
              
         }
         
         catch (SQLException ex)
         {
            ex.printStackTrace();
         }
      }

      catch(ClassNotFoundException e)
      {
         System.out.println(e);
      }

   return con;
}
}