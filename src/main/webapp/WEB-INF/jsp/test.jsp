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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>test</h1>
        <form action="RegisterController" enctype="multipart/form-data" method="post">
             <input type="text" name="firstName" placeholder="first name"></br>
             <input type="text" name="lastName" placeholder="last name"></br>
             <input type="text" name="username" placeholder="username"></br>
             <input type="password" name="password" placeholder="password"></br>
             <input type="password" name="wordpass" placeholder="repeat password"></br>
             <input type="text" name="emailAddress" placeholder="email address"></br>
             <input type="text" name="telephone" placeholder="telephone number"></br>
             <input type="file" name="photo"></br>
                
            <input type="submit">
    </body>
</html>
