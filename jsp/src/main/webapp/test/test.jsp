<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/05/29
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="handle.jsp" method="post" enctype="multipart/form-data">
    <input type="text" name="name" value="123" />
    <input type="text" name="val" value="4312" />
    <input type="submit" />
    <input type="submit" />
</form>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded",function (){
        const form = this.forms[0];
        const submit = form.querySelector("input[type='submit']");
        submit.onclick = function (ev){
            ev.preventDefault();

            let formData = new FormData(form);
            console.log(formData.get("name"));
            console.log(formData.get("val"));
             /*  fetch("./handle.jsp",{
                   // body:"name=1234&val=4312",
                   body:formData,
                   method:"POST",
                   headers:new Headers({
                       "content-type":"application/x-www-form-urlencoded",
                   })
               })*/
             fetch("./handle.jsp",{
                body:formData,
                method:"POST",
                headers:new Headers({
                    "content-type":`multipart/form-data; boundary=----WebKitFormBoundaryeqVRvL7enEiDNo5h`,
                    "accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
                })
            })
                 .then(response => response.text())
                .then(function (text){
                    let div = document.createElement("div");
                    let shadowRoot = div.attachShadow({mode:"open"});
                    shadowRoot.innerHTML = text;
                    document.body.appendChild(div);
                });
        }

    })
</script>
</body>
</html>
