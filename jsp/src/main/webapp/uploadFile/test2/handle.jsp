<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/29
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="p1.test.post" %>
<%@ page import="java.util.Enumeration" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  out.println("getParameterNames");
  out.println(request.getMethod());
//  String name = new String((request.getParameter("name")).getBytes("UTF-8"),"UTF-8");

  out.println(request.getParameter("name"));
  out.println(request.getParameter("val"));
  out.println("<hr />");
  out.println("<br />");
  Enumeration en = request.getParameterNames();
  while(en.hasMoreElements()){
    out.println("123");
    out.println(en.nextElement()+"<br />");
  }
  out.println("<hr />");
  out.println("<br />");

  Enumeration<String> headerNames = request.getHeaderNames();
  while(headerNames.hasMoreElements()) {
    String headerName = headerNames.nextElement();
    // 获取每个请求、及其对应的值
    out.println(headerName + "-->" + request.getHeader(headerName) + "<br/>");
  }
/*  try{
    p1.test.post p = new p1.test.post();
    p.doPost(request,response);
  }catch (Exception e){

  }*/
%>
</body>
</html>
