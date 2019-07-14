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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="welcome.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Oswald&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet"> 

    </head>
    <body>       
        <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>


<%--        <!--        proto kouti pano me prologo kai backround photo-->--%>
<%--        <div class="jumbotron text-center" id="prologos" style="margin-bottom:0">--%>
<%--            <!--            view port width-->--%>
<%--            <h1 id="message">A website dedicated to artists and art lovers<br>--%>
<%--                Post in Calendart and exhibit your artwork  </h1>--%>
<%--        </div>--%>

        <!--        gia to logout ruthmiseis-->
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// htttp 1.1
            response.setHeader("Pragma", "no-cache"); // http 1/0
            response.setHeader("Expires", "0"); // proxies

            String username = (String) session.getAttribute("username");

            if (username == null) {%>

        <!--        to navbar an den einai logged in-->

<%--        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">--%>
<%--            <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h5>Calendart  Gallery</h5></a>--%>
<%--            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">--%>
<%--                <span class="navbar-toggler-icon"></span>--%>
<%--            </button>--%>
<%--            <div class="collapse navbar-collapse" id="collapsibleNavbar">--%>
<%--                <ul class="navbar-nav">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="home">Home</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="aboutus">About us</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="getLastPosts">Latest posts</a>--%>
<%--                    </li>--%>

<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="viewArtists">Artists</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="SignupController">Sign up</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="forgotpassword">Forgot your password?</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <form  class="nav-item" action="LoginController" method="post">--%>

<%--                            <input type="text" name="username" placeholder="username" required>--%>
<%--                            <input type="password" name="password" placeholder="password" required>--%>
<%--                            <input type="submit" value="Sign in">--%>
<%--                            </li>    --%>

<%--                            </ul>--%>
<%--                            </div>  --%>
<%--                            </nav>--%>

<%--        -----------------------------------------------------------------------------------------------------------------------------%>
        <div class="wrapper">
            <header>
                <nav>
                    <div class="menu-icon">
                        <i class="fa fa-bars fa-2x"></i>
                    </div>
                    <div class="logo">
                        <a class="navbar-brand" id="calendart" href="home"><h5>Calendart
                            <span style="color:red">G</span><span style="color:orange">a</span><span style="color:yellow">l</span><span style="color:green">l</span><span style="color:lightblue">e</span><span style="color:blue">r</span><span style="color:purple">y</span></h5></a>
                    </div>
                    <div class="menu">
<%--                        <ul>--%>
<%--                            <li><a href="#">Home</a></li>--%>
<%--                            <li><a href="#">About</a></li>--%>
<%--                            <li><a href="#">Blog</a></li>--%>
<%--                            <li><a href="#">Contact</a></li>--%>
<%--                            <li><a href="#">Contact</a></li>--%>
<%--                            <li><a href="#">Contact</a></li>--%>
                            <ul>
                                <li >
                                    <a  href="home">Home</a>
                                </li>
                                <li >
                                    <a  href="aboutus">About us</a>
                                </li>
                                <li >
                                    <a  href="getLastPosts">Latest posts</a>
                                </li>

                                <li >
                                    <a  href="viewArtists">Artists</a>
                                </li>
<%--                                <li >--%>
<%--                                    <a  href="SignupController">Sign up</a>--%>
<%--                                </li>--%>
<%--                                <li >--%>
<%--                                    <a  href="forgotpassword">Forgot your password?</a>--%>
<%--                                </li>--%>
                                <li >
<%--                                    <input type="submit"  role="button" data-toggle="modal" data-target="login-modal" value="Sign in">--%>
                                    <p class="text-center"><a href="#" class="btn btn-primary btn-md" role="button" data-toggle="modal" data-target="#login-modal">Sign in</a></p>
<%--                                    <form   action="LoginController" method="post">--%>

<%--                                        <input type="text" name="username" placeholder="username" required>--%>
<%--                                        <input type="password" name="password" placeholder="password" required>--%>
<%--                                        <input type="submit" value="Sign in">--%>
<%--                                    </form>--%>

                                </li>
                            <%--                            <li class="nav-item">&ndash;%&gt;--%>
                                <%--                        <form  class="nav-item" action="LoginController" method="post">--%>

                                <%--                            <input type="text" name="username" placeholder="username" required>--%>
                                <%--                            <input type="password" name="password" placeholder="password" required>--%>
                                <%--                            <input type="submit" value="Sign in">--%>
                                <%--                            </li>    --%>
<%--                        </ul>--%>
                    </div>
                </nav>
            </header>

        </div>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <h1 class="text-center">Modal Login with jQuery Effects</h1>--%>
<%--                <p class="text-center"><a href="#" class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#login-modal">Open Login Modal</a></p>--%>
<%--            </div>--%>
<%--        </div>--%>
        <!-- END # BOOTSNIP INFO -->

        <!-- BEGIN # MODAL LOGIN -->
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <img class="img-circle" id="img_logo" src="http://bootsnipp.com/img/logo.jpg">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </button>
                    </div>

                    <!-- Begin # DIV Form -->
                    <div id="div-forms">

                        <!-- Begin # Login Form -->
                        <form action="LoginController" method="post" id="login-form">
                            <div class="modal-body">
                                <div id="div-login-msg">
                                    <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                    <span id="text-login-msg">Type your username and password.</span>
                                </div>


                                    <input type="text" name="username" placeholder="username" required>
                                    <input type="password" name="password" placeholder="password" required>
<%--                                <input id="login_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>--%>
<%--                                <input id="login_password" class="form-control" type="password" placeholder="Password" required>--%>
<%--                                <div class="checkbox">--%>
<%--                                    <label>--%>
<%--                                        <input type="checkbox"> Remember me--%>
<%--                                    </label>--%>
<%--                                </div>--%>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" value="Sign in">

                            <%--                                <div>--%>
<%--                                    <button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>--%>
<%--                                </div>--%>
                                <div>
                                    <button id="login_lost_btn" type="button" class="btn btn-link">Lost Password?</button>
                                    <button id="login_register_btn" type="button" class="btn btn-link">Register</button>
                                </div>
                            </div>
                        </form>
                        <!-- End # Login Form -->

                        <!-- Begin | Lost Password Form -->
                        <form id="lost-form" style="display:none;">
                            <div class="modal-body">
                                <div id="div-lost-msg">
                                    <div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right"></div>
                                    <span id="text-lost-msg">Type your e-mail.</span>
                                </div>
                                <input id="lost_email" class="form-control" type="text" placeholder="E-Mail (type ERROR for error effect)" required>
                            </div>
                            <div class="modal-footer">
                                <div>
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">Send</button>
                                </div>
                                <div>
                                    <button id="lost_login_btn" type="button" class="btn btn-link">Log In</button>
                                    <button id="lost_register_btn" type="button" class="btn btn-link">Register</button>
                                </div>
                            </div>
                        </form>
                        <!-- End | Lost Password Form -->

                        <!-- Begin | Register Form -->
                        <form  id="register-form" style="display:none;" action="RegisterController" enctype="multipart/form-data" method="post">
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                </div>
                                <input name="firstName" class="form-control" placeholder="First name" type="text">
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                </div>
                                <input name="lastName" class="form-control" placeholder="Last name" type="text">
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                </div>
                                <input name="username" class="form-control" placeholder="Username" type="text" required>
                            </div>
                            <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                </div>
                                <input name="emailAddress" class="form-control" placeholder="Email address" type="email">
                            </div>
                            <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                                </div>

                                <input name="telephone" class="form-control" placeholder="Phone number" type="text">
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
                                </div>
                                <select class="form-control">
                                    <option selected=""> Select job type</option>
                                    <option>Designer</option>
                                    <option>Manager</option>
                                    <option>Accaunting</option>
                                </select>
                            </div> <!-- form-group end.// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                </div>
                                <input name="password" class="form-control" placeholder="Create password" type="password">
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                </div>
                                <input name="wordpass" class="form-control" placeholder="Repeat password" type="password">
                            </div> <!-- form-group// -->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fas fa-file-image"></i> </span>
                                </div>
                                <input name="photo" class="form-control" placeholder="Repeat password" type="file">
                            </div> <!-- form-group// -->
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
                            </div> <!-- form-group// -->
                            <p class="text-center">Have an account? <a href="">Log In</a>
                            </p>
                            <div>
                                                                    <button id="register_login_btn" type="button" class="btn btn-link">Log In</button>
                                                                    <button id="register_lost_btn" type="button" class="btn btn-link">Lost Password?</button>
                                                                </div>
                        </form>


<%--                        <form id="register-form" style="display:none;">--%>
<%--                            <div class="modal-body">--%>
<%--                                <div id="div-register-msg">--%>
<%--                                    <div id="icon-register-msg" class="glyphicon glyphicon-chevron-right"></div>--%>
<%--                                    <span id="text-register-msg">Register an account.</span>--%>
<%--                                </div>--%>
<%--                                <input id="register_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>--%>
<%--                                <input id="register_email" class="form-control" type="text" placeholder="E-Mail" required>--%>
<%--                                <input id="register_password" class="form-control" type="password" placeholder="Password" required>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <div>--%>
<%--                                    <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <button id="register_login_btn" type="button" class="btn btn-link">Log In</button>--%>
<%--                                    <button id="register_lost_btn" type="button" class="btn btn-link">Lost Password?</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </form>--%>
                        <!-- End | Register Form -->

                    </div>
                    <!-- End # DIV Form -->

                </div>
            </div>
        </div>
        <!-- END # MODAL LOGIN -->

        <!--            an ehei kanei login-->
                            <% } else {%>
        <header>
            <nav>
                <div class="menu-icon">
                    <i class="fa fa-bars fa-2x"></i>
                </div>
                <div class="logo">
                    <div class="logo">
                        <a class="navbar-brand" id="calendart" href="home"><h5>Calendart
                            <span style="color:red">G</span><span style="color:orange">a</span><span style="color:yellow">l</span><span style="color:green">l</span><span style="color:lightblue">e</span><span style="color:blue">r</span><span style="color:purple">y</span></h5></a>
                    </div>
                </div>
                <div class="menu">
                    <ul>
<%--                        <li><a href="#">Home</a></li>--%>
<%--                        <li><a href="#">About</a></li>--%>
<%--                        <li><a href="#">Blog</a></li>--%>
<%--                        <li><a href="#">Contact</a></li>--%>
<%--                        <li><a href="#">Contact</a></li>--%>
<%--                        <li><a href="#">Contact</a></li>--%>

                        <li >
                            <a  href="home">Home</a>
                        </li>
                        <li >
                            <a  href="aboutus">About us</a>
                        </li>
                        <li >
                            <a  href="getLastPosts">Latest posts</a>
                        </li>

                        <li >
                            <a  href="viewArtists">Artists</a>
                        </li>
                        <li >
                            <a  href="addpost">Post your artwork</a>
                        </li>

                        <li >
                            <a  href="redirectToProfile">My profile</a>
                        </li>
                        <li >
                            <img src="data:image/jpg;base64,${user.base64Avatar}" style="vertical-align: middle;
                                                     width: 50px;
                                                     height: 50px;
                                                     border-radius: 50%;"/>
                        </li>
                        <li >
                            <a  href="redirectToProfile">${user.username}</a>
                        </li>
                        <li >
                            <p class="text-center">
                                <a href="/logout" class="btn btn-primary btn-md">Sign out</a>
<%--                            <form  action="logout" method="post">--%>
<%--                                <input type="submit" value="logout">--%>
<%--                            </form>--%>
                            </p>
                        </li>
                    </ul>
                </div>
            </nav>
                            <div class="innserdiv">
                            <h1 id="message">A website dedicated to artists and art lovers<br>
                                Post in Calendart and exhibit your artwork  </h1>
                            </div>


<%--            <!--        proto kouti pano me prologo kai backround photo-->--%>
<%--            <div class="jumbotron text-center" id="prologos" style="margin-bottom:40%">--%>
<%--                <!--            view port width-->--%>
<%--                <h1 id="message">A website dedicated to artists and art lovers<br>--%>
<%--                    Post in Calendart and exhibit your artwork  </h1>--%>
<%--            </div>--%>
        </header>


<%--                            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">--%>
<%--                                <a class="navbar-brand" id="calendart" href="home"><h5>Calendart --%>
<%--                                        <span style="color:red">G</span><span style="color:orange">a</span><span style="color:yellow">l</span><span style="color:green">l</span><span style="color:lightblue">e</span><span style="color:blue">r</span><span style="color:purple">y</span></h5></a>--%>
<%--                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">--%>
<%--                                    <span class="navbar-toggler-icon"></span></h5></a>--%>
<%--                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">--%>
<%--                                        <span class="navbar-toggler-icon"></span>--%>
<%--                                    </button>--%>
<%--                                    <div class="collapse navbar-collapse" id="collapsibleNavbar">--%>
<%--                                        <ul class="navbar-nav">--%>
<%--                                            <li class="nav-item">--%>
<%--                                                <a class="nav-link" href="home">Home</a>--%>
<%--                                            </li>--%>
<%--                                            <li class="nav-item">--%>
<%--                                                <a class="nav-link" href="aboutus">About us</a>--%>
<%--                                            </li>--%>
<%--                                            <li class="nav-item">--%>
<%--                                                <a class="nav-link" href="getLastPosts">Latest posts</a>--%>
<%--                                            </li>--%>

<%--                                            <li class="nav-item">--%>
<%--                                                <a class="nav-link" href="viewArtists">Artists</a>--%>
<%--                                            </li>--%>
<%--                                            <li class="nav-item">--%>
<%--                                                <a class="nav-link" href="addpost">Post your artwork</a>--%>
<%--                                            </li>--%>

<%--                                            <li class="nav-item">--%>
<%--                                                <a class="nav-link" href="redirectToProfile">My profile</a>--%>
<%--                                            </li>--%>
<%--                                            <li class="nav-item">--%>
<%--                                                <img src="data:image/jpg;base64,${user.base64Avatar}" style="vertical-align: middle;--%>
<%--                                                     width: 50px;--%>
<%--                                                     height: 50px;--%>
<%--                                                     border-radius: 50%;"/>--%>
<%--                                            </li>--%>
<%--                                            <li class="nav-item">--%>
<%--                                                <a class="nav-link" href="redirectToProfile">${user.username}</a>--%>
<%--                                            </li>--%>
<%--                                            <li class="nav-item">--%>
<%--                                                <form class="nav-item" action="logout" method="post">            --%>
<%--                                                    <input type="submit" value="logout">--%>
<%--                                                    </li> --%>


<%--                                                    </ul>--%>
<%--                                                    </div>  --%>
<%--                                                    </nav>--%>


                                                    <% }%>
