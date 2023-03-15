
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entites.Message;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;


public class login_servlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           
           UserDao userd=new UserDao(ConnectionHelper.getConnection());
           User u=userd.getUserByEmailAndPassword(email, password);
           
           if(u==null)
           {
               //no user found error
               
               //if user not found this line will print the error on that page itself
               // alert danger is the class of bootstrap
              Message msg=new Message("Invalid details!! Try with another mail","error","alert-danger");
              HttpSession s=request.getSession();
              s.setAttribute("msg", msg);
              response.sendRedirect("login_page.jsp");
           }
           else
           {
//               Store user in the session as long as the user is logged in or the browser is opened
               
               HttpSession s=request.getSession();
               s.setAttribute("current_user", u);
               response.sendRedirect("profile.jsp");
               
           }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
