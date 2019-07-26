<%-- 
    Document   : postpage
    Created on : 21-Jun-2019, 23:34:08
    Author     : Makis
--%>


<%@page import="com.team.project.model.User"%>
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
        <link rel="stylesheet" href="resources/css/welcome.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Index</title>

    </head>
    <body>
        <% User user = (User) session.getAttribute("user"); %>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h5>Calendart  Gallery</h5></a>
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
                        <img src="${user.stringAvatar}" style="vertical-align: middle;
                             width: 50px;
                             height: 50px;
                             border-radius: 50%;"/>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="myProfile">${user.username}</a>                                                    
                    </li>
                    <% } %>

                </ul>
            </div>  
        </nav>


        <div class="container" style="margin-top: 5px;">

            <div class="col-sm-8" id="even">
                <!--  theto tin id tou user pou einai sundedemenos-->
                <%int role = (Integer) session.getAttribute("role");%>

                <h2>${post.title}</h2>
                <h5>artis opus #${post.idpost}, ${post.dispDate}, by 
                    <img src="${post.iduser.stringAvatar}" style="vertical-align: middle;
                         width: 50px;
                         height: 50px;
                         border-radius: 50%;"/>
                    <a  href=" <c:url value="profile">
                            <c:param name="unartist" value="${post.iduser.username}"/>
                        </c:url>">${post.iduser.username}</a>
                    <!-- vazo ena try catch gia na mporeso na emfaniso tin editdate an uparhei-->
                    <% Post post = (Post) pageContext.findAttribute("post");
                        try {
                            String editdate = post.getDispeditDate();
                            if (editdate != null) {%><i>(edited: ${post.dispeditDate})</i><%}
                            } catch (NullPointerException e) {
                            } finally { %>
                </h5>
                <div class="fakeimg"><img src="${post.urlImage}" style="max-width: 100%; height: auto;"/></div>
                <p>${post.description}</p><hr>
                <span id="likes"><i class="fa fa-thumbs-o-up" style="font-size:36px"></i>${likes}<div id="likers" style="display: none; background-color: grey;
                                                                                                      width: 110px;
                                                                                                      height: 110px;
                                                                                                      overflow: auto ">
                        <c:forEach var = "l" items="${likers}">
                            ${l.username}<br>
                        </c:forEach>
                    </div></span><br>

            </div> 

            <% if (username != null) {%>

            <c:if test="${!likers.contains(user)}">               
                <form action="like" method="post">
                    <div class="form-group" >
                        <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                    </div>
                    <button type="submit" class="btn btn-success badge badge-light badge-pill"><i style="font-size:24px" class="fa">&#xf087;</i>Like!</button></br>
                </c:if>
                <c:if test="${likers.contains(user)}">               
                    <form action="unlike" method="post">
                        <div class="form-group" >
                            <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                        </div>
                        <button type="submit" class="btn btn-danger badge badge-light badge-pill"><i style="font-size:24px" class="fa">&#xf165;</i>Unlike!</button></br>
                    </c:if>
                    <div class="col-md-5">                            
                        <form action="insertcomment" method="post">

                            <div class="form-group" >
                                <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                                <img src="${user.stringAvatar}" style="vertical-align: middle;
                                     width: 50px;
                                     height: 50px;
                                     border-radius: 50%;"/>
                                <textarea rows = "3" cols = "30" class="custom-file-textarea badge badge-light" style="border-radius: 8px; "  name = "description">Add a public comment</textarea></br>  

                            </div>                     
                            <button type="submit" class="btn btn-warning badge badge-light badge-pill">add</button></br>

                    </div>
                    <%}%>
                    ${post.commentsNo} Comments 

                    <hr>
                    <table>
                        <c:forEach var = "comments" items="${comments}">
                            <div class="col-md-8" style="background-color: aliceblue ;border-radius: 4px; padding: 2px;">
                                <div class="media-body">
                                    <h5><img src="${comments.iduser.stringAvatar}" style="vertical-align: middle;
                                             width: 40px;
                                             height: 40px;
                                             border-radius: 50%;"/>
                                        <a  href=" <c:url value="profile">
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

                    <script>
                        $("#likes").mouseover(function () {
                            $("#likers").show();
                        });
                        $("#likes").mouseout(function () {
                            $("#likers").hide();
                        });
                    </script>

                    </body>
                    </html>
