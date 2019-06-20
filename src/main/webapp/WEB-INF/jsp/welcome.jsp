<%-- 
    Document   : welcome
    Created on : 17-Jun-2019, 17:55:14
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
        <h1>welcome ${user.username}</h1></br>
<!--        <img src="users/avatar"-->
        
        <a href="addpost">post your art</a></br>
        
        ${post.title}
    </body>
</html>
