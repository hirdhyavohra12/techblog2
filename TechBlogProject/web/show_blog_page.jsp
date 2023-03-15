<%@page import="com.tech.blog.entites.User" %>
<%@page import="com.tech.blog.entites.Post" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.entites.Category" %>
<%@page import="com.tech.blog.helper.ConnectionHelper" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<%
     
     
//     this will be open in any time until we will be log out or the chorme is closed
           User user=(User)session.getAttribute("current_user");
           if(user==null)
           {
           response.sendRedirect("login_page.jsp");
           }
            
            
%>

<%

int postid=Integer.parseInt(request.getParameter("pid"));
PostDao pd2=new PostDao(ConnectionHelper.getConnection());
Post p=pd2.getPostByPid(postid);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%></title>
        <style>
            body{
                background: url(images/background2.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
            .post-title{
                font-weight: 200;
                font-size: 30px;
            }
            
            .post-content{
                font-weight: 200;
                font-size: 25px;
            }
            
            .post-user-info{
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        
        <!--start of navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Welcome to TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-briefcase" style="padding: 2px ;margin:2px">Home </span><span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o">
                                Categories</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Languages</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">

                        <a class="nav-link" href="#"> <span class="fa fa-address-book-o"></span>Contact</a>
                    </li>
                    <li class="nav-item">

                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk"></span>Do Post</a>
                    </li>


                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal"> <span class="fa fa-user-circle"></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-street-view"></span>Sign out</a>
                    </li>
                </ul>

            </div>
        </nav>

        <!--end of navbar-->

        
        
        <!--Main Content of the card-->
        
        <div class="container">
            
            <div class="row my-4">
                
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header bg-dark" style="color:white">
                            <h4 class="post-title"><%=p.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <img class="card-img-top my-2" src="images/tech.jpg">
                            
                            <div class="row my-2">
                                <div class="col-md-8">
                                    <%UserDao u=new UserDao(ConnectionHelper.getConnection());%>
                                    <p class="post-user-info"><a href="#!"><%=u.getUserbyUserid(p.getUserId()).getName()%></a> has posted</p>
                                    
                                </div>
                                
                                <div class="col-md-4">
                                    
                                </div>
                            </div>
                            <p class="post-content"><%=p.getpContent()%></p>
                            <br>
                            <br>
                            <div class="post-code">
                                 <pre><%=p.getpCode()%></pre>

                            </div>
                          </div>
                        
                        <div class="card-footer bg-dark">
                            
                            
                            <%
                            LikeDao ld=new LikeDao(ConnectionHelper.getConnection());
                            
                            %>
                            <a href="#!" onclick="doLikeit(<%= p.getPid()%>,<%=user.getId()%>)" class="btn btn-small btn-secondary"><i class="fa fa-thumbs-o-up"></i><span class="like_counter"><%= ld.countLikesOnPost(p.getPid())%></span></a>
                
                <a href="#!" class="btn btn-small btn-secondary"><i class="fa fa-commenting-o"></i><span>5</span></a>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        
        
        
        
        
        
        
        
        
        
        <!--Main content of the card end-->
        
        
        
        
        
        
        
        
        <!--start of modal-->


        <!--modal opens dialog box with given target and the data-toggle-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-secondary text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/dimg.jpg" class="img-fluid" style="border-radius:50% ; height:100px; width: 100px">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--//details of the user-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">About</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div><!-- comment -->




                            <div id="profile-edit" style="display:none">
                                <h2>Please edit Carefully</h2>
                                <form action="EditServlet">
                                    <table class="table">
                                        <tr>
                                            <td>ID:</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email: </td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name: </td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password: </td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>About: </td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_About"><%= user.getAbout() %>
                                                </textarea>
                                            </td>

                                        </tr>

                                    </table>


                                    <div class="container">
                                        <button type="submit" class="btn btn-secondary">Submit</button>
                                    </div>
                                </form>
                            </div>



                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-btn" type="button" class="btn text-white bg-secondary">Edit</button>
                    </div>
                </div>
            </div>
        </div>





        <!--end of modal-->



        <!--Add POST MODEL-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>--- Select Category ---</option>
                                    <%
                                        PostDao p2=new PostDao(ConnectionHelper.getConnection());
                                        ArrayList<Category> l=p2.getCategory();
                                        for(Category c:l)
                                        {
                                    %>
                                    <option value="<%= c.getCid() %>"> <%= c.getName()%></option>
                                    <%
                                        }
                                    %>

                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title " class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height:150px" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height:150px" placeholder="Enter your code (if any)"></textarea>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-secondary">Post</button>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <!--End POST MODEL-->


        <!--start of JS-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--<script src="javaScript/myJS.js" type="text/javascript"></script>-->

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-btn').click(function () {

                    if (editStatus == false)
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else
                    {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }

                });
            });
        </script>


        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //Code executed when the form is submited....

                    event.preventDefault();
                    console.log("1 eventt");
                    let form = new FormData(this);
                    console.log("2nd event");

                    //now requesting to server

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "Saved Successfully", "success");
                            } else
                            {
                                swal("Error!!!", "Something went wrong", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            swal("Error!!!", "Something went wrong", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>


        <!--Load posts from LOAD_POSTS using ajax-->
        <script>
            
            function getPost(cid,temp)
            {
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass("active bg-dark");
                 $.ajax({
                    url:"load_posts.jsp",
                    data:{catID:cid},
                success : function(data,textstatus,jqXHR)
                {
                    console.log(data);
                    $("#loader").hide();
                    $("#post-container").show();
                    $("#post-container").html(data);
                    $(temp).addClass("active bg-dark");
                }
                })
            }
            $(document).ready(function(e){
                let allPostRef=$(".c-link")[0];
               getPost(0,allPostRef);
            });
        </script>
        
        <script>
            function doLikeit(pid,uid){
                console.log(pid+" "+uid);
                const d={
                    uid:uid,
                    pid:pid,
                    operation:'like'
                }
                $.ajax({
                    url:"likeservlet",
                    data:d,
                    success : function(data,textstatus,jqXHR){
                        console.log(data);
                        if(data.trim()=='true'){
                            let c=$(".like_counter").html();
                            c++;
                            $('.like_counter').html(c);
                        }
                    }
                })
            }
            
            $(document).ready(function(e){
                doLikeit();
            })
        </script>
    </body> 
</html>
