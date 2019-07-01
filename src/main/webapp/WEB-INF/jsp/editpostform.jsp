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
        <title>edit post</title>
    </head>
    <body>
        <div class="jumbotron text-center" id="prologos" style="margin-bottom:0">
            <h1>A website dedicated to artists and art lovers.</h1>
            <h2 class="keimeno">Post in Calendart and exhibit your artwork.</h2> 
        </div>

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="home"><h5>Calendart Gallery</h5></a>
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
                        <a class="nav-link" href="redirectToProfile">${user.username}</a>                                                    
                    </li>

                </ul>
            </div>  
        </nav>

                    <div class="container" style="width: 50%">
            </br><p>Edit your post.</p>
            <form action="updatepost" enctype="multipart/form-data"  class="was-validated" method="post">
                <div class="form-group">
                    <!--                    <label for="uname">Username:</label>-->
                    <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                    <input type=hidden id="date" name="date" value="${post.date}">
                    <input type="text" class="form-control" id="uname" placeholder="${post.title}" name="title" required>
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <textarea rows = "6" cols = "50" name = "description">${post.description}</textarea></br>
                </div>
                <div class="form-group">
                    <input class="form-control-file" type="file" name="photo1" required> 
                    <div class="valid-feedback">Valid.</div>
                    <div class="invalid-feedback">Upload an image to continue.</div>
                    </label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <!--        <form  class="formapost" action="insertpost" enctype="multipart/form-data" method="post">
                    <input type="text" name="title" placeholder="insert post title"></br>
                    <textarea rows = "10" cols = "50" name = "description">
                    Enter your description
                    </textarea></br>  
                    <input type="file" name="photo1">
        
                    <input type="submit">  -->
    </body>
</html>
