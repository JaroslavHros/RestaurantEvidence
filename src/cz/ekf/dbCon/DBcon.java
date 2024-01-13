package cz.ekf.dbCon;

import java.nio.channels.AcceptPendingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon implements AutoCloseable {
	  static Connection con = null;
	  AutoCloseable ac ;
	 // static  String url = "jdbc:mysql://localhost:3306/mydb?useUnicode=true&amp;characterEncoding=utf8";
	//  static  String username = "root";
	 // static  String password = "passwd";
	 // static String  port = "3306";
	 // static String hostname = "jdbc:mysql://database-1.c2xqqvzd86ss.us-east-2.rds.amazonaws.com:3306/user","admin", "hateTOlose22";
	// static String userName = "admin";
	 // static String password = "passwd";
	  //static String dbName = "mydb";
	 // static String url = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
    public synchronized static Connection createConnection()
    {


    try
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        con = DriverManager.getConnection("jdbc:mysql://dbURL:3306/mydb","admin", "passwd");
        System.out.println("Post establishing a DB connection - "+con);
    }
    catch (SQLException e)
        {
           System.out.println("An error occurred. Maybe user/password is invalid");
         e.printStackTrace();
       }
  
    
   ;
    
    return con; 
    }

	public void  close() throws Exception {
		System.out.println("Post closing a DB connection - "+con);
		 ac.close();
		con.commit();
		con.close();
		
	}
  
    
}
