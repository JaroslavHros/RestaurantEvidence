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

public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InfoServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = null;
		 PreparedStatement pst= null;
		 ResultSet rs = null;
		 PreparedStatement pst1= null;
		 ResultSet rs1 = null;
		 if (request.getParameter("akce").equals("stockInfo")) {
		try{
	    con = DBcon.createConnection();
		String pname = request.getParameter("name");
		String sql = "Select product_name, cena from product where product_name=?";
		String sqlC= "Select sum(quantity) as sucet from stock where p_name=?";
		pst1 = con.prepareStatement(sqlC);
        pst = con.prepareStatement(sql);
        pst.setString(1, pname);
        pst1.setString(1, pname);
        rs = pst.executeQuery();
        rs1 = pst1.executeQuery();
        if(rs.next() && rs1.next())  {
        String meno =	rs.getString(1);
        Integer cena = rs.getInt(2);
        Integer mnozstvo = rs1.getInt(1);
        Integer hodnota = cena * mnozstvo ;
        String pS= String.valueOf(cena);
        String mnozstvo1 = String.valueOf(mnozstvo);
        String hodnotaS = String.valueOf(hodnota);
        System.out.print(cena);
        System.out.print(pS);
        System.out.print(mnozstvo);
        request.setAttribute("hodnota", hodnotaS);
        request.setAttribute("mnozstvo", mnozstvo1);
        request.setAttribute("produkt", meno);
        request.setAttribute("cenaP", pS);
        request.getRequestDispatcher("info.jsp").forward(request, response);
        }
		}
		catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("vynimka", e);
	    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		}
		finally {
			try {
				con.close();
				pst.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			}
		}
		 }
        else if(request.getParameter("akce").equals("soldInfo")) {
        	try{
        	    con = DBcon.createConnection();
        		String pn = request.getParameter("name");
        		String sql1 = "Select product_name, cena from product where product_name=?";
        		String sqlC1= "Select sum(quantity) as sucet from sellproducts where p_name=?";
        		pst1 = con.prepareStatement(sqlC1);
                pst = con.prepareStatement(sql1);
                pst.setString(1, pn);
                pst1.setString(1, pn);
                rs = pst.executeQuery();
                rs1 = pst1.executeQuery();
                if(rs.next() && rs1.next())  {
                String meno =	rs.getString(1);
                Integer cena = rs.getInt(2);
                Integer mnozstvo = rs1.getInt(1);
                Integer hodnota = cena * mnozstvo ;
                String pS= String.valueOf(cena);
                String mnozstvo1 = String.valueOf(mnozstvo);
                String hodnotaS = String.valueOf(hodnota);
                System.out.print(cena);
                System.out.print(pS);
                System.out.print(mnozstvo);
                request.setAttribute("hodnota", hodnotaS);
                request.setAttribute("mnozstvo", mnozstvo1);
                request.setAttribute("produkt", meno);
                request.setAttribute("cenaP", pS);
                request.getRequestDispatcher("info.jsp").forward(request, response);
                }
		}
		catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("vynimka", e);
	    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
		}
		finally {
			try {
				con.close();
				pst.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			}
			
		}
		 }
		
	} 
		
		   
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
