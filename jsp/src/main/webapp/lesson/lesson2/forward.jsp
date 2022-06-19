<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/10
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%=123123%>
<%
    System.out.println("我是跳转之前的页面，你在服务器能够看到我");
%>
<jsp:forward page="beClodedInline.jsp">
    <jsp:param name="user" value="admin" />
    <jsp:param name="pwd" value="1234" />

</jsp:forward>
</body>
</html>
