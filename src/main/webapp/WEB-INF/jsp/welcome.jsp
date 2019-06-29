<%@page import="com.team.project.utils.EncryptUtils"%>
<%-- 
    Document   : index
    Created on : 17-Jun-2019, 13:56:22
    Author     : Makis
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap 4 Website Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            .fakeimg {
                height: 350px;
                background: #aaa;
            }

            #prologos{
                background-image: url("artgallery.jpg"); /* The image used */
                background-color: #cccccc; /* Used if the image is unavailable */
                height: 355px; /* You must set a specified height */
                background-position: center; /* Center the image */
                background-repeat: no-repeat; /* Do not repeat the image */
                background-size: cover; /* Resize the background image to cover the entire container */
            }
            .keimeno{
                color: orange;
            }
            input[type=submit] {
                background-color: orange;
                border: none;
                color: white;
                padding: 4px 16px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
            }
            input[type=text],input[type=password] {
                background-color:#faf68a;
                border: none;
                color: black;
                padding: 4px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
            }
            li{
                padding-left: 20px;
                padding-right: 20px;
            }
        </style>
    </head>
    <body>       

        <!--        proto kouti pano me prologo kai backround photo-->
        <div class="jumbotron text-center" id="prologos" style="margin-bottom:0">
            <h1>A website dedicated to artists and art lovers.</h1>
            <h2 class="keimeno">Post in Calendart and exhibit your artwork.</h2> 
        </div>

        <!--        gia to logout ruthmiseis-->
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// htttp 1.1
            response.setHeader("Pragma", "no-cache"); // http 1/0
            response.setHeader("Expires", "0"); // proxies

            String username = (String) session.getAttribute("username");

            if (username == null) {%>

        <!--        to navbar an den einai logged in-->

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
                        <a class="nav-link" href="SignupController">Sign up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="forgotpassword">Forgot your password?</a>
                    </li>
                    <li class="nav-item">
                        <form  class="nav-item" action="LoginController" method="post">

                            <input type="text" name="username" placeholder="username">
                            <input type="password" name="password" placeholder="password">
                            <input type="submit" value="Sign in">
                            </li>    

                            </ul>
                            </div>  
                            </nav>

                            <!--            an ehei kanei login-->
                            <% } else {%>
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
                                        <li class="nav-item">
                                            <form class="nav-item" action="logout" method="post">            
                                                <input type="submit" value="logout">
                                                </li> 


                                                </ul>
                                                </div>  
                                                </nav>

                                                <% }%>

                                                <!-- latest posts-->
                                                <!-- start here-->
                                                <div class="container" style="margin-top:30px">
                                                    <div class="row">
                                                        <!--                                                        <div class="col-sm-4">
                                                                                                                    <h2>About Me</h2>
                                                                                                                    <h5>Photo of me:</h5>
                                                                                                                    <div class="fakeimg">Fake Image</div>
                                                                                                                    <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
                                                                                                                    <h3>Some Links</h3>
                                                                                                                    <p>Lorem ipsum dolor sit ame.</p>
                                                                                                                    <ul class="nav nav-pills flex-column">
                                                                                                                        <li class="nav-item">
                                                                                                                            <a class="nav-link active" href="#">Active</a>
                                                                                                                        </li>
                                                                                                                        <li class="nav-item">
                                                                                                                            <a class="nav-link" href="#">Link</a>
                                                                                                                        </li>
                                                                                                                        <li class="nav-item">
                                                                                                                            <a class="nav-link" href="#">Link</a>
                                                                                                                        </li>
                                                                                                                        <li class="nav-item">
                                                                                                                            <a class="nav-link disabled" href="#">Disabled</a>
                                                                                                                        </li>
                                                                                                                    </ul>
                                                                                                                    <hr class="d-sm-none">
                                                                                                                </div>-->


                                                        <div class="col-sm-8">
                                                            <c:forEach var = "l" items="${posts}">
                                                                <!--  theto tin id tou user pou einai sundedemenos-->
                                                                <%int iduser = (Integer) session.getAttribute("iduser");%>

                                                                <h2>${l.title}</h2>
                                                                <h5>post #${l.idpost}, ${l.date}, by ${l.iduser.username}</h5>
                                                                <div class="fakeimg">Fake Image</div>
                                                                <p>${l.description}</p>
                                                                <br>


                                                                <!-- an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->
                                                                <c:if test = "${l.iduser.iduser==iduser || iduser==1 || iduser==2}" >                            


                                                                    <a  href=" <c:url value="deletepost">
                                                                            <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                        </c:url>">Delete </a>

                                                                    <a  href="<c:url value="editpost">
                                                                            <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                        </c:url>">Edit </a>

                                                                </c:if>

                                                                <a  href="<c:url value="viewPost">
                                                                        <c:param name="idpost" value="${l.idpost}"/>
                                                                    </c:url>">View artwork</a>


                                                                <hr>

                                                            </c:forEach>
                                                        </div>

                                                        <!-- latest posts-->
                                                        <!-- end here-->

                                                        <div class="col-sm-8">

                                                            <c:forEach var = "artists" items="${artists}">
                                                                <tr>
                                                                <div class="row">
                                                                    <div class="col-md-5">
                                                                        <h3>${artists.firstName}</h3>
                                                                        <h3>${artists.lastName}</h3>
                                                                    </div>
                                                                    <div class="col-md-7">
                                                                        <a href="#">
                                                                            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-md-5">                            
                                                                        <p>${l.username}</p>
                                                                        <a class="btn btn-primary" href="#">View Artist</a>
                                                                    </div>
                                                                </div>

                                                                </tr>
                                                                <hr>

                                                            </c:forEach>


                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="jumbotron text-center" style="margin-bottom:0">
                                                    <ul class="pagination justify-content-center">
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="getLastPosts">1</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="2">2</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="3">3</a>
                                                        <li class="page-item">
                                                            <a class="page-link" href="4">4</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="5">5</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="6">6</a>
                                                        <li class="page-item">
                                                            <a class="page-link" href="7">7</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="8">8</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="9">9</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>

                                                </body>
                                                </html>
