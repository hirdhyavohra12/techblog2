
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entites.Post;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@MultipartConfig
public class AddPostServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
          
            int cid=Integer.parseInt(request.getParameter("cid"));
            String pTitle=request.getParameter("pTitle");
           String pContent=request.getParameter("pContent");
           String pCode=request.getParameter("pCode");
//          out.println("your content is "+pContent);
//           getting  current user
            HttpSession h=request.getSession();
            User u=(User)h.getAttribute("current_user");
            
            Post p=new Post(pTitle,pContent,pCode,cid,u.getId());
            PostDao pd=new PostDao(ConnectionHelper.getConnection());
            if(pd.savePost(p))
            {
                out.println("done");
            }
            else
            {
                out.println("error occured");
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
