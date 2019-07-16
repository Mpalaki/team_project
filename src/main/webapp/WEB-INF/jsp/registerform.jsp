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
        <link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet"> 
        <style>
            body{
                background-image:  url("japan-galleries_blum-and-poe_1100x733.jpg"); /* The image used */
                background-color: #cccccc; /* Used if the image is unavailable */
                /* Full height */
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }

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
            #error_msg{
                color:red; font-weight:bold;
            }
            #error_msg_length{
                color:red; font-weight:bold;
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
                    <h4 class="card-title mt-3 text-center">Create Account in <a class="navbar-brand" href="home" style="color:orange; font-family: 'Barriecito', cursive;"><h2>Calendart  Gallery</h2></a></h4>
                    <p class="text-center">Get started with your free account</p>
                    <!--                    <p>
                                            <a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Login via Twitter</a>
                                            <a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Login via facebook</a>
                                        </p>-->
                    <p class="divider-text">
                        <span class="bg-light">Fields marked with * are required</span>
                    </p>
                    <form id="foid" action="RegisterController" enctype="multipart/form-data" method="post">
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="firstName" class="form-control" placeholder="First name" type="text" >
                        </div> <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="lastName" class="form-control" placeholder="Last name" type="text" >
                        </div> <!-- form-group// -->
                        <label for="username">This name will be displayed in the website:</label>
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                            </div>
                            <input name="username" class="form-control" placeholder="Username* " type="text" required>
                        </div> 
                        <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                            </div>
                            <input name="emailAddress" class="form-control" placeholder="Email address* " type="email" required>
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
                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                            </div>
                            <input id="pass1"  name="password" class="form-control" placeholder="Create password*" type="password" required>
                        </div> <!-- form-group// -->
                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                            </div>
                            <input id="pass2" name="wordpass" class="form-control" placeholder="Repeat password*" type="password" required>
                        </div> <!-- form-group// -->       
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="file" name="photo">
                            <!--                            <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Upload an image to continue.</div>-->
                            <label class="custom-file-label" for="customFile">Choose avatar</label><br>
                        </div> <!-- form-group// -->  
                        <div class="custom-file">

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

        <!--nikos-->
        <script>

            // Add the following code if you want the name of the file appear on select
            $(".custom-file-input").on("change", function () {
                var fileName = $(this).val().split("\\").pop();
                $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
            });
            // /Add the following code if you want the name of the file appear on select


            $(document).ready(function () {
                var $submitBtn = $("#foid button[type='submit']");
                var $passwordBox = $("#pass1");
                var $confirmBox = $("#pass2");
                var $errorMsg = $('<span id="error_msg">Passwords do not match.Try again.</span>');

                // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
                $submitBtn.removeAttr("disabled");

                function checkMatchingPasswords() {
                    if ($confirmBox.val() != "" && $passwordBox.val != "") {
                        if ($confirmBox.val() != $passwordBox.val()) {
                            $submitBtn.attr("disabled", "disabled");
                            $errorMsg.insertAfter($confirmBox);
                        }
                    }
                }

                function resetPasswordError() {
                    if ($passwordBox.val().length >= 5) {
                        $submitBtn.removeAttr("disabled");//to evala meta to if na to valei kai o makis
                    }

                    var $errorCont = $("#error_msg");
                    if ($errorCont.length > 0) {
                        $errorCont.remove();
                    }
                }


                $("#pass2, #pass1")
                        .on("keydown", function (e) {
                            /* only check when the tab or enter keys are pressed
                             * to prevent the method from being called needlessly  */
                            if (e.keyCode == 13 || e.keyCode == 9) {
                                checkMatchingPasswords();
                            }
                        })
                        .on("blur", function () {
                            // also check when the element looses focus (clicks somewhere else)
                            checkMatchingPasswords();
                        })
                        .on("focus", function () {
                            // reset the error message when they go to make a change
                            resetPasswordError();
                        })

            });


            //edw--------------------------------------------------------nato valei o makis
            $(document).ready(function () {
                var $submitBtn = $("#foid button[type='submit']");
                var $passwordBox = $("#pass1");
                var $errorMsgLength = $('<span id="error_msg_length">minimum size 5 characters</span>');

                // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
                $submitBtn.removeAttr("disabled");


                function checkPassword() {

                    if ($passwordBox.val().length < 5) {


                        $errorMsgLength.insertAfter($passwordBox);
                        $submitBtn.attr("disabled", "disabled");

                    }

                }

                function resetPasswordEr() {
                    $submitBtn.removeAttr("disabled");
                    var $errorCont = $("#error_msg_length");
                    if ($errorCont.length > 0) {
                        $errorCont.remove();
                    }
                }


                $(" #pass1")
                        .on("keydown", function (e) {
                            /* only check when the tab or enter keys are pressed
                             * to prevent the method from being called needlessly  */
                            if (e.keyCode == 13 || e.keyCode == 9) {
                                checkPassword();
                            }
                        })
                        .on("blur", function () {
                            // also check when the element looses focus (clicks somewhere else)
                            checkPassword();
                        })
                        .on("focus", function () {
                            // reset the error message when they go to make a change
                            resetPasswordEr();
                        });

            });

            //-----------edw   
        </script>
    </body>
</html>