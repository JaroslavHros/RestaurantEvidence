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

import cz.ekf.dao.SendEmail;
import cz.ekf.dbCon.DBcon;

/**
 * Servlet implementation class RezervaceServlet
 */
public class RezervaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RezervaceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null ;
		int rs;
		PreparedStatement pst = null;
        String to = request.getParameter("to");
        String fname = request.getParameter("Fname");
        String lname = request.getParameter("Lname");
        String phone = request.getParameter("phone");
        String Aname = fname.concat(lname);
        String subject = "Objednávka";
        String message =  request.getParameter("message");
        String user = "mail";
        String pass = "psswd";
        con = DBcon.createConnection();
        String query = "insert into rezervace (Jmeno, Email, Mobil) values (?,?,?)";
        
		try {
			pst = con.prepareStatement(query);
			 pst.setString(1, Aname);
			 pst.setString(2, to);
			 pst.setString(3, phone);
			  rs = pst.executeUpdate();
			  if(rs> 0) {
				   System.out.print(Aname);
				  SendEmail.send(to,subject, message, user, pass);
			        request.setAttribute("hlaska", "Email odoslaný");
			        request.getRequestDispatcher("rezervace.jsp").forward(request, response);
			  }
			  
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("vynimka", e);
	    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		}
		finally {
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