<%--        <!--        proto kouti pano me prologo kai backround photo-->--%>
<%--        <div class="jumbotron text-center" id="prologos" style="margin-bottom:40%">--%>
<%--            <!--            view port width-->--%>
<%--            <h1 id="message">A website dedicated to artists and art lovers<br>--%>
<%--                Post in Calendart and exhibit your artwork  </h1>--%>
<%--        </div>--%>


        <!-- latest posts-->
                                                    <!-- start here-->
                                                    <div class="container" style="margin-top:10px">
                                                        <h2>Latest posts</h2></br>
                                                        <hr>

                                                    </div>
                                                    <div class="container" style="margin-top:0px">
                                                        <div class="row"


                                                            <c:forEach var = "l" items="${posts}">
                                                                <div class="col-sm-8" id="even">
                                                                   <!--  theto tin id tou user pou einai sundedemenos-->--%>
<%--                                                                    <%int role = (Integer) session.getAttribute("role");%>--%>
                                                                    <h2>${l.title}</h2>
                                                                    <h5>post #${l.idpost}, ${l.dispDate}, by </h5>
<%--                                                                avatar - should not be null-->--%>
                                                                        <img src="data:image/jpg;base64,${l.iduser.base64Avatar}" style="vertical-align: middle;
                                                                             width: 50px;
                                                                             height: 50px;
                                                                             border-radius: 50%;"/>
                                                                        <a  href=" <c:url value="profile">
                                                                                <c:param name="unartist" value="${l.iduser.username}"/>
                                                                            </c:url>">${l.iduser.username}</a>
                                                                    </h5>
                                                                    <div class="fakeimg"><img src="data:image/jpg;base64,${l.base64Photo}" style="max-width: 80%; height: auto;"/></div>
                                                                    <p>${l.description}</p>
                                                                    <br>
                                                                    <!-- an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->
                                                                    <c:if test = "${l.iduser.iduser==iduser || role==1 }" >
                                                                        <a  href=" <c:url value="deletepost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                            </c:url>">Delete |</a>
                                                                        <a  href="<c:url value="editpost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                            </c:url>">Edit |</a>
                                                                    </c:if>
                                                                    <a  href="<c:url value="viewPost">
                                                                            <c:param name="idpost" value="${l.idpost}"/>
                                                                        </c:url>">View artwork</a>
                                                                    <hr>
                                                                </div>
                                                            </c:forEach>

                                                                <c:forEach var="post" items="${postsPage.content}">
                                                                    <div class="col-sm-8" id="even">
