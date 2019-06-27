
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
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// htttp 1.1
            response.setHeader("Pragma", "no-cache"); // http 1/0
            response.setHeader("Expires", "0"); // proxies

            String username = (String) session.getAttribute("username");

            if (username == null) {%>

        <ul>

            <li><form action="LoginController" method="post">
                    <input type="text" name="username" placeholder="username">
                    <input type="password" name="password" placeholder="password">
                    <input type="submit" value="login"></li>
                    <li><a class="active" href="#home">Home</a></li>
                    <li><a href="SignupController">Sign up</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="viewArtists">Artists</a></li>
                </form></li>

        </ul>

        <!--            an ehei kanei login-->
        <% } else { %>

        <!-- Menu -->
        <ul>
            <li><a class="active" href="home">Home</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="viewArtists">Artists</a></li>
            <li><a href="addpost">post your art</a></li>
            <li><a href="getLastPosts">last posts</a></li>
            <li><a href="redirectToProfile">my profile</a></li>
            <li><form action="logout" method="post">            
                    <input type="submit" value="logout"></li>
                    </br>

                    </ul>
                    <h1> ${user.username}</h1></br>
                    <% }%><div class="container">
                        <!-- Page Heading -->
                        <h1 class="my-4">Calendart</br>
                            <small>last posts</small>
                        </h1>
                        <!-- posts -->
                        <table>
                            <c:forEach var = "l" items="${posts}">
                                <!--                                theto tin id tou user pou einai sundedemenos-->
                                <%int iduser = (Integer) session.getAttribute("iduser");%>
                                <tr>
                                <div class="row">
                                    <div class="col-md-5">
                                        post no: ${l.idpost},
                                        by ${l.iduser.username}</br>
                                        ${l.title},
                                        ${photos}
                                        <!--                                  an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->
                                        <c:if test = "${l.iduser.iduser==iduser || iduser==1 || iduser==2}" >                            
                                            <!--                                            <form action="deletepost" method="post">  
                                                                                            
                                                                                            <input type="submit" value="delete post">
                                                                                            <form action="editpost" method="post">            
                                                                                                <input type="submit" value="edit post">-->

                                            <a class="btn btn-primary" href=" <c:url value="deletepost">
                                                   <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                               </c:url>">delete post</a>

                                            <a class="btn btn-primary" href="<c:url value="editpost">
                                                   <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                               </c:url>">edit post</a>

                                        </c:if>

                                        <td>
                                            <img src="data:image/jpg;base64,${photos}" alt="No image">
                                        </td>
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
                    <!-- /.container -->
                    </body>
                    </html>
