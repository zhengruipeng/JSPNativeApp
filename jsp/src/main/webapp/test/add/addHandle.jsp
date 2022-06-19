<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,pro.mysql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
  String id=request.getParameter("id");
  String name=request.getParameter("name");

  out.println("添加错误");

  if(name != null){
    name=new String(name.getBytes("iso-8859-1"),"utf-8");

    String age=request.getParameter("age");
    String jspScore=request.getParameter("jspScore");
    String sql="insert into student values('"+id+"','"+name+"','"+age+"','"+jspScore+"')";
    out.println(sql);
//    int count=operation.executeUpdate(sql);
  /*  if(count>0)
    {
        response.sendRedirect("http://localhost:8090/shuju2/test/zhu.jsp");
    }else
    {
        out.println("添加错误");
    }*/

  }
%>
</body>
</html>