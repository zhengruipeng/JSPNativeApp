<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,pro.mysql.*"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body bgcolor="Lightyellow">
<h1 align="center">学生信息添加</h1>
<form action="addHandle.jsp" method="post">

    <table border="0" width="800" >
    <td colspan="8" bgcolor="Lightgreen"><br/></td>
    </table>

    <table border="0">
    <td><br/></td>
    </table>

    <table border="1"  cellspacing="0" width="700">
        <tr>
            <th width="100">学号：</th>
            <td><input type="textbox" name="id"></td>
        </tr>

        <tr>
        <th>姓名：</th>
        <td><input type="textbox" name="name"></td>
        </tr>

        <tr>
        <th>年龄：</th>
        <td><input type="textbox" name="age"></td>
        </tr>

        <tr>
        <th>成绩：</th>
        <td><input type="textbox" name="jspScore"></td>
        </tr>

        <tr>
        <td colspan="7"><input type="submit" value="修改"><input type="reset" value="重置">  &nbsp <a href="http://localhost:8090/test/zhu.html">返回查询页面</a></td>
        </tr>

    </table>

</form>
</body>
</html>
