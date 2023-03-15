
<!--cliff path is used for wave design of the container-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Navbar.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--link for CSS bootstrap-->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <!--<link href="css/style.css" rel="stylesheet" type="text/css"/>-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background
            {
                clip-path: polygon(30% 0%, 70% 0%, 100% 1%, 100% 94%, 67% 84%, 31% 95%, 0 81%, 0 0);
            }
        </style>
    </head>
    <body>

        <div class="container-fluid p-0 m-0 banner-background"> <!--This does not leave space on the side bars-->

            <div class="jumbotron  bg-dark text-white">             <!-- This makes a card type structure -->
                <div class="container">         <!-- This makes a normal container -->

                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <p>Welcome to the world of Technology. Explore more ideas with TechBlog</p>
                    <p>A programming language is a system of notation for writing computer programs.Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.
                    </p>
                    <btn class="btn btn-outline-light"><span class="fa fa-external-link "></span>
                        Start! Its free</btn>
                    <a href="login_page.jsp"class="btn btn-outline-light"><span class="fa fa-user-plus"></span>Login</a>
                </div>
            </div>
        </div>


        <!--Code for Cards--> 
        <div class="container">
            <div class="row">
                <div class="col-md-4">    <!-- col-md-4 means it it needs 4 grids out of 12 grids and offset-md-4 means leave first 4 grids and then tske next 4 grids -->
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary bg-dark ">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary bg-dark ">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary bg-dark ">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary bg-dark ">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary bg-dark ">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary bg-dark ">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Link for JAVA SCRIPT-->

        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--<script src="javaScript/myJS.js" type="text/javascript"></script>-->


    </body>
</html>
