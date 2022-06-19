<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,shujuku.*"%>
<html>
<head>
<meta content="text/html; charset=UTF-8">

</head>
<body  bgcolor="Lightyellow">
<h1 align="center">学生信息查询</h1>
<%
      DBmanger db= new DBmanger();
      String sql="select * from student";
      ResultSet rs=db.executeQuery(sql);
%>
<form>
<table border="1"cellspacing="0"width="790" >
<tr>
<td colspan="7" bgcolor="lightgreen"><br/></td>
</tr>
<tr>
<th width="150">选择/<input type="checkbox" id="qx" onclick="checkAll(this)">全选</th>
<th width="200">学号</th>
<th>姓名</th>
<th>年龄</th>
<th>成绩</th>
<th colspan="2">操作</th>
</tr>
  <% while(rs.next()){%>
<tr>
<td><input type="checkbox" name="jj" value="<%=rs.getString("id")%>"></td>
<td><%=rs.getString("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("age")%></td>
<td><%=rs.getString("jspScore")%></td>
<td><a href="http://localhost:8090/shuju2/update/updatefrom.jsp?id=<%=rs.getString("id")%>&name=<%=rs.getString("name") %>&age=<%rs.getString("age");%>&jspScore=<%=rs.getString("jspScore") %>">修改</a></td>
<td><a href="http://localhost:8090/shuju2/update/deleteHandle.jsp?id=<%=rs.getString("id")%>">删除</a></td>
</tr>
<%} %>
 

<tr>
<td  colspan="7"> <input type="reset" value="批量删除">&nbsp   <a href="http://localhost:8090/shuju2/add/addfrom.jsp">添加学生成绩记录</a></td>
</tr>

<tr>
<td colspan="7" bgcolor="lightgreen"><br/></td>
</tr>
</table>
</form>
<%db.releaseSource(); %>
</body>
</html>