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
        <title>Calendart</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/welcome.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>       
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>




        <!--        gia to logout ruthmiseis-->
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// htttp 1.1
            response.setHeader("Pragma", "no-cache"); // http 1/0
            response.setHeader("Expires", "0"); // proxies

            String username = (String) session.getAttribute("username");

            if (username == null) {%>

        <!--        to navbar an den einai logged in-->

        <nav class="navbar navbar-expand-sm fixed-top       k">
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
                    <li class="nav-item">
                        <a class="nav-link" href="signup">Sign up</a>
                    </li>

                    <li class="nav-item">
                        <form  class="nav-item" action="login" method="post">

                            <input type="text" name="username" placeholder="username" required>
                            <input type="password" name="password" placeholder="password" required>
                            <input type="submit" value="Sign in">
                    </li>

                            </ul>
                            </div>
                            </nav>  <!--        proto kouti pano me prologo kai backround photo-->
        <div class="jumbotron text-center" id="prologos" style="margin-bottom:0">
            <!--            view port width-->
            <h1 id="message">A website dedicated to artists and art lovers<br>
                Post in Calendart and exhibit your artwork  </h1>
        </div>

                            <!--            an ehei kanei login-->
                            <% } else {%>
<%--                                                                    bg-dark navbar-dark--%>
                            <nav class="navbar navbar-expand-sm nav-fill w-100 fixed-top">
                                <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive; "><h5>Calendart  Gallery</h5></a>

                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                    <span class="navbar-toggler-icon"></span></a>
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
                                                <img src="${user.stringAvatar}" style="vertical-align: middle;
                                                     width: 50px;
                                                     height: 50px;
                                                     border-radius: 50%;"/>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="myProfile">${user.username}</a>
                                            </li>
                                            <li class="nav-item">
                                                <form class="nav-item" action="logout" method="post">            
                                                    <input type="submit" value="logout">
                                            </li>


                                                    </ul>
                                                    </div>  
                            </nav>
        <!--        proto kouti pano me prologo kai backround photo-->
        <div class="jumbotron text-center" id="prologos" style="margin-bottom:0">
            <!--            view port width-->
            <h1 id="message">A website dedicated to artists and art lovers<br>
                Post in Calendart and exhibit your artwork  </h1>
        </div>

                                                    <% }%>

                                                    <!-- latest posts-->
                                                    <!-- start here-->
                                                    <div class="container" style="margin-top:10px">
                                                        <h2>Latest posts</h2></br>
                                                        <hr>

                                                    </div>
        
                                                    <div class="container" style="margin-top:0px">
                                                        <div class="row">

                                                            <c:forEach var = "l"  items="${postsPage.content}">
                                                                <div class="col-md-4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         col-lg-8 text">
                                                                    <img class="img-responsive" src="${l.urlImage}" alt="Pineapple">
                                                                    <div class="middle">
                                                                        <div class="text">${l.title}</div>
                                                                        <div class="text">
                                                                            <!--  theto tin id tou user pou einai sundedemenos-->
                                                                            <%int role = (Integer) session.getAttribute("role");%>

                                                                                <h5>artis opus #${l.idpost}, ${l.dispDate}, by

                                                                                <!--                                                                    avatar - should not be null-->
                                                                                <img src="${l.iduser.stringAvatar}" style="vertical-align: middle;
                                                                             width: 50px;
                                                                             height: 50px;
                                                                             border-radius: 50%;"/>
                                                                                <a  href=" <c:url value="profile">
                                                                                <c:param name="unartist" value="${l.iduser.username}"/>
                                                                                                                                                                                                                                                                                                                </c:url>">${l.iduser.username}</a>
                                                                                                                                                                                                                                                                                                                </h5>
                                                                                                                                                                                                                                    <%--                                                                            <div class="fakeimg"><img src="${l.urlImage}" /></div>--%>
                                                                                                                                                                                                                                                                                                                <p>${l.description}</p>
                                                                                                                                                                                                                                                                                                                <br>


                                                                                                                                                                                                                                                                                                                <!-- an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->
                                                                                                                                                                                                                                                                                                                <c:if test = "${l.iduser.iduser==iduser || role==1 }" >


                                                                                <a  href=" <c:url value="deletepost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                            </c:url>">Delete </a>|

                                                                                <a  href="<c:url value="editpost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                            </c:url>">Edit  </a>|

                                                                            </c:if>

                                                                            <a  href="<c:url value="viewPost">
                                                                            <c:param name="idpost" value="${l.idpost}"/>
                                                                        </c:url>">View artwork</a>


                                                                            <hr>
                                                                        </div>
                                                                    </div>
                                                                </div>
