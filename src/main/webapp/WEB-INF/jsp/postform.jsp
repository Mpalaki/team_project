<%-- 
    Document   : postform
    Created on : 19-Jun-2019, 14:42:04
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
        <form action="insertpost" method="post">
            <input type="text" name="title" placeholder="insert post title"></br>
            <textarea rows = "5" cols = "50" name = "description">
            Enter your name
            </textarea></br>
            <input type="checkbox" name="for sale" placeholder="username"></br>
            Is it for sale? <input type="password" name="password" ></br>
            <input type="price" name="price" placeholder="enter price"></br>

            <input type="submit">
            </body>
            </html>
