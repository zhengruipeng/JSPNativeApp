<%--/*
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/24
  Time: 14:28
  To change this template use File | Settings | File Templates.*/
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pro.mysql.test" %>
<%
    String url = request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);
    StringBuilder sb = new StringBuilder();
    sb.append("124").append(url);
    String s = sb.toString();
    out.println(s.substring(0,s.length()-1));
    String str = "1,2,344,5";
    String[] arr = str.split(",");
    for(String val:arr){
        out.println(val+",");
    }
    new test();
//    str.last
//    out.println(request.getContextPath());
%>
