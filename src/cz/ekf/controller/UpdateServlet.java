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


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hlaseni = request.getParameter("akce");
		response.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Connection con =null ;
		
		if(hlaseni.equals("updateStock")) {
		
		String id = request.getParameter("id");
		 String name = request.getParameter("p_name");
		 String q = request.getParameter("quantity");
		 String d = request.getParameter("date");
		 int qInt = Integer.parseInt(q);
		 String query = "Update stock set p_name=?,quantity=?,date=? where id="+id;
		 try {
			 con= DBcon.createConnection();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setInt(2, qInt);
			pst.setString(3 , d);
			int i = pst.executeUpdate();
			if(i > 0)
			{
				String hlasenie = "Uspešne upravené";
				request.setAttribute("hlasenie", hlasenie);
	            request.getRequestDispatcher("stockStatus.jsp").forward(request, response);			
            }
		} catch (SQLException e) {
			request.setAttribute("vynimka", e);
	    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
			
			e.printStackTrace();
		}
		 finally {
				try {
					con.close();
				} catch (SQLException e) {
					request.setAttribute("vynimka", e);
			    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
					e.printStackTrace();
				}
			}
		}else if(hlaseni.equals("updatePro")) {
			String idProd = request.getParameter("id");
			String name = request.getParameter("p_name");
			 String info = request.getParameter("info");
			 String p = request.getParameter("price");
			  String cat = request.getParameter("cat_id");
			 String query = "Update product set product_name=?,info=?,cena=?,category_id=? where product_id="+idProd;
			 try {
				int catInt = Integer.parseInt(cat);
			    int pInt = Integer.parseInt(p);
			    con= DBcon.createConnection();
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, name);
				pst.setString(2 , info);
				pst.setInt(3, pInt);
				pst.setInt(4, catInt);
				int i = pst.executeUpdate();
				if(i > 0)
				{
				String hlasenie = "Uspešne upravené";
				request.setAttribute("hlasenie", hlasenie);
	            request.getRequestDispatcher("allProducts.jsp").forward(request, response);		
	            }
			} catch (SQLException e) {
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				
				e.printStackTrace();
			} catch(NumberFormatException e) {
				System.out.println("Chyba pri parsovani !");
				System.out.println(cat);
				System.out.println(p);
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				e.printStackTrace();
				
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					request.setAttribute("vynimka", e);
			    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
					e.printStackTrace();
				}
			}
			
			
			
		}
		else if(hlaseni.equals("updateCat")) {
			String idCat= request.getParameter("id");
			String name = request.getParameter("c_name");
			 String query = "Update category set name=? where category_id="+idCat;
			 try {
				
			    con= DBcon.createConnection();
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, name);
				int i = pst.executeUpdate();
				if(i > 0)
				{
				String hlasenie = "Uspešne upravené";
				request.setAttribute("hlasenie", hlasenie);
	            request.getRequestDispatcher("allCategories.jsp").forward(request, response);		
	            }
			} catch (SQLException e) {
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				
				e.printStackTrace();
			} catch(NumberFormatException e) {
				System.out.println("Chyba pri parsovani !");
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				e.printStackTrace();
				
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					request.setAttribute("vynimka", e);
			    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
					e.printStackTrace();
				}
			}
			
		}
		else if(hlaseni.equals("updateSold")) {
			String idPred = request.getParameter("id");
			String name = request.getParameter("p_name");
			 String quantity = request.getParameter("quantity");
			 String date = request.getParameter("date");
			 String query = "Update sellproducts set p_name=?,quantity=?,DateOfSell=? where id="+idPred;
			 try {
			    con= DBcon.createConnection();
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, name);
				pst.setString(2 , quantity);
				pst.setString(3, date);
				int i = pst.executeUpdate();
				if(i > 0)
				{
				String hlasenie = "Uspešne upravené";
				request.setAttribute("hlasenie", hlasenie);
	            request.getRequestDispatcher("soldP.jsp").forward(request, response);		
	            }
			} catch (SQLException e) {
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				
				e.printStackTrace();
			} catch(NumberFormatException e) {
				System.out.println("Chyba pri parsovani !");
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				e.printStackTrace();
				
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					request.setAttribute("vynimka", e);
			    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
					e.printStackTrace();
				}
			}
			
			
			
		}
		else if(hlaseni.equals("updateRez")) {
			String idRez = request.getParameter("id");
			String name = request.getParameter("Jmeno");
			 String mail = request.getParameter("Mail");
			 String pho = request.getParameter("Tel");
			 String query = "Update rezervace set Jmeno=?,Email=?,Mobil=? where id_rezervace="+idRez;
			 try {
			    con= DBcon.createConnection();
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, name);
				pst.setString(2 , mail);
				pst.setString(3, pho);
				int i = pst.executeUpdate();
				if(i > 0)
				{
				String hlasenie = "Uspešne upravené";
				request.setAttribute("hlasenie", hlasenie);
	            request.getRequestDispatcher("VsechnyRezervace.jsp").forward(request, response);		
	            }
			} catch (SQLException e) {
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				
				e.printStackTrace();
			} catch(NumberFormatException e) {
				System.out.println("Chyba pri parsovani !");
				request.setAttribute("vynimka", e);
		    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
				e.printStackTrace();
				
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					request.setAttribute("vynimka", e);
			    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
					e.printStackTrace();
				}
			}
			
			
			
		}
	}
}
	
