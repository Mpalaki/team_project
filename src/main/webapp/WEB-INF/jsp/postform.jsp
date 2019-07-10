<%-- 
    Document   : postform
    Created on : 19-Jun-2019, 14:42:04
    Author     : Makis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="addpost.css">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="addpost.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet"> 
        <title>add post</title>
    </head>
    <body>
        <!--        proto kouti pano me prologo kai backround photo-->
        <div class="jumbotron text-center" id="prologos" style="margin-bottom:0">
            
        </div>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h5>Calendart  Gallery</h5></a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span></h5></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="aboutus">About us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="getLastPosts">Latest posts</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="viewArtists">Artists</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addpost">Post your artwork</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="redirectToProfile">My profile</a>
                        </li>
                        <li class="nav-item">
                            <img src="data:image/jpg;base64,${user.base64Avatar}" style="vertical-align: middle;
                                 width: 50px;
                                 height: 50px;
                                 border-radius: 50%;"/>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="redirectToProfile">${user.username}</a>
                        </li>
                    </ul>
                </div>  
        </nav>

        <div class="container"  style="width: 50%">
            <h2>Post your artwork</h2>
            <p>We are happy to host photos of your paintings and sculptures.</p>
            
        </div>
        <script>
            // Add the following code if you want the name of the file appear on select
            $(".custom-file-input").on("change", function () {
                var fileName = $(this).val().split("\\").pop();
                $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
            });
        </script>
    </body>
</html>
