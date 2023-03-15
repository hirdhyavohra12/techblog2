
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background
            {
                clip-path: polygon(32% 0, 70% 0%, 100% 0, 100% 83%, 71% 100%, 21% 100%, 0 83%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
        <main class=" p-5  d-flex align-items-center bg-dark  banner-background">
            <div class="container">
                <div class="col-md-5 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center bg-secondary" >
                            <span class="fa fa-user-circle"></span>
                            <br>
                            Register Here
                        </div>

                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet">
                                <div class="form-group">
                                    <label for="user_name">Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>


                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender"> Male
                                    <input type="radio" id="gender" name="gender"> Female
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control"id="" cols="3" rows="5" placeholder="Enter something about yourself"></textarea>
                                </div>


                                <div class="form-group form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Terms and Condition</label>
                                </div>

                                <div class="container text-center" id="loader" style="display:none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-secondary">Submit</button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!--<script src="javaScript/myJS.js" type="text/javascript"></script>-->

    <!--this link is for CDN and is used for enhancing the javascript-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    }
    <script>
        $(document).ready(function () {
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);
                $("#loader").show();
                $("submit-btn").hide();

                $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR)
                    {
                        console.log(data);
                        $("#loader").hide();
                        $("submit-btn").show();
                        
//    ------------------------these lines are part of CDN for interactive java Script-------------------------------
                        if (data.trim() === 'done')
                        {
                            swal("Successfully inserted.... taking you to login page")
                                    .then((value) => {
                                        
                                    });
                        }
                        else
                        {
                            swal(data);
                        }
                        
                    },<!----------------------------------------------------------------------------------->
                    error: function (jqXHR, textStatus, errorThrown)
                    {
                        $("#loader").hide();
                        $("submit-btn").show();
                        swal("Something went wrong... try again");

                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</html>
