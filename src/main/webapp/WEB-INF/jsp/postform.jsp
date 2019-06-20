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
        <form action="insertpost" enctype="multipart/form-data" method="post">
            <input type="text" name="title" placeholder="insert post title"></br>
            <textarea rows = "5" cols = "50" name = "description">
            Enter your description
            </textarea></br>  
            <input type="file" name="photo1">

            <input type="submit">
            </body>
            </html>
