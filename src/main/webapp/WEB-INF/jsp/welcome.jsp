
<%-- 
    Document   : index
    Created on : 17-Jun-2019, 13:56:22
    Author     : Makis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OpusArtis</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                background-color:  #85C1E9 ;
            }
            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #322;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                color: pink;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover {
                background-color: #111;
            }
        </style>
    </head>
    <body>
        <!--        an den ehei kanei login: -->
        <% String username = request.getParameter("username");
            if (username == null) {%>

        <ul>
            <li><a class="active" href="#home">Home</a></li>
            <li><a href="SignupController">Sign up</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="viewArtists">Artists</a></li>
        </ul>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <h3>Sign In</h3>
                        <div class="d-flex justify-content-end social_icon">
                            <span><i class="fab fa-facebook-square"></i></span>
                            <span><i class="fab fa-google-plus-square"></i></span>
                            <span><i class="fab fa-twitter-square"></i></span>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="LoginController" method="post">
                            <div class="input-group form-group ">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control " name="username" placeholder="username">
                            </div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" name="password" placeholder="password">
                            </div>
                            <div class="row align-items-center remember">
                                <input type="checkbox">Remember Me
                            </div>
                            <div class="form-group">
                                <button type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</button>
                                <!--                <input type="submit" value="login"></div>-->
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Don't have an account?<a href="#">Sign Up</a>
                        </div>
                        <div class="d-flex justify-content-center">
                            <a href="#">Forgot your password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        <!--            an ehei kanei login-->
        <% } else { %>

        <!-- Menu -->
        <ul>
            <li><a class="active" href="home">Home</a></li>
            <li><a href="SignupController">Sign up</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="viewArtists">Artists</a></li>
            <li><a href="addpost">post your art</a></li>
            <li><a href="getLastPosts">last posts</a></li>
            <li><a href="redirectToProfile">my profile</a></li>
            </br>

        </ul>
        <h1>welcome ${user.username}</h1></br>
        <% }%>

        <div class="container">

            <!-- Page Heading -->
            <h1 class="my-4">OpusArtis.gr
                <small>post your art</small>
            </h1>

            <!-- posts -->
            <table>

                <c:forEach var = "l" items="${posts}">
                    <tr>
                    <div class="row">
                        <div class="col-md-5">
                            <h3>${l.idpost}</h3>
                            <h3>${l.title}</h3>
                        </div>
                        <div class="col-md-7">
                            <a href="#">
                                <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
                            </a>
                        </div>
                        <div class="col-md-5">                            
                            <p>${l.description}</p>

                            <a class="btn btn-primary" href="<c:url value="viewPost">
                                   <c:param name="idpost" value="${l.idpost}"/>
                               </c:url>">View Project</a>
                        </div>
                    </div>

                    </tr>
                    <hr>

                </c:forEach>
            </table>
            <table>

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
            </table>

            <hr>

            <!-- Pagination -->
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>

        </div>
        <!-- /.container -->
    </body>
</html>