<%--                                                                <div class="col-sm-8" id="even">--%>
<%--                                                                    <!--  theto tin id tou user pou einai sundedemenos-->--%>
<%--                                                                    <%int role = (Integer) session.getAttribute("role");%>--%>

<%--                                                                    <h2>${l.title}</h2>--%>
<%--                                                                    <h5>artis opus #${l.idpost}, ${l.dispDate}, by --%>

<%--                                                                        <!--                                                                    avatar - should not be null-->--%>
<%--                                                                        <img src="${l.iduser.stringAvatar}" style="vertical-align: middle;--%>
<%--                                                                             width: 50px;--%>
<%--                                                                             height: 50px;--%>
<%--                                                                             border-radius: 50%;"/>--%>
<%--                                                                        <a  href=" <c:url value="profile">--%>
<%--                                                                                <c:param name="unartist" value="${l.iduser.username}"/>--%>
<%--                                                                            </c:url>">${l.iduser.username}</a>--%>
<%--                                                                    </h5>--%>
<%--                                                                    <div class="fakeimg"><img src="${l.urlImage}" style="max-width: 80%; height: auto;"/></div>--%>
<%--                                                                    <p>${l.description}</p>--%>
<%--                                                                    <br>--%>


<%--                                                                    <!-- an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->--%>
<%--                                                                    <c:if test = "${l.iduser.iduser==iduser || role==1 }" >                            --%>


<%--                                                                        <a  href=" <c:url value="deletepost">--%>
<%--                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>--%>
<%--                                                                            </c:url>">Delete </a>|--%>

<%--                                                                        <a  href="<c:url value="editpost">--%>
<%--                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>--%>
<%--                                                                            </c:url>">Edit  </a>|--%>

<%--                                                                    </c:if>--%>

<%--                                                                    <a  href="<c:url value="viewPost">--%>
<%--                                                                            <c:param name="idpost" value="${l.idpost}"/>--%>
<%--                                                                        </c:url>">View artwork</a>--%>


<%--                                                                    <hr>--%>
<%--                                                                </div>--%>
                                                            </c:forEach>


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

                                                                                <img class="img-fluid rounded mb-3 mb-md-0" src="${artists.stringAvatar}" alt="">
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
        <!--                                                <div class="jumbotron text-center" style="margin-bottom:0">-->
                                                    <ul class="pagination justify-content-center" style="margin-top: 5px">
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                        </li>
                                                        <c:if test="${postsPage.totalPages> 0}">
                                                            <%--                                                            <div class="pagination">--%>
                                                            <c:forEach var="pageNumber" items="${pageNumbers}">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="home?size=${postsPage.size}&page=${pageNumber}">${pageNumber}</a>
                                                                </li>
                                                            </c:forEach>
                                                            <%--                                                            </div>--%>
                                                        </c:if>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <!--                                                </div>-->
                                                    <script>
                                                        // When the user scrolls down 20px from the top of the document, show the button
                                                        window.onscroll = function () {
                                                            scrollFunction()
                                                        };
                                                        $(window).on("scroll", function() {
                                                            if($(window).scrollTop()) {
                                                                $('nav').addClass('bg-dark navbar-dark');
                                                                $('ul li a').css({
                                                                    'color': '#F8A500',
                                                                    // 'text-shadow' : '2px 2px 4px #F8A500'
                                                                });
                                                            }else {
                                                                $('nav').removeClass('bg-dark navbar-dark');
                                                                $('ul li a').css({
                                                                    'color': '#343A40',
                                                                    // 'text-shadow': ''
                                                                });

                                                            }
                                                        })
                                                        function scrollFunction() {
                                                            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {

                                                                document.getElementById("myBtn").style.display = "block";
                                                            } else {
                                                                $('nav').addClass('transparent');
                                                                document.getElementById("myBtn").style.display = "none";
                                                            }
                                                        }

                                                        // When the user clicks on the button, scroll to the top of the document
                                                        function topFunction() {
                                                            document.body.scrollTop = 0;
                                                            document.documentElement.scrollTop = 0;
                                                        }


                                                    </script>
                                                    </body>
                                                    </html>
