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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--                <link rel="stylesheet" href="profile.css">-->
        <link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="jquery-3.2.1.js"></script>

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
                                <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h5>Calendart Gallery</h5></a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                                    <ul class="navbar-nav">
                                        <li class="nav-item">
                                            <a class="nav-link" href="home">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="addpost">Post your artwork</a>
                                        </li>

                                        <!--                                        <li class="nav-item">
                                                                                    <form class="nav-item" action="logout" method="post">            
                                                                                        <input type="submit" value="logout">
                                                                                        </li> -->
                                    </ul>
                                </div>  

                            </nav>

                            <!-- Success Alerts -->
                            <c:if test="${success=='pm sent'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Your message has been sent successfully.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>
                            <c:if test="${success=='removal'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Your message has been deleted successfully.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>
                            <c:if test="${success=='fr sent'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Your friend request has been sent successfully.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>
                            <c:if test="${success=='fr deleted'}">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>Success!</strong> Friend has been removed.
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </c:if>

                            <% }%>

                            <div class="container">
                                <div class="row my-2">
                                    <div class="col-lg-8 order-lg-2">
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item">
                                                <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="" data-target="#friends" data-toggle="tab" class="nav-link">Friends (${friends.size()})</a>
                                            </li>
                                            <!--    eleghos gia na vlepei tin epilogi edit efoson einai diko tou to profile-->
                                            <c:if test = "${user.iduser==iduser}" >
                                                <li class="nav-item">
                                                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="" data-target="#pms" data-toggle="tab" class="nav-link">Inbox (${pms.size()})</a>
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
                                                            ${user.aboutme}
                                                        </p>
                                                        <h6>Joined:</h6>
                                                        <p>
                                                            ${user.dispDate}
                                                        </p>
                                                    </div>
                                                    <div class="col-md-6" style="background-color: #fafbc5">
                                                        <!--   tests if there is a user logged in, so that a visitor does not see the below buttons-->
                                                        <c:if test = "${iduser!=null}" >
                                                            <!--when he presses the button the form shows up -->
                                                            <button type="button" id="pmbtn" class="btn btn-warning badge badge-light badge-pill" style="margin-bottom: 8px;margin-top: 8px; margin-left: 0px"><i style="font-size:24px" class="fa">&#xf0e0;</i> message</button>

                                                            <form action="pm" id="pmform" class="was-validated" method="post"  style="display:none;">
                                                                <div class="form-group">
                                                                    <input type=hidden id="idsender" name="idsender" value="${iduser}">
                                                                    <input type=hidden id="idreceiver" name="idreceiver" value="${user.iduser}">
                                                                    <input type="text" id="uname" class="form-control"  name="title" placeholder="title">
                                                                </div>
                                                                <div class="form-group">
                                                                    <textarea rows = "5" cols = "40" class="form-control"  name = "text" required></textarea></br>
                                                                </div>
                                                                <button type="submit" class="btn btn-info badge badge-light badge-pill" >Send</button>
                                                                <hr>
                                                            </form>
                                                            <!-- if the session user has already sent a friend request to the profile owner or he is the profile owner, he will not see the below button -->
                                                            <c:if test="${!(friendRequestedList.contains(iduser) or user.iduser==iduser)}">
                                                                <!--button that sends a friend request -->
                                                                <form action="friendrequest" method="post">                                                                
                                                                    <input type=hidden id="idfriend1" name="idfriend1" value="${iduser}">
                                                                    <input type=hidden id="idfriend2" name="idfriend2" value="${user.iduser}">                                                                                                                               
                                                                    <button type="submit" class="btn btn-warning badge badge-light badge-pill" style="margin-bottom: 8px;margin-top: 8px; margin-left: 0px"><i style="font-size:24px" class="fa">&#xf234;</i> add</button>
                                                                </form>
                                                            </c:if><hr>
                                                        </c:if>
                                                        <c:if test="${user.email!=null and (user.email!='')}">
                                                            email address: ${user.email}<hr>
                                                        </c:if>                                                        
                                                        <c:if test="${user.twitter!=null and (user.twitter!='')}">
                                                            <a class="btn btn-primary btn-twitter btn-sm" href="${user.twitter}">
                                                                <i class="fa fa-twitter"></i>
                                                            </a>
                                                        </c:if>                                                        
                                                        <c:if test="${user.facebook!=null and (user.facebook!='')}">
                                                            <a class="btn btn-info btn-sm" rel="publisher"
                                                               href="${user.facebook}">
                                                                <i class="fa fa-facebook"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${user.instagram!=null and (user.instagram!='')}">
                                                            <a class="btn btn-primary btn-sm" rel="publisher" href="${user.instagram}">
                                                                <i class="fa fa-instagram"></i>
                                                            </a>
                                                        </c:if>
                                                        <hr>
                                                        <span class="badge badge-warning" style="margin-bottom: 20px"><i class="fa fa-photo"></i> ${user.postsNo} posts</span>
                                                        <span class="badge badge-warning" style="margin-bottom: 20px"><i class="fa fa-comment"></i> ${user.commentsNo} comments</span>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <h3 class="mt-2">Artwork</h3>
                                                        <hr>
                                                        <table class="table table-sm table-hover table-striped">
                                                            <tbody>                                    
                                                                <c:forEach var = "l" items="${posts}">
                                                                <div class="col-sm-8" id="even">
                                                                    <!--  theto tin id tou user pou einai sundedemenos-->
                                                                    <% int role = (Integer) session.getAttribute("role");%>

                                                                    <h2>${l.title}</h2>
                                                                    <h5>artis opus #${l.idpost}, ${l.dispDate}, by 


                                                                        ${l.iduser.username}</h5>
                                                                    <div class="fakeimg"><img src="${l.urlImage}" style="max-width: 100%; height: auto;"/></div>
                                                                    <p>${l.description}</p>
                                                                    <br>


                                                                    <!-- an to post ehei ginei ap ton hristi pou einai sundedemenos, na ehei epiloges edit,delete      -->
                                                                    <c:if test = "${l.iduser.iduser==iduser || role==1 }" >                            


                                                                        <a  href=" <c:url value="deletepost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                            </c:url>">Delete </a>|

                                                                        <a  href="<c:url value="editpost">
                                                                                <c:param name="idpost" value="${EncryptUtils.encrypt(l.idpost)}"/>
                                                                            </c:url>">Edit </a>|

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
                                            <!-- FRIENDS TAB-->
                                            <div class="tab-pane" id="friends">
                                                <c:if test = "${user.iduser==iduser}" >
                                                    <c:forEach var = "f" items="${friendrequests}">
                                                        <div class="alert alert-info alert-dismissable">
                                                            <!--------- <a class="panel-close close" data-dismiss="alert">×</a>-->
                                                            <span class="float-right font-weight-bold">
                                                                <a  href=" <c:url value="acceptfriendrequest">
                                                                        <c:param name="idfr1" value="${EncryptUtils.encrypt(f.user.iduser)}"/>
                                                                        <c:param name="idfr2" value="${EncryptUtils.encrypt(f.user1.iduser)}"/>
                                                                    </c:url>">accept </a>|<a  href=" <c:url value="declinefriendrequest">
                                                                        <c:param name="idfr1" value="${EncryptUtils.encrypt(f.user.iduser)}"/>
                                                                        <c:param name="idfr2" value="${EncryptUtils.encrypt(f.user1.iduser)}"/>
                                                                    </c:url>"> decline</a></span>
                                                            You have a friend request from: 
                                                            <a  href=" <c:url value="profile">
                                                                    <c:param name="unartist" value="${f.user.username}"/>
                                                                </c:url>">${f.user.username}</a>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>

                                                <!-- Controller sends list with friendship objects (named 'friends') and I loop it.
                                                In each of this list's items, there are included 2 users - one is the user who owns the profile I am looking
                                                and the other user is a friend of his. I use 'c:if' to display only the username of the friend and not
                                                the username of the user that is the profile owner-->
                                                <table class="table table-hover table-striped">
                                                    <c:forEach var = "friends" items="${friends}">
                                                        <tbody>                                    
                                                            <tr>
                                                                <td>
                                                                    <!-- user.iduser is the profile owner's id-->
                                                                    <c:if test = "${user.iduser!=friends.user1.iduser}" >
                                                                        <span class="float-left font-weight-bold">
                                                                            <img src="${friends.user1.stringAvatar}" style="vertical-align: middle;
                                                                                 width: 50px;
                                                                                 height: 50px;
                                                                                 border-radius: 50%;"/>
                                                                            <a  href=" <c:url value="profile">
                                                                                    <c:param name="unartist" value="${friends.user1.username}"/>
                                                                                </c:url>">${friends.user1.username}</a>

                                                                        </span>
                                                                        <!-- iduser is the session user's id. Below I test if the session user is the profile owner
                                                                         and if(true) he will have the option of deleting his friends. -->
                                                                        <c:if test = "${user.iduser==iduser}" >
                                                                            <span class="float-right font-weight-bold">
                                                                                <a  href=" <c:url value="deletefriend">
                                                                                        <c:param name="deleter" value="${EncryptUtils.encrypt(user.iduser)}"/>
                                                                                        <c:param name="deleted" value="${EncryptUtils.encrypt(friends.user1.iduser)}"/>
                                                                                    </c:url>"> delete 
                                                                                </a>
                                                                            </span>
                                                                        </c:if>
                                                                    </c:if>

                                                                    <c:if test = "${user.iduser!=friends.user.iduser}" >
                                                                        <span class="float-left font-weight-bold">
                                                                            <img src="${friends.user.stringAvatar}" style="vertical-align: middle;
                                                                                 width: 50px;
                                                                                 height: 50px;
                                                                                 border-radius: 50%;"/>
                                                                            <a  href=" <c:url value="profile">
                                                                                    <c:param name="unartist" value="${friends.user.username}"/>
                                                                                </c:url>">${friends.user.username}</a>
                                                                        </span>
                                                                        <c:if test = "${user.iduser==iduser}" >
                                                                            <span class="float-right font-weight-bold">
                                                                                <a  href=" <c:url value="deletefriend">
                                                                                        <c:param name="deleter" value="${EncryptUtils.encrypt(user.iduser)}"/>
                                                                                        <c:param name="deleted" value="${EncryptUtils.encrypt(friends.user.iduser)}"/>
                                                                                    </c:url>"> delete 
                                                                                </a>
                                                                            </span>
                                                                        </c:if> 
                                                                    </c:if>
                                                                </td>
                                                            </tr>
                                                        </tbody> 
                                                    </c:forEach>
                                                </table>
                                            </div>
                                            <!-- personal messages-->
                                            <div class="tab-pane" id="pms">

                                                <table class="table table-hover table-striped" id="pms2">
                                                    <tbody>
                                                        <c:forEach var = "pms" items="${pms}" varStatus="pmStatus">
                                                            <tr>
                                                                <td>
                                                                    <span class="float-right font-weight-bold">${pms.dispDate} | <a  href=" <c:url value="deletepm">
                                                                                                                                         <c:param name="idpm" value="${EncryptUtils.encrypt(pms.idpm)}"/>
                                                                                                                                         <c:param name="idreceiver" value="${pms.idreceiver.iduser}"/>
                                                                                                                                     </c:url>">Delete</a></span> from:
                                                                    <img src="${pms.idsender.stringAvatar}" style="vertical-align: middle;
                                                                         width: 40px;
                                                                         height: 40px;
                                                                         border-radius: 50%;"/> 
                                                                    <a  href=" <c:url value="profile">
                                                                            <c:param name="unartist" value="${pms.idsender.username}"/>
                                                                        </c:url>">${pms.idsender.username}</a>
                                                                    <br>subject: <b>${pms.title}</b><br><hr>${pms.text}<br><hr>

                                                                    <!--  form for reply -->

                                                                    <form action = "reply" method = "POST">
                                                                        <input type=hidden id="idsender" name="idsender" value="${pms.idreceiver.iduser}">
                                                                        <input type=hidden id="idreceiver" name="idreceiver" value="${pms.idsender.iduser}">
                                                                        <input type=hidden id="title" name="title" value="${pms.title}">
                                                                        <textarea rows = "2" cols = "50" class="custom-file-textarea" style="border-radius: 4px; background-color: #fafbc5"  name = "text" required></textarea><br>
                                                                        <button type="submit" class="btn btn-info badge badge-light badge-pill" >reply</button>
                                                                    </form>


                                                                </td>
                                                            </tr>                                                        
                                                        </c:forEach>
                                                    </tbody> 
                                                </table>
                                            </div>
                                            <!--                                  eleghos gia na mporei na kanei edit to profile efoson einai diko tou-->
                                            <c:if test = "${user.iduser==iduser}" >
                                                <div class="tab-pane" id="edit">
                                                    <form role="form" action="updateprofile" method="post">
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label">First name</label>
                                                            <div class="col-lg-9">
                                                                <input class="form-control" name="firstName" type="text" value="${user.firstName}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                                                            <div class="col-lg-9">
                                                                <input class="form-control" name="lastName" type="text" value="${user.lastName}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label">Email<br>( public information )</label>
                                                            <div class="col-lg-9">
                                                                <input class="form-control" name="email" type="email" value="${user.email}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label">Facebook<br>( public information )</label>
                                                            <div class="col-lg-9">
                                                                URL path of FB profile (e.g 'https://www.facebook.com/makis.karfakis.1')<br>
                                                                <input class="form-control" name="facebook" type="text" value="${user.facebook}" alt="URL path of FB profile (e.g 'https://www.facebook.com/makis.karfakis.1')">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label">Instagram<br>( public information )</label>
                                                            <div class="col-lg-9">
                                                                URL path of FB profile (e.g 'https://www.facebook.com/makis.karfakis.1')<br>
                                                                <input class="form-control" name="instagram" type="text" value="${user.instagram}" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label">Twitter<br>( public information )</label>
                                                            <div class="col-lg-9">
                                                                URL path of FB profile (e.g 'https://www.facebook.com/makis.karfakis.1')<br>
                                                                <input class="form-control" name="twitter" type="text" value="${user.twitter}">
                                                            </div>
                                                        </div>
                                                        <!--                                                        <div class="form-group row">
                                                                                                                    <label class="col-lg-3 col-form-label form-control-label">Website<br>( public information)</label>
                                                                                                                    <div class="col-lg-9">
                                                                                                                        <input class="form-control" type="url" value="">
                                                                                                                    </div>
                                                                                                                </div>-->
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label">About me</label>
                                                            <textarea class="col-lg-9" rows = "6" cols = "50" name = "aboutme">${user.aboutme} </textarea></br>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-lg-3 col-form-label form-control-label"></label>
                                                            <div class="col-lg-9">
                                                                <input type="reset" class="btn btn-secondary" value="Cancel">
                                                                <input type="submit" class="btn btn-primary" value="Save Changes">
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
                                        <h2 class="mt-2" style="background-color: #fafbc5; color:black; font-family: 'Barriecito', cursive;">${user.username}</h2>
                                        <img src="${user.stringAvatar}" class="mx-auto img-fluid img-circle d-block" alt="avatar">
                                        <c:if test = "${user.iduser==iduser}" >
                                            <h6 class="mt-2">Upload a different photo ( max size: 1 MB)</h6>
                                            <form action="updatephoto" enctype="multipart/form-data" method="post">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="file" name="avatar" onchange="GetFileSize()" required>
                                                    <input type=hidden id="iduser" name="iduser" value="${iduser}">
                                                    <label class="custom-file-label" for="customFile">Choose file</label>
                                                    <h6 id="toobig" style="margin-top: 7px"></h6>
                                                    <button type="submit" class="btn btn-light" id="disable">Submit</button>
                                                </div>
                                            </form>
                                        </c:if>
                                        <c:if test = "${user.iduser==iduser || role==1}" >
                                            <form action="deleteme" style="margin-top: 7px">
                                                <div class="custom-file">
                                                    <input type=hidden id="iduser" name="iduser" value="${EncryptUtils.encrypt(user.iduser)}">
                                                    <button type="submit" class="btn btn-danger badge badge-light badge-pill">Delete Account</button>
                                                </div>
                                            </form>

                                        </c:if>
                                        <c:if test = "${user.iduser!=iduser && role==1 && user.role!=1}" >
                                            <form action="setAsAdmin" >
                                                <div class="custom-file">
                                                    <input type=hidden id="iduser" name="iduser" value="${EncryptUtils.encrypt(user.iduser)}">
                                                    <button type="submit" class="btn btn-danger badge badge-light badge-pill">Set as administrator</button>
                                                </div>
                                            </form>

                                        </c:if>

                                    </div>
                                </div>
                            </div>
                            <script>
                                // Add the following code if you want the name of the file appear on select
                                $(".custom-file-input").on("change", function () {
                                    var fileName = $(this).val().split("\\").pop();
                                    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                                });

                                $("#pmbtn").click(function () {
                                    $("#pmform").toggle();
                                });

                                function GetFileSize() {
                                    var fi = document.getElementById('file'); // GET THE FILE INPUT.

                                    // VALIDATE OR CHECK IF ANY FILE IS SELECTED.
                                    if (fi.files.length > 0) {
                                        // RUN A LOOP TO CHECK EACH SELECTED FILE.
                                        for (var i = 0; i <= fi.files.length - 1; i++) {

                                            var fsize = fi.files.item(i).size;      // THE SIZE OF THE FILE.
                                            if (fsize / 1024 > 100) {
                                                document.getElementById('toobig').innerHTML = 'image is too big';
                                                document.getElementById('toobig').style.color = "red";
                                                document.getElementById('disable').disabled = true;
                                            } else {
                                                document.getElementById('toobig').innerHTML = 'valid size';
                                                document.getElementById('toobig').style.color = "green";
                                                document.getElementById('disable').disabled = false;
                                            }
                                        }
                                    }
                                }

                            </script>
                            </body>

                            </html>
