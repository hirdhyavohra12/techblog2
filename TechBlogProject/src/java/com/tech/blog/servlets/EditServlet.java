
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;


public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //Fetch all the data from the Edit servlet
            
            
            String email=request.getParameter("user_email");
            String name=request.getParameter("user_name");
            String password=request.getParameter("user_password");
            String about=request.getParameter("user_About");
            
            
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("current_user");
            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            
            
            UserDao userDao=new UserDao(ConnectionHelper.getConnection());
            boolean ans=userDao.UpdateUser(user);
            
            if(ans)
            {
                out.println("changed");
            }
            else
            {
                out.println("not changed");
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
