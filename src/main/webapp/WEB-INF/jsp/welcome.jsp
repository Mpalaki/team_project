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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>


        <!--        proto kouti pano me prologo kai backround photo-->
        <div class="jumbotron text-center" id="prologos" style="margin-bottom:0">
            <!--            view port width-->
            <h1 id="message">A website dedicated to artists and art lovers<br>
                Post in Calendart and exhibit your artwork  </h1>
        </div>

        <!--        gia to logout ruthmiseis-->
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// htttp 1.1
            response.setHeader("Pragma", "no-cache"); // http 1/0
            response.setHeader("Expires", "0"); // proxies
            String username = (String) session.getAttribute("username");
            if (username == null) {%>

        <!--        to navbar an den einai logged in-->

        <div class="container">
            <nav id="navigation-bar" class="navbar navbar-expand-md bg-dark navbar-dark navbar-transparent fixed-top ">
                <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive; "><h2>Calendart Gallery</h2></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="home">Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="viewArtists">Our Artists</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="signup">Sign up</a>
                        </li>

                        <li id="navform" class="nav-item">
                            <form  class="nav-item" action="login" method="post">

                                <input type="text" name="username" placeholder="username" required>
                                <input type="password" name="password" placeholder="password" required>
                                <input type="submit" value="Sign in">
                            </form>
                        </li>    

                    </ul>
                </div>  
            </nav>

            <!--            an ehei kanei login-->
            <% } else {%>
            <nav id="navigation-bar" class="navbar navbar-expand-md bg-dark navbar-dark fixed-top ">
                <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h2>Calendart Gallery</h2></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav ">
                        <li class="nav-item">
                            <a class="nav-link" href="home">Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="viewArtists">Our Artists</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addpost">Post your artwork</a>
                        </li>

                        <li class="nav-item">
                            <a href="myProfile" style="
                               background-color: rgba(0,0,0,0);">
                                <img  src="${user.stringAvatar}" style="vertical-align: middle;
                                      width: 45px;
                                      height: 45px;
                                      border-radius: 50%;"/>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="myProfile">${user.username}</a>
                        </li>
                        <li class="nav-item">
                            <div class="search-container">
                                <form action="search">
                                    <input type="text" placeholder=" Search.." name="search" style="border-radius: 14px;background-color: aliceblue">
                                    <button type="submit" class="btn btn-info badge badge-light badge-pill" ><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                        </li>
                        <li><a class="donate" href="https://www.paypal.com/pools/c/8gMhCrFluG" style="background-color: rgba(0,0,0,0);"><i class='fas fa-piggy-bank' style='font-size:36px;color: #ff4861'></i></a></li>
                        <li class="nav-item">
                            <form class="nav-item" action="logout" method="post">            
                                <input type="submit" value="logout">
                            </form>
                        </li>                                                
                    </ul>
                </div>  
            </nav>
        </div>
        <% }%>
        <!-- Success Alerts -->
        <c:if test="${message=='email sent'}">
            <div class="alert alert-info alert-dismissible fade show">
                <strong>An email has been sent!</strong> Click the link in the email you received to activate your account.
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${message=='new pass sent'}">
            <div class="alert alert-info alert-dismissible fade show">
                <strong>An email has been sent!</strong> Click the link in the email you received to reset your password.
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${message=='active account'}">
            <div class="alert alert-success alert-dismissible fade show">
                <strong>Success!</strong> Your account is now active.
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${message=='pass changed'}">
            <div class="alert alert-success alert-dismissible fade show">
                <strong>Success!</strong> Your password has been changed. 
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${message=='activate account'}">
            <div class="alert alert-warning alert-dismissible fade show">
                <strong>Warning!</strong> Please activate your account by clicking the link in the email we sent you upon registration.
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${message=='incorrect password'}">
            <div class="alert alert-danger alert-dismissible fade show">
                <strong>Sorry!</strong> Invalid password.
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        </c:if>

        <!-- latest posts-->
        <!-- start here-->
        <c:if test="${!users.isEmpty()}">
            <c:forEach var = "u"  items="${users}">
                <img src="${u.stringAvatar}" style="vertical-align: middle;
                     width: 50px;
                     height: 50px;
                     border-radius: 50%;"/>
                <a  href="<c:url value="profile">
                        <c:param name="unartist" value="${u.username}"/>
                    </c:url>">${u.username}</a>
                <br>
            </c:forEach>
        </c:if>
        <c:if test="${!searchPosts.isEmpty()}">
            <c:forEach var = "searchPost"  items="${searchPosts}">
                <a  href="<c:url value="viewPost">
                        <c:param name="idpost" value="${searchPost.idpost}"/>
                    </c:url>">${searchPost.title}</a>, artis opus #${searchPost.idpost}, ${searchPost.description}
                <br>
            </c:forEach>
        </c:if>
        <c:if test="${searchPosts.isEmpty() && users.isEmpty()}">
            <h3>No results!</h3>
        </c:if>
        <c:if test="${postsPage.content!=null}">
            <div class="container" style="margin-top:10px">
                <h2>Latest posts</h2>
                <hr>

            </div>
        </c:if>
        <div class="container" style="margin-top:0px; ">
            <div class="row">

                <c:forEach var = "l"  items="${postsPage.content}">
                    <div class="col-sm-12" id="even">
                        <!--  theto tin id tou user pou einai sundedemenos-->
                        <%int role = (Integer) session.getAttribute("role");%>

                        <h2>${l.title}</h2>
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
                        <div class="fakeimg"><img src="${l.urlImage}" style="max-width: 60%; height: auto;"/></div>
                        <p>${l.description}</p>
                        <br>


                        <!-- an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->
                        <c:if test = "${l.iduser.iduser==iduser || role==1 }" >                            


                            <a  class="deletepost" href=" <c:url value="deletepost">
                                    <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                </c:url>"><i class="fa fa-trash" style="font-size:20px;color:red"></i> </a>|

                            <a  class="editpost" href="<c:url value="editpost">
                                    <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                </c:url>"><i class="fa fa-pencil" style="font-size:20px;color:orange"></i>  </a>|

                        </c:if>

                        <a  class="viewPost" href="<c:url value="viewPost">
                                <c:param name="idpost" value="${l.idpost}"/>
                            </c:url>"><i class="fa fa-eye" style="font-size:20px;color:blue"></i></a>


                        <hr>
                    </div>
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
            <!--            <c :if test="$ { postsPage.totalPages!=null}">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c :if>-->
            <c:if test="${postsPage.totalPages> 0}">
                <%--                                                            <div class="pagination">--%>
                <c:forEach var="pageNumber" items="${pageNumbers}">
                    <li class="page-item">
                        <a class="page-link" href="home?size=${postsPage.size}&page=${pageNumber}">${pageNumber}</a>
                    </li>
                </c:forEach>
                <%--                                                            </div>--%>
            </c:if>
            <!--            <c : if test="$ { postsPage.totalPages!=null}">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c : if>-->
        </ul>
        <!--                                                </div>-->
        <script>
            // When the user scrolls down 20px from the top of the document, show the button
            // scroll functions
            $(document).ready(function () {
                $("#navigation-bar").addClass("navbar-transparent");
            });
            var nav = document.getElementById("navigation-bar");
            window.onscroll = function () {
                scrollFunction();
            };
            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementById("myBtn").style.display = "block";
                    nav.classList.remove("navbar-transparent");
                    $("#navigation-bar ul li a").css({"color": "white"});
                } else {
                    document.getElementById("myBtn").style.display = "none";
                    nav.classList.add("navbar-transparent");
                    $("#navigation-bar ul li a").css({"color": "black"});
                }
            }
            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
            $(".editpost").attr('title', 'edit post');
            $(".deletepost").attr('title', 'delete post');
            $(".viewPost").attr('title', 'view post');
            $(".donate").attr('title', 'donate to Calendart');
        </script>
    </body>
</html>