<%--                                                                    <!--  theto tin id tou user pou einai sundedemenos-->--%>
                                                                        <%int role = (Integer) session.getAttribute("role");%>
                                                                        <h2>${post.title}</h2>
                                                                        <h5>post #${post.idpost}, ${post.dispDate}, by </h5>
                                                                            <%--                                                                                                                                            avatar - should not be null-->--%>
                                                                        <img src="data:image/jpg;base64,${post.iduser.base64Avatar}" style="vertical-align: middle;
                                                                             width: 50px;
                                                                             height: 50px;
                                                                             border-radius: 50%;"/>
                                                                        <a  href=" <c:url value="profile">
                                                                                <c:param name="unartist" value="${post.iduser.username}"/>
                                                                            </c:url>">${post.iduser.username}</a>
                                                                        </h5>
                                                                        <div class="fakeimg"><img src="data:image/jpg;base64,${post.base64Photo}" style="max-width: 80%; height: auto;"/></div>
                                                                        <p>${post.description}</p>
                                                                        <br>
                                                                        <!-- an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->
                                                                        <c:if test = "${post.iduser.iduser==iduser || role==1 }" >


                                                                            <a  href=" <c:url value="deletepost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(post.idpost)}"/>
                                                                            </c:url>">Delete |</a>

                                                                            <a  href="<c:url value="editpost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(post.idpost)}"/>
                                                                            </c:url>">Edit |</a>

                                                                        </c:if>

                                                                        <a  href="<c:url value="viewPost">
                                                                            <c:param name="idpost" value="${post.idpost}"/>
                                                                        </c:url>">View artwork</a>


                                                                        <hr>
                                                                    </div>

                                                                </c:forEach>

                                                        <ul class="pagination justify-content-center">
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
                                                                    <a class="page-link" href="/home?size=${postsPage.size}&page=${pageNumber}">${pageNumber}</a>

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


