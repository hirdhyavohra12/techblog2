

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
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
        <div class="container text-center">
            <img src="images/exception.jpg" style="padding-top: 20px;" class="img-fluid">
            <h3>Sorry!! Something went wrong</h3>
            <%= exception %>
            <a href="index.jsp" class="btn bg-secondary btn-lg text-white ">Home</a>
        </div>
    </body>
</html>
