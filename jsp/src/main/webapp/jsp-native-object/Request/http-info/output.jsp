<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/17
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  out.println(request.getRemoteAddr() + "<br />");
  out.println(request.getRemoteHost() + "<br />");
  out.println(request.getServerName() + "<br />");
  out.println(request.getServerPort() + "<br />");
  out.println(request.getProtocol() + "<br />");
  out.println(request.getMethod() + "<br />");

  out.println(request.getScheme()+"://"
          +request.getServerName()
          +":"+request.getServerPort()
          + request.getContextPath()
          +request.getServletPath()
  );
%>
</body>
</html>