<%--                                                        <div th:if="${bookPage.totalPages > 0}" class="pagination"--%>
<%--                                                             th:each="pageNumber : ${pageNumbers}">--%>
<%--                                                            <a th:href="@{/listBooks(size=${bookPage.size}, page=${pageNumber})}"--%>
<%--                                                               th:text=${pageNumber}--%>
<%--                                                                       th:class="${pageNumber==bookPage.number + 1} ? active"></a>--%>
<%--                                                        </div>--%>


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

                                                                                <img class="img-fluid rounded mb-3 mb-md-0" src="data:image/jpg;base64,${artists.base64Avatar}" alt="">
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

<%--                                             <div class="jumbotron text-center" style="margin-bottom:0">-->&ndash;%&gt;--%>
<%--                                                    <ul class="pagination justify-content-center">--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href="#" aria-label="Previous">--%>
<%--                                                                <span aria-hidden="true">&laquo;</span>--%>
<%--                                                                <span class="sr-only">Previous</span>--%>
<%--                                                            </a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href="getLastPosts">1</a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="2"/>--%>
<%--                                                               </c:url>">2</a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="3"/>--%>
<%--                                                               </c:url>">3</a>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="4"/>--%>
<%--                                                               </c:url>">4</a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="5"/>--%>
<%--                                                               </c:url>">5</a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="6"/>--%>
<%--                                                               </c:url>">6</a>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="7"/>--%>
<%--                                                               </c:url>">7</a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="8"/>--%>
<%--                                                               </c:url>">8</a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href=" <c:url value="nextpage">--%>
<%--                                                                   <c:param name="pagenumber" value="9"/>--%>
<%--                                                               </c:url>">9</a>--%>
<%--                                                        </li>--%>
<%--                                                        <li class="page-item">--%>
<%--                                                            <a class="page-link" href="#" aria-label="Next">--%>
<%--                                                                <span aria-hidden="true">&raquo;</span>--%>
<%--                                                                <span class="sr-only">Next</span>--%>
<%--                                                            </a>--%>
<%--                                                        </li>--%>
<%--                                                    </ul>--%>
<%--                                             </div>--%>
                                                    <script>
                                                        $(document).ready(function() {
                                                            $(".menu-icon").on("click", function() {
                                                                $("nav ul").toggleClass("showing");
                                                            });
                                                            // modalll

                                                            var $formLogin = $('#login-form');
                                                            var $formLost = $('#lost-form');
                                                            var $formRegister = $('#register-form');
                                                            var $divForms = $('#div-forms');
                                                            var $modalAnimateTime = 300;
                                                            var $msgAnimateTime = 150;
                                                            var $msgShowTime = 2000;

                                                            $("form").submit(function () {
                                                                switch(this.id) {
                                                                    case "login-form":
                                                                        var $lg_username=$('#login_username').val();
                                                                        var $lg_password=$('#login_password').val();
                                                                        if ($lg_username == "ERROR") {
                                                                            msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
                                                                        } else {
                                                                            msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
                                                                        }
                                                                        return true;
                                                                        // break;
                                                                    case "lost-form":
                                                                        var $ls_email=$('#lost_email').val();
                                                                        if ($ls_email == "ERROR") {
                                                                            msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "error", "glyphicon-remove", "Send error");
                                                                        } else {
                                                                            msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "success", "glyphicon-ok", "Send OK");
                                                                        }
                                                                        return false;
                                                                        break;
                                                                    case "register-form":
                                                                        var $rg_username=$('#register_username').val();
                                                                        var $rg_email=$('#register_email').val();
                                                                        var $rg_password=$('#register_password').val();
                                                                        if ($rg_username == "ERROR") {
                                                                            msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "error", "glyphicon-remove", "Register error");
                                                                        } else {
                                                                            msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "success", "glyphicon-ok", "Register OK");
                                                                        }
                                                                        return false;
                                                                        break;
                                                                    default:
                                                                        return false;
                                                                }
                                                                return false;
                                                            });

                                                            $('#login_register_btn').click( function () { modalAnimate($formLogin, $formRegister) });
                                                            $('#register_login_btn').click( function () { modalAnimate($formRegister, $formLogin); });
                                                            $('#login_lost_btn').click( function () { modalAnimate($formLogin, $formLost); });
                                                            $('#lost_login_btn').click( function () { modalAnimate($formLost, $formLogin); });
                                                            $('#lost_register_btn').click( function () { modalAnimate($formLost, $formRegister); });
                                                            $('#register_lost_btn').click( function () { modalAnimate($formRegister, $formLost); });

                                                            function modalAnimate ($oldForm, $newForm) {
                                                                var $oldH = $oldForm.height();
                                                                var $newH = $newForm.height();
                                                                $divForms.css("height",$oldH);
                                                                $oldForm.fadeToggle($modalAnimateTime, function(){
                                                                    $divForms.animate({height: $newH}, $modalAnimateTime, function(){
                                                                        $newForm.fadeToggle($modalAnimateTime);
                                                                    });
                                                                });
                                                            }

                                                            function msgFade ($msgId, $msgText) {
                                                                $msgId.fadeOut($msgAnimateTime, function() {
                                                                    $(this).text($msgText).fadeIn($msgAnimateTime);
                                                                });
                                                            }

                                                            function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
                                                                var $msgOld = $divTag.text();
                                                                msgFade($textTag, $msgText);
                                                                $divTag.addClass($divClass);
                                                                $iconTag.removeClass("glyphicon-chevron-right");
                                                                $iconTag.addClass($iconClass + " " + $divClass);
                                                                setTimeout(function() {
                                                                    msgFade($textTag, $msgOld);
                                                                    $divTag.removeClass($divClass);
                                                                    $iconTag.addClass("glyphicon-chevron-right");
                                                                    $iconTag.removeClass($iconClass + " " + $divClass);
                                                                }, $msgShowTime);
                                                            }


                                                        // Scrolling Effect

                                                        $(window).on("scroll", function() {
                                                            if($(window).scrollTop()) {
                                                                $('nav').addClass('black');
                                                            }

                                                            else {
                                                                $('nav').removeClass('black');
                                                            }
                                                        })

                                                        // When the user scrolls down 20px from the top of the document, show the button
                                                        window.onscroll = function () {
                                                            scrollFunction()
                                                        };

                                                        function scrollFunction() {
                                                            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                                                                document.getElementById("myBtn").style.display = "block";
                                                            } else {
                                                                document.getElementById("myBtn").style.display = "none";
                                                            }
                                                        }

                                                        // When the user clicks on the button, scroll to the top of the document
                                                        function topFunction() {
                                                            document.body.scrollTop = 0;
                                                            document.documentElement.scrollTop = 0;
                                                        }
                                                        });



                                                    </script>
                                                    </body>
                                                    </html>
