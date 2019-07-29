<%-- 
    Document   : artists
    Created on : 21-Jun-2019, 23:32:29
    Author     : Makis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--                <link rel="stylesheet" href="profile.css">-->
        <link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="jquery-3.2.1.js"></script>
        <title>artists</title>
        <style>
            body{
                background-image:  linear-gradient(rgba(255,255,255,0.65), rgba(255,255,255,0.65)), url("resources/css/images/japan-galleries_blum-and-poe_1100x733.jpg"); /* The image used */
                background-color: #cccccc; /* Used if the image is unavailable */
                /* Full height */
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body >
        <!--        gia to logout ruthmiseis-->
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// htttp 1.1
            response.setHeader("Pragma", "no-cache"); // http 1/0
            response.setHeader("Expires", "0"); // proxies
            String username = (String) session.getAttribute("username");
            if (username == null) {%>

        <!--        to navbar an den einai logged in-->

        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h3>Calendart Gallery</h3></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup">Sign up</a>
                    </li>
<!--                    <li class="nav-item">
                        <form  class="nav-item" action="login" method="post">

                            <input type="text" name="username" placeholder="username" required>
                            <input type="password" name="password" placeholder="password" required>
                            <input type="submit" value="Sign in">
                            </li>    -->

                            </ul>
                            </div>  
                            </nav>

                            <!--            an ehei kanei login-->
                            <% } else {%>


                            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                                <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h3>Calendart Gallery</h3></a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                                    <ul class="navbar-nav">
                                        <li class="nav-item">
                                            <a class="nav-link" href="home">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="addpost">Post your artwork</a>
                                        </li>

                                        <!--                                        <li class="nav-item">
                                                                                    <form class="nav-item" action="logout" method="post">            
                                                                                        <input type="submit" value="logout">
                                                                                        </li> -->
                                    </ul>
                                </div>  

                            </nav>

                            <!-- Success Alerts -->
                            <c:if test="${success=='pm sent'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Your message has been sent successfully.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>
                            <c:if test="${success=='removal'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Your message has been deleted successfully.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>
                            <c:if test="${success=='fr sent'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Your friend request has been sent successfully.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>
                            <c:if test="${success=='fr deleted'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Friend has been removed.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>

                            <% }%>

                            <!-- Page Content -->
                            <div class="container">
                                <div class="row">
                                    <!-- Team Member 1 -->
                                    <c:forEach var = "artists" items="${artists}">                                        
                                        <div class="col-xl-3 col-md-6 mb-4" style="margin-top: 3px;">
                                            <div class="card border-0 shadow">
                                                <img src="${artists.stringAvatar}" style="
                                                     height: 200px; /* You must set a specified height */
                                                     width: auto;
/*                                                     width: auto;*/
                                                     background-position: center; /* Center the image */
                                                     background-repeat: no-repeat; /* Do not repeat the image */
                                                     background-size: cover;
                                                     "class="card-img-top" alt="...">
                                                <div class="card-body text-center" style="">
                                                    <h5 class="card-title mb-0"><a  href=" <c:url value="profile">  
                                                                                        <c:param name="unartist" value="${artists.username}"/>
                                                                                    </c:url>">${artists.username}</a></h5>
                                                    <span class="badge badge-warning" style="margin-bottom: 20px"><i class="fa fa-photo"></i> ${artists.postsNo} posts</span>
                                                    <hr>
                                                    <c:if test="${artists.email!=null and (artists.email!='')}">                                                        
                                                        ${artists.email}<hr>
                                                    </c:if>                                                        
                                                    <c:if test="${artists.twitter!=null and (artists.twitter!='')}">
                                                        <a class="btn btn-primary btn-twitter btn-sm" href="${artists.twitter}">
                                                            <i class="fa fa-twitter"></i>
                                                        </a>
                                                    </c:if>                                                        
                                                    <c:if test="${artists.facebook!=null and (artists.facebook!='')}">
                                                        <a class="btn btn-info btn-sm" rel="publisher"
                                                           href="${artists.facebook}">
                                                            <i class="fa fa-facebook"></i>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${artists.instagram!=null and (artists.instagram!='')}">
                                                        <a class="btn btn-primary btn-sm" rel="publisher" href="${artists.instagram}">
                                                            <i class="fa fa-instagram"></i>
                                                        </a>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div> 


                                    </c:forEach>

                                </div>
                                <!-- /.row -->

                            </div>
                            <!-- /.container -->
                            </body>
                            </html>
