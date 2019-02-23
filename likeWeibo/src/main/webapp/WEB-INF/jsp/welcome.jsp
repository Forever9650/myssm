<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/1/14
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    登录成功，欢迎
    <div>
        <table>
            <tr>
                <th>用户名</th>
                <th>密码</th>
                <th>用户昵称</th>
            </tr>
            <tr>
                <c:forEach items="${ulist}" var="user">
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.nickname}</td>
                </c:forEach>
            </tr>
        </table>
    </div>
</body>
</html>
