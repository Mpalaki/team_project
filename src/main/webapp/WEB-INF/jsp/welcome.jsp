<%-- 
    Document   : welcome
    Created on : 17-Jun-2019, 17:55:14
    Author     : Makis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <a href="getLastPosts">last posts</a></br>

        <table>
            <tr>
                <th>title</th>
                <th>description</th>
                <th>idpost</th>

            </tr>
            <c:forEach var = "l" items="${posts}">
                <tr>
                    <td>${l.title}</td>
                    <td>${l.description}</td>
                    <td>${l.idpost}</td>

                </tr>

            </c:forEach>
        </table>



    </body>
</html>
