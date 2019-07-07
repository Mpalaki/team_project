<%-- 
    Document   : test
    Created on : 17-Jun-2019, 16:39:33
    Author     : Makis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendart</title>

        <!--        nikos-->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            .divider-text {
                position: relative;
                text-align: center;
                margin-top: 15px;
                margin-bottom: 15px;
            }
            .divider-text span {
                padding: 7px;
                font-size: 12px;
                position: relative;   
                z-index: 2;
            }
            .divider-text:after {
                content: "";
                position: absolute;
                width: 100%;
                border-bottom: 1px solid #ddd;
                top: 55%;
                left: 0;
                z-index: 1;
            }

            .btn-facebook {
                background-color: #405D9D;
                color: #fff;
            }
            .btn-twitter {
                background-color: #42AEEC;
                color: #fff;
            }
        </style>
        <!--nikos-->
    </head>
    <body>

        <!--        nikos-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">


        <div class="container">
            <div class="card bg-light">
                <article class="card-body mx-auto" style="max-width: 400px;">
                    <h4 class="card-title mt-3 text-center">Create Account</h4>
                    <p class="text-center">Get started with your free account</p>
                    <p>
                        <a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Login via Twitter</a>
                        <a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Login via facebook</a>
                    </p>
                    <p class="divider-text">
                        <span class="bg-light">OR</span>
                    </p>
                    <form action="RegisterController" enctype="multipart/form-data" method="post">
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
                        <p class="text-center">Have an account? <a href="">Log In</a> </p>                                                                 
                    </form>
                </article>
            </div> <!-- card.// -->

        </div> 
        <!--container end.//-->

        <br><br>
        <article class="bg-secondary mb-3">  
            <div class="card-body text-center">
                <h3 class="text-white mt-3">Bootstrap 4 UI KIT</h3>
                <p class="h5 text-white">Components and templates  <br> for Ecommerce, marketplace, booking websites 
                    and product landing pages</p>   <br>
                <p><a class="btn btn-warning" target="_blank" href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com  
                        <i class="fa fa-window-restore "></i></a></p>
            </div>
            <br><br>
        </article>
        <!--nikos-->

    </body>
</html>