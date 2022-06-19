<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/10
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    int visiteNum = 0;
%>
你已经访问过：
<%
    out.println(++visiteNum);
%>
次
</body>
</html>
