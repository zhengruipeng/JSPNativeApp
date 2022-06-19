<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/10
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
私は利用されてのページです<br />
<%
    String user = request.getParameter("user");
    String pwd = request.getParameter("pwd");

%>
have got the value <%=user%> and <%=pwd%>
</body>
</html>
