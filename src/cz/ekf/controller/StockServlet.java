package cz.ekf.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.ekf.dbCon.DBcon;

/**
 * Servlet implementation class StockServlet
 */
public class StockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
		String pName = request.getParameter("productname");
		   String pQuantity = request.getParameter("quantity");
		   int qua = Integer.parseInt(pQuantity);
		   String d = request.getParameter("datum");
		
		 /* System.out.println(d);
		   
		   java.util.Date date;
			date = new SimpleDateFormat("yyyy-MM-dd").parse(d);
			
			 System.out.println(date);

				java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		*/
		
		    String query = "insert into stock(p_name , date , quantity) values (?, ?, ?)";
		    con = DBcon.createConnection();
		    pst = con.prepareStatement(query);
			pst.setString(1, pName);
			//pst.setDate(2, sqlDate);
			pst.setString(2,d);
			pst.setInt(3, qua);
		    int r = pst.executeUpdate();
		    
		if(r==1) {
			pst.close();
			System.out.println("Succesfully inserterd to DB");
			request.setAttribute("hlaska", "Succesfully inserterd to DB");
			request.getRequestDispatcher("onStock.jsp").forward(request,response);
			
		}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("vynimka", e);
	    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			
		}finally {
			System.out.print("Succesfully closed connection " + con );
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
