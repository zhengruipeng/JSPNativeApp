<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/10
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%int rows = 10;
int cols = 5;%>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border:#ccc solid 1px;
            border-collapse: collapse;
            margin:0 auto;
            text-align: center;
            width:80vw;
        }
        tr:nth-child(even){
            background-color: #FEF9FE;
        }
        td{
            border:#ccc solid 1px;
            text-align: center;
        }
    </style>
</head>
<body>
<table>
    <tbody>

    </tbody>
</table>
<script type="text/javascript">
    window.MyApp = {
         rows:<%out.print(rows);%>,
         cols:<%out.print(cols);%>
    };
</script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded",function (){
        const tbody = this.querySelector("table>tbody");
        const fragment = this.createDocumentFragment();
        for(let i=0;i<MyApp.rows;i++){
            const tr = document.createElement("tr");
            for(let j=0;j<MyApp.cols;j++){
                const td = document.createElement("td");
                td.innerHTML = `第${i+1}行第${j+1}列`;
                tr.appendChild(td);
            }
            fragment.appendChild(tr);
        }
        tbody.appendChild(fragment);
    })
</script>
</body>
</html>
