package cz.ekf.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.ekf.dbCon.DBcon;

public class AddSomething extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddSomething() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hlaseni = request.getParameter("akce");
		response.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Connection con = null;
		PreparedStatement pst = null;
		if(hlaseni.equals("addPro")) {
			String idKat = request.getParameter("cat_id");
			 int idK = Integer.parseInt(idKat);
			String pName = request.getParameter("productName");
			   String pInfo = request.getParameter("productInfo");
			   String pPrice = request.getParameter("productPrice");
			   int price  = Integer.parseInt(pPrice);
			    String query = "insert into product(product_name , info , cena, category_id) values (?, ?, ?, ?)";
			   try {
				   con = DBcon.createConnection();
				 pst = con.prepareStatement(query);
				pst.setString(1, pName);
				pst.setString(2, pInfo);
				//pst.setString(3, pPrice);
				pst.setInt(3, price);
				pst.setInt(4, idK);
				int r = pst.executeUpdate();
				if(r==1) {
				String hlaska = "úspešene pridané do evidencie";
				request.setAttribute("hlaska", hlaska);
				System.out.println("Succesfull inserterd to DB");
				request.getRequestDispatcher("addProduct.jsp").forward(request, response);
				pst.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			}finally {
				try {
					con.close();
					pst.close();
					System.out.println("Successfully closed connection" + con);
				} catch (SQLException e) {
					e.printStackTrace();
					request.setAttribute("vynimka", e);
			    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				}
				
			}
			
		}else if (hlaseni.equals("addCat")) {
			   String catName = request.getParameter("categoryName");
			   String query = "insert into category(name) values (?)";
			   try {
				   con  = DBcon.createConnection();
					 pst = con.prepareStatement(query);
					pst.setString(1, catName);
					int r = pst.executeUpdate();
					if(r==1) {
						String hlaska = "úspešene pridané do evidencie";
						request.setAttribute("hlaska", hlaska);
						System.out.println("Succesfull inserterd to DB");
						request.getRequestDispatcher("categories.jsp").forward(request, response);
						pst.close();
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
						System.out.println("Successfully closed connection" + con);
						
					} catch (SQLException e) {
						e.printStackTrace();
						request.setAttribute("vynimka", e);
				    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
					}
			   
			   
			
		}
		
	}

}
}
