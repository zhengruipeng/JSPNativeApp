<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/17
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        input{
            display: block;
            margin:10px;
        }
    </style>
</head>
<body>
<form action="./handle.jsp">
    <input type="text" name="username" />
    <label>男<input type="radio" name="gender" value="male" /></label>
    <label>女<input type="radio" name="gender" value="female" /></label>
    <input type="submit" />
</form>
</body>
</html>
