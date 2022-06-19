<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/21
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>欢迎您，
    <%
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        out.println(name);
        out.println("先生");
    %>
</h1>
</body>
</html>
