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
        <link rel="stylesheet" href="welcome.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </head>
    <body>      
        <!--        gia to logout ruthmiseis-->
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// htttp 1.1
            response.setHeader("Pragma", "no-cache"); // http 1/0
            response.setHeader("Expires", "0"); // proxies
            String username = (String) session.getAttribute("username");
            if (username == null) {%>

        <!--        to navbar an den einai logged in-->

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
                        <a class="nav-link" href="SignupController">Sign up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="forgotpassword">Forgot your password?</a>
                    </li>
                    <li class="nav-item">
                        <form  class="nav-item" action="LoginController" method="post">

                            <input type="text" name="username" placeholder="username" required>
                            <input type="password" name="password" placeholder="password" required>
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
                                            <form class="nav-item" action="logout" method="post">            
                                                <input type="submit" value="logout">
                                                </li> 
                                                </ul>
                                                </div>  
                                                </nav>
                                                <% }%>

                                                <div class="container">
                                                    <div class="row my-2">
                                                        <div class="col-lg-8 order-lg-2">
                                                            <ul class="nav nav-tabs">
                                                                <li class="nav-item">
                                                                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a href="" data-target="#messages" data-toggle="tab" class="nav-link">Messages</a>
                                                                </li>
                                                                <!--    eleghos gia na vlepei tin epilogi edit efoson einai diko tou to profile-->
                                                                <c:if test = "${user.iduser==iduser}" >
                                                                    <li class="nav-item">
                                                                        <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Personal messages</a>
                                                                    </li>
                                                                </c:if>
                                                            </ul>
                                                            <div class="tab-content py-4">
                                                                <div class="tab-pane active" id="profile">
                                                                    <h5 class="mb-3">Profile</h5>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <h6>About</h6>
                                                                            <p>
                                                                                Web Designer, UI/UX Engineer
                                                                            </p>
                                                                            <h6>Joined:</h6>
                                                                            <p>
                                                                                ${user.dispDate}
                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6">                                                                            
                                                                            <span class="badge badge-primary"><i class="fa fa-user"></i> ${user.postsNo} posts</span>
                                                                            <span class="badge badge-success"><i class="fa fa-cog"></i> ${user.commentsNo} comments</span>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <h3 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span> Artwork</h3>
                                                                            <hr>
                                                                            <table class="table table-sm table-hover table-striped">
                                                                                <tbody>                                    
                                                                                    <c:forEach var = "l" items="${posts}">
                                                                                    <div class="col-sm-8" id="even">
                                                                                        <!--  theto tin id tou user pou einai sundedemenos-->
                                                                                        <% int role = (Integer) session.getAttribute("role");%>

                                                                                        <h2>${l.title}</h2>
                                                                                        <h5>post #${l.idpost}, ${l.dispDate}, by 


                                                                                            ${l.iduser.username}</h5>
                                                                                        <div class="fakeimg"><img src="data:image/jpg;base64,${l.base64Photo}" style="max-width: 100%; height: auto;"/></div>
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
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <!--/row-->
                                                                </div>
                                                                <div class="tab-pane" id="messages">
                                                                    <div class="alert alert-info alert-dismissable">
                                                                        <a class="panel-close close" data-dismiss="alert">×</a> This is an <strong>.alert</strong>. Use this to show important messages to the user.
                                                                    </div>
                                                                    <table class="table table-hover table-striped">
                                                                        <tbody>                                    
                                                                            <tr>
                                                                                <td>
                                                                                    <span class="float-right font-weight-bold">3 hrs ago</span> Here is your a link to the latest summary report from the..
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <span class="float-right font-weight-bold">Yesterday</span> There has been a request on your account since that was..
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <span class="float-right font-weight-bold">9/10</span> Porttitor vitae ultrices quis, dapibus id dolor. Morbi venenatis lacinia rhoncus. 
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <span class="float-right font-weight-bold">9/4</span> Vestibulum tincidunt ullamcorper eros eget luctus. 
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <span class="float-right font-weight-bold">9/4</span> Maxamillion ais the fix for tibulum tincidunt ullamcorper eros. 
                                                                                </td>
                                                                            </tr>
                                                                        </tbody> 
                                                                    </table>
                                                                </div>
                                                                <!--                                  eleghos gia na mporei na kanei edit to profile efoson einai diko tou-->
                                                                <c:if test = "${user.iduser==iduser}" >
                                                                    <div class="tab-pane" id="edit">
                                                                        <form role="form">
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">First name</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="text" value="Jane">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="text" value="Bishop">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="email" value="email@gmail.com">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Company</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="text" value="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Website</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="url" value="">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Address</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="text" value="" placeholder="Street">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label"></label>
                                                                                <div class="col-lg-6">
                                                                                    <input class="form-control" type="text" value="" placeholder="City">
                                                                                </div>
                                                                                <div class="col-lg-3">
                                                                                    <input class="form-control" type="text" value="" placeholder="State">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Time Zone</label>
                                                                                <div class="col-lg-9">
                                                                                    <select id="user_time_zone" class="form-control" size="0">
                                                                                        <option value="Hawaii">(GMT-10:00) Hawaii</option>
                                                                                        <option value="Alaska">(GMT-09:00) Alaska</option>
                                                                                        <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                                                                                        <option value="Arizona">(GMT-07:00) Arizona</option>
                                                                                        <option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                                                                                        <option value="Central Time (US &amp; Canada)" selected="selected">(GMT-06:00) Central Time (US &amp; Canada)</option>
                                                                                        <option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                                                                                        <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Username</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="text" value="janeuser">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Password</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="password" value="11111122333">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
                                                                                <div class="col-lg-9">
                                                                                    <input class="form-control" type="password" value="11111122333">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group row">
                                                                                <label class="col-lg-3 col-form-label form-control-label"></label>
                                                                                <div class="col-lg-9">
                                                                                    <input type="reset" class="btn btn-secondary" value="Cancel">
                                                                                    <input type="button" class="btn btn-primary" value="Save Changes">
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                    <div class="tab-pane" id="pms">
                                                                        
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 order-lg-1 text-center">
                                                            <h2 class="mt-2" style="background-color: #fafbc5">${user.username}</h2>
                                                            <img src="data:image/jpg;base64,${user.base64Avatar}" class="mx-auto img-fluid img-circle d-block" alt="avatar">
                                                            <c:if test = "${user.iduser==iduser}" >
                                                                <h6 class="mt-2">Upload a different photo</h6>
                                                                <label class="custom-file">
                                                                    <input type="file" id="file" class="custom-file-input" >
                                                                    <span class="custom-file-control">Choose file</span>
                                                                </label>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                </body>

                                                </html>
