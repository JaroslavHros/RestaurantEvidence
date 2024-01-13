package cz.ekf.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cz.ekf.bean.LogBean;
import cz.ekf.dao.LogDao;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
	    String password = request.getParameter("password");	 
	    LogBean loginBean = new LogBean();	 
	    loginBean.setuName(userName);
	    loginBean.setuPass(password);
	 
	    LogDao logDao = new LogDao();
	 
	    try
	    {
	        String userValidate = logDao.authenticateUser(loginBean);
	 
	        if(userValidate.equals("Admin_Role"))
	        {
	            System.out.println("Admin's Home");
	 
	            HttpSession session = request.getSession(); 
	            synchronized (session) {
					
			
	            session.setMaxInactiveInterval(10*60);

	            session.setAttribute("Admin", userName); 
	            request.setAttribute("userName", userName);
	 
	            request.getRequestDispatcher("admin.jsp").forward(request, response);
	        	}
	        }
	    
	        else if(userValidate.equals("User_Role"))
	        {
	            System.out.println("User's Home");
	 
	            HttpSession session = request.getSession();
	            synchronized (session) {
					
				
	            session.setMaxInactiveInterval(10*60);
	            session.setAttribute("User", userName);
	            request.setAttribute("userName", userName);
	 
	            request.getRequestDispatcher("user.jsp").forward(request, response);
	            }
	        }
	        else
	        {
	            System.out.println("Error message = "+userValidate);
	            request.setAttribute("errMessage", userValidate);
	 
	            request.getRequestDispatcher("prihlaseni.jsp").forward(request, response);
	        }
	    }
	    catch (IOException e)
	    {
	    	e.printStackTrace();
			request.setAttribute("vynimka", e);
	    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	    }
	    catch (Exception e)
	    {
	    	e.printStackTrace();
			request.setAttribute("vynimka", e);
	    	request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	    }
	}

}
