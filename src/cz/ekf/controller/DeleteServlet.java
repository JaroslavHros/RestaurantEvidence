package cz.ekf.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.ekf.dbCon.DBcon;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Connection con =null;
	req.setCharacterEncoding("UTF-8");
	if(req.getParameter("akce").equals("productDelete")) {
		try {
		String id=	req.getParameter("id");
		con = DBcon.createConnection();
			if(con!= null) {
		String query = "delete from product where product_id= ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, id);
		int  i =  pst.executeUpdate();
		     if (i!= 0) {
		    	    System.out.print(i);
		              resp.sendRedirect("allProducts.jsp");
		    	 
		     }
		
			}
	} catch (SQLException e) {
		req.setAttribute("vynimka", e);
    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
		e.printStackTrace();
	}finally {
		try {
			con.close();
		} catch (SQLException e) {
			req.setAttribute("vynimka", e);
	    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
			
			e.printStackTrace();
		}
	
	}
	}	
	else if(req.getParameter("akce").equals("stockDelete")) {
	try {
	String id=	req.getParameter("id");
		con = DBcon.createConnection();
			if(con!= null) {
		String query = "delete from stock where id= ?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, id);
		int  i =  pst.executeUpdate();
		     if (i!= 0) {
		    	    System.out.print(i);
		              resp.sendRedirect("stockStatus.jsp");
		    	 
		     }
		
			}
	} catch (SQLException e) {
		req.setAttribute("vynimka", e);
    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
		
		e.printStackTrace();
	}finally {
		try {
			con.close();
		} catch (SQLException e) {
			req.setAttribute("vynimka", e);
	    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
			
			e.printStackTrace();
		}
	
	}

	
}else if(req.getParameter("akce").equals("categoryDelete")) {
	try {
		String id=	req.getParameter("id");
			con = DBcon.createConnection();
				if(con!= null) {
			String query = "delete from category where category_id= ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, id);
			int  i =  pst.executeUpdate();
			     if (i!= 0) {
			    	    System.out.print(i);
			              resp.sendRedirect("allCategories.jsp");
			    	 
			     }
			
				}
		} catch (SQLException e) {
			e.printStackTrace();
			req.setAttribute("vynimka", e);
	    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
				req.setAttribute("vynimka", e);
		    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
			}
		
		}
	
	
}
else if(req.getParameter("akce").equals("soldDelete")) {
	try {
		String id=	req.getParameter("id");
			con = DBcon.createConnection();
				if(con!= null) {
			String query = "delete from sellproducts where id= ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, id);
			int  i =  pst.executeUpdate();
			     if (i!= 0) {
			    	    System.out.print(i);
			    	    String hlasenie = "Úspešne vymazané";
			    	    req.setAttribute("hlaska", hlasenie);
			    	     req.getRequestDispatcher("soldP.jsp").forward(req, resp);
			             
			    	 
			     }
			
				}
		} catch (SQLException e) {
			req.setAttribute("vynimka", e);
	    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
			
			e.printStackTrace();
		}finally {
			try {
				con.close();
			
			} catch (SQLException e) {
				req.setAttribute("vynimka", e);
		    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
				
				e.printStackTrace();
			}
		
		}
	
	
}
else if(req.getParameter("akce").equals("rezervaceDelete")) {
	try {
		String id=	req.getParameter("id");
			con = DBcon.createConnection();
				if(con!= null) {
			String query = "delete from rezervace where id_rezervace= ?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, id);
			int  i =  pst.executeUpdate();
			     if (i!= 0) {
			    	    System.out.print(i);
			    	    String hlasenie = "Úspešne vymazané";
			    	    req.setAttribute("hlaska", hlasenie);
			    	     req.getRequestDispatcher("VsechnyRezervace.jsp").forward(req, resp);
			             
			    	 
			     }
			
				}
		} catch (SQLException e) {
			req.setAttribute("vynimka", e);
	    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
			
			e.printStackTrace();
		}finally {
			try {
				con.close();
			
			} catch (SQLException e) {
				req.setAttribute("vynimka", e);
		    	req.getRequestDispatcher("errorPage.jsp").forward(req, resp);
				
				e.printStackTrace();
			}
		
		}
	
	
}
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doGet(request, response);

}
}