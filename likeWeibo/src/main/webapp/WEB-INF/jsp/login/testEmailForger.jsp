<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/1/21
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
</head>
<body>
    邮箱：<input type="text" name="email" ><br/>
    验证码：<input type="text" name="yzm" ><input type="button" value="获取验证码" id="getVcode"><br>
    <input type="button" value="提交" id="userSub">

</body>
<script type="text/javascript">
    $(function () {
        //获取验证码
        var emailCode="";
        $("#getVcode").click(function () {
            var email=$("input[name='email']").val();

            $.post("${pageContext.request.contextPath}/user/getEmailVcode",{"email":email},function (result) {
                alert(result);
                   emailCode=result;

            });
        });
        $("#userSub").click(function () {
            var userCode=$("input[name='yzm']").val();
            if (userCode==emailCode){
                alert("验证成功！");
            } else{
                alert("验证失败");
            }
        });

    })
</script>
</html>
