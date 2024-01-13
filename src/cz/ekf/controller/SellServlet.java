package cz.ekf.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.ekf.dbCon.DBcon;


public class SellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SellServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pr= request.getParameter("pname");
	    String quan = request.getParameter("quan");
	    String dat = request.getParameter("today");
	    String usr = request.getParameter("hid");
	    Connection con = null;
	    PreparedStatement pst = null;
	    PreparedStatement pstP = null;
	    ResultSet rs = null;
	    
	    String query = "insert into sellproducts (p_name, quantity, DateOfSell , userName , product_id) values (?,?,?,?,?)";
	    String queryP = "Select product_id  from product where product_name= ?";
	      try {
	    	  con = DBcon.createConnection();
	    	  pst = con.prepareStatement(query);
	    	  pstP = con.prepareStatement(queryP);
	    	  pstP.setString(1, pr);
	    	  rs = pstP.executeQuery();
	    	  if(rs.next()) {
	    		  String name  = rs.getString(1);
	    		  pst.setString(5,name ); 
	    		  
	    	  }
	    	 
	    	  pst.setString(1, pr);
	    	  pst.setString(2, quan);
	    	  pst.setString(3,dat);
	    	  pst.setString(4, usr);
	    	  System.out.println(pr);
	    	  System.out.println(usr);
	    	  int i = pst.executeUpdate();
	    	  System.out.println(i + "Count of rows affected");
	    	    if(i==1) {
	    	    	String hlasenie = "Successfully added to evidence";
	    	    	request.setAttribute("hlasenie", hlasenie);
	    	    	request.getRequestDispatcher("SellProducts.jsp").forward(request, response);
	    	    }else if(i==0) {
	    	    	String hlasenie = "Something went wrong";
	    	    	request.setAttribute("hlasenie", hlasenie);
	    	    	request.getRequestDispatcher("SellProducts.jsp").forward(request, response);
	    	    	
	    	    }
	    	  
	    	  
	    	  
	      } 
	      catch(SQLException e) {
	    	  e.printStackTrace();
	    	  request.setAttribute("vynimka", e);
	    	  request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	      }finally {
	    	  try {
				con.close();
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			}
	    	  
	    	  
	    	  
	      }
	    
	}

}
