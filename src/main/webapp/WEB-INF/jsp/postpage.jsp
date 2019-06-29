<%-- 
    Document   : postpage
    Created on : 21-Jun-2019, 23:34:08
    Author     : Makis
--%>


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


        <div class="container">

            <!-- Page Heading -->
            <h1 class="my-4">Page Heading
                <small>Secondary Text</small>
            </h1>
            <table>

                <tr>
                <div class="row">
                    <div class="col-md-5">
                        <h3>${post.idpost}</h3>
                        <h3>${post.title}</h3>
                        <h3>${post.date}</h3>
                    </div>
                    <div class="col-md-7">
                        <a href="#">
                            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
                        </a>
                    </div>
                    <div class="col-md-5">                            
                        <p>${post.description}</p></br>
                        <form action="insertcomment" method="post">
                            <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
                            <textarea rows = "5" cols = "50" name = "description">
            Enter your comment
                            </textarea></br>  

                            <input type="submit"></br>

                            </div>
                            </div>

                            </tr>
                            <hr>

                            </table>


                            <table>


                                <c:forEach var = "comments" items="${comments}">

                                    <div class="media border p-3">
                                        <div class="media-body">
                                            <h4>#${comments.idcomment} ${comments.iduser.username}<small><i> posted on ${comments.date}</i></small></h4>
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
                            </ul>

                    </div>
                    <!-- /.container -->
                    </body>
                    </html>
