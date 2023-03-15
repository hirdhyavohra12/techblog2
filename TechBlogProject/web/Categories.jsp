<%@page import="com.tech.blog.entites.User" %>
<%@page import="com.tech.blog.entites.Message" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.entites.Category" %>
<%@page import="com.tech.blog.helper.ConnectionHelper" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     
     
//     this will be open in any time until we will be log out or the chorme is closed
           User user=(User)session.getAttribute("current_user");
           if(user==null)
           {
           response.sendRedirect("login_page.jsp");
            }
            
            
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <main class="d-flex align-items-center bg-dark" >
            <div class="container">
                <div class="row mt-4 mb-4">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <p>Contact US</p>
                            </div>

                            <div class="card-body">
                                <form action="Contact_us" method="post">
                                    <div class="form-group">
                                        <label for="contact_name">Enter your name</label>
                                        <input name="contact_name" type="text" class="form-control" id="contact_name" aria-describedby="emailHelp" placeholder="Enter your name">
                                                                            </div>
                                    <div class="form-group">
                                        <label for="contact_email">Enter your email</label>
                                        <input name="contact_email" type="email" class="form-control" id="contact_email" aria-describedby="emailHelp" >
                                                                            </div>
                                    <div class="form-group">
                                        <label for="contact_query">Enter your query</label>
                                        <input name="contact_query" type="text" class="form-control" id="contact_query" placeholder="Enter here">
                                    </div>
                                    <div class="form-check">
                                        <input name="checkBox" type="checkbox" class="form-check-input" id="contact_check">
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary bg-dark mb-4">Submit</button>
                                     <%
                            
                            Message m=(Message)session.getAttribute("msg");
                            if(m!=null)
                            {
                              
                            %>
                            <div class="alert <%= m.getCSSClass()%>" role="alert">
                                <%= m.getContent() %>
                            </div>
                            
                            <%
                                session.removeAttribute("msg");
                                } 
                            %>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </body>
</html>
