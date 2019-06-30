<%-- 
    Document   : editpostjsp
    Created on : 28-Jun-2019, 14:48:59
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
        <form action="updatepost" enctype="multipart/form-data" method="post">
            <input type="text" name="title" placeholder="${post.title}"></br>
            <input type=hidden id="idpost" name="idpost" value="${post.idpost}">
            <textarea rows = "5" cols = "50" name = "description">
            ${post.description}
            </textarea></br>  
            <input type="file" name="photo1" value="${post.photo}">

            <input type="submit">
            </body>
            </html>
