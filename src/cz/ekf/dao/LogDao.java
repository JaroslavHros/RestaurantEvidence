package cz.ekf.dao;


	
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import cz.ekf.bean.LogBean;
import cz.ekf.dbCon.DBcon;
	 

public class LogDao {
	Connection con = null;
	PreparedStatement pst = null;
public String authenticateUser(LogBean loginBean)
	{
	   
	    try
	    {
	    	 String userName = loginBean.getuName();
	 	    String password = loginBean.getuPass();
	 	
	 	    String userNameDB = "";
	 	    String passwordDB = "";
	 	    String roleDB = "";
	 	    String query = "select name,pass,role from user";
	 	     con = DBcon.createConnection();
	    	 pst = con.prepareStatement(query);
	        
	    	 ResultSet resultSet = pst.executeQuery();
	 
	        while(resultSet.next())
	        {
	            userNameDB = resultSet.getString("name");
	            passwordDB = resultSet.getString("pass");
	            roleDB = resultSet.getString("role");
	 
	            if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("admin"))
	            return "Admin_Role";
	            
	            else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB.equals("user"))
	            return "User_Role";
	        }
	    }
	    catch(SQLException e)
	    {
	        e.printStackTrace();
	    }
	    finally {
	    	try {
	    		System.out.println("Successfull closed connection"+ con);
				con.close();
				pst.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    	
	    
	    	
	    }
	    return "Chybné zadané meno nebo heslo";
	}
}

	

