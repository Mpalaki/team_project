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

                        <div class="form-group">
                            <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                            <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                            <textarea rows = "2" cols = "50" class="custom-file-textarea"  name = "description">Enter your comment</textarea></br>  

                        </div>                     
                        <input type="submit"></br>

                        </div>
                        <%}%>
                        </div>
                        <hr>
                        <table>
                            <c:forEach var = "comments" items="${comments}">
                                <div class="media border p-3" style="background-color: #e0f9f9">
                                    <div class="media-body">
                                        <h5><a  href=" <c:url value="profile">
                                                    <c:param name="unartist" value="${comments.iduser.username}"/>
                                                </c:url>">${comments.iduser.username}</a>
                                            <small><i> commented on ${comments.dispDate}</i></small></h5>
                                        <p>${comments.keimeno}</p>
                                    </div>
                                </div>
                                <hr>
                            </c:forEach>
                        </table>
                        <%}%>

                        </body>
                        </html>
