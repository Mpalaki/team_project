<%-- 
    Document   : postpage
    Created on : 21-Jun-2019, 23:34:08
    Author     : Makis
--%>


<%@page import="com.team.project.model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="welcome.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Index</title>

    </head>
    <body>
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
                    <%  String username = (String) session.getAttribute("username");
                        if (username != null) {%>
                    <li class="nav-item">
                        <a class="nav-link" href="addpost">Post your artwork</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="redirectToProfile">My profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="redirectToProfile">${user.username}</a>                                                    
                    </li>
                    <% } %>

                </ul>
            </div>  
        </nav>


        <div class="container">

            <div class="col-sm-8" id="even">
                <!--  theto tin id tou user pou einai sundedemenos-->
                <%int role = (Integer) session.getAttribute("role");%>

                <h2>${post.title}</h2>
                <h5>post #${post.idpost}, ${post.dispDate}, by 
                    <img src="data:image/jpg;base64,${post.iduser.base64Avatar}" style="vertical-align: middle;
                         width: 50px;
                         height: 50px;
                         border-radius: 50%;"/>
                    <a  href=" <c:url value="profile">
                            <c:param name="unartist" value="${post.iduser.username}"/>
                        </c:url>">${post.iduser.username}</a>
                    <!--                    vazo ena try catch gia na mporeso na emfaniso tin editdate an uparhei.trelo?-->
                    <% Post post = (Post) pageContext.findAttribute("post");
                        try {
                            String editdate = post.getDispeditDate();
                            if (editdate != null) {%><i>(edited: ${post.dispeditDate})</i><%}
                            } catch (NullPointerException e) {
                            } finally { %>
                </h5>
                <div class="fakeimg"><img src="data:image/jpg;base64,${post.base64Photo}" style="max-width: 100%; height: auto;"/></div>
                <p>${post.description}</p>

                <% if (username != null) {%>

                <div class="col-md-5">                            
                    <form action="insertcomment" method="post">
                        <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                        <textarea rows = "2" cols = "50" name = "description">
            Enter your comment
                        </textarea></br>  

                        <input type="submit"></br>

                        </div>
                        <%}%>
                        </div>

                        <hr>



                        <table>


                            <c:forEach var = "comments" items="${comments}">

                                <div class="media border p-3">
                                    <div class="media-body">
                                        <h5>${comments.iduser.username}<small><i> posted on ${comments.date}</i></small></h5>
                                        <p>${comments.keimeno}</p>

                                    </div>
                                </div>

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
                        </ul> <%}%>

                        <!-- /.container -->
                        </body>
                        </html>
