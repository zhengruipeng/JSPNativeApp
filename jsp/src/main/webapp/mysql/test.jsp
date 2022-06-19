<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/24
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pro.mysql.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
//    new test();
    try {
        operation.connect();
        ResultSet rs = operation.select("select * from student");
        while(rs.next()){
            int id  = rs.getInt("id");
            String sname = rs.getString("sname");
            String sdept = rs.getString("sdept");

            // 输出数据
            out.println("ID: " + id);
            out.println(", sname: " + sname);
            out.println(", sdept: " + sdept);
            out.println("<br />");
        }
        operation.closeAllStatus();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
