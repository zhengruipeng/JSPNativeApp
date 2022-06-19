<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/17
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  out.println(request.getParameter("username"));
  out.println(request.getParameter("gender"));
  String gender = (String)request.getParameter("gender");
  if(gender.equals("male")){
%>
  <jsp:forward page="./output.jsp">
    <jsp:param name="gender" value="<%=gender%>" />
  </jsp:forward>
<%
  }else{
%>
  <jsp:forward page="./output.jsp">
    <jsp:param name="gender" value="<%=gender%>" />
  </jsp:forward>
  <%
  }
%>
</body>
</html>
