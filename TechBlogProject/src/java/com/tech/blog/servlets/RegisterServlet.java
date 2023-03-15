
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;


@MultipartConfig   
//this @ is used to accept all kind of data sent to the database
public class RegisterServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            String check=request.getParameter("check");
            if(check==null)
            {
                out.println("box not checked");
            }
            else
            {
                String name=request.getParameter("user_name");
                String email=request.getParameter("user_email");
                String password=request.getParameter("user_password");
                String gender=request.getParameter("gender");
                String about=request.getParameter("about");
                
                User u=new User(name,email,password,gender,about);
                
                UserDao dao=new UserDao(ConnectionHelper.getConnection());
                if(dao.SaveUser(u))
                {
                    out.println("inserted succesfully");
                }
                else
                {
                    out.println("error occured");
                }
                
                
            }
            
          
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
