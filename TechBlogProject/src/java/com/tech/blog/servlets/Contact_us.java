
package com.tech.blog.servlets;


import com.tech.blog.dao.Contact2;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entites.Message;
import com.tech.blog.entites.User;
import com.tech.blog.helper.ConnectionHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;


public class Contact_us extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Contact_us</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession s=request.getSession();
            String name=request.getParameter("contact_name");
            String email=request.getParameter("contact_email");
            String query=request.getParameter("contact_query");
            
            String check=request.getParameter("checkBox");
            if(check==null){
                out.println("<h1>please check the box </h1>");
                Message m=new Message("Click the box ","error","alert-danger");
            s.setAttribute("msg", m);
            response.sendRedirect("Categories.jsp");
                
            }
            else{
                 Contact2 c=new Contact2(ConnectionHelper.getConnection());
                boolean b=c.saveContact(name, email, query);
                if(b){
                    
                    Message m=new Message("inserted successfully","success","alert-success");
            s.setAttribute("msg", m);
            response.sendRedirect("Categories.jsp");
                }
                else{
                     
                }
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
