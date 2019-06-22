
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
        <title>Index</title>
        <style>
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
        <ul>
            <li><a class="active" href="#home">Home</a></li>
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

        <div class="container">

            <!-- Page Heading -->
            <h1 class="my-4">Page Heading
                <small>Secondary Text</small>
            </h1>
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
                            <a class="btn btn-primary" href="viewPost">View Project</a>
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

            <!-- Project One -->
            <!--            <div class="row">
                            <div class="col-md-7">
                                <a href="#">
                                    <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
                                </a>
                            </div>
                            <div class="col-md-5">
                                <h3>Project One</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                                <a class="btn btn-primary" href="#">View Project</a>
                            </div>
                        </div>
                         /.row 
            
                        <hr>
            
                         Project Two 
                        <div class="row">
                            <div class="col-md-7">
                                <a href="#">
                                    <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
                                </a>
                            </div>
                            <div class="col-md-5">
                                <h3>Project Two</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, odit velit cumque vero doloremque repellendus distinctio maiores rem expedita a nam vitae modi quidem similique ducimus! Velit, esse totam tempore.</p>
                                <a class="btn btn-primary" href="#">View Project</a>
                            </div>
                        </div>
                         /.row 
            
                        <hr>
            
                         Project Three 
                        <div class="row">
                            <div class="col-md-7">
                                <a href="#">
                                    <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
                                </a>
                            </div>
                            <div class="col-md-5">
                                <h3>Project Three</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, temporibus, dolores, at, praesentium ut unde repudiandae voluptatum sit ab debitis suscipit fugiat natus velit excepturi amet commodi deleniti alias possimus!</p>
                                <a class="btn btn-primary" href="#">View Project</a>
                            </div>
                        </div>
                         /.row 
            
                        <hr>
            
                         Project Four 
                        <div class="row">
            
                            <div class="col-md-7">
                                <a href="#">
                                    <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
                                </a>
                            </div>
                            <div class="col-md-5">
                                <h3>Project Four</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, quidem, consectetur, officia rem officiis illum aliquam perspiciatis aspernatur quod modi hic nemo qui soluta aut eius fugit quam in suscipit?</p>
                                <a class="btn btn-primary" href="#">View Project</a>
                            </div>
                        </div>-->
            <!-- /.row -->

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
