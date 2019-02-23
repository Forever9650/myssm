<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册界面</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/statics/css/login/reset.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/statics/css/login/common.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/statics/css/login/font-awesome.min.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/statics/js/common.js"></script>


    <script type="text/javascript">
        $(function () {
            $("input[name='username']").blur(function () {
                var username = $(this).val();
                $.post("doAjaxLogin.action", {
                    "username": username
                }, function (returnData, status) {
                    if ("success" == status) {
                        if (returnData) {
                            $("#username").text("用户名已存在，不可再次注册！").css({
                                "color": "red",
                                "font-size": "18px",
                                "font-family": "楷体"
                            })
                            document.getElementById("register").disabled = true;
                        } else {
                            $("#username").text("用户名可使用！").css({
                                "color": "black",
                                "font-size": "18px",
                                "font-family": "楷体"
                            })
                            document.getElementById("register").disabled = false;
                        }
                    }
                }, "json");

            });

            $("input[name='phone']").blur(function () {
                var phone = $(this).val();
                $.post("doAjaxLogin.action", {
                    "phone": phone
                }, function (returnData, status) {
                    if ("success" == status) {
                        if (returnData) {
                            $("#phone").text("该手机号已被注册，不可再次注册！").css({
                                "color": "red",
                                "font-size": "18px",
                                "font-family": "楷体"
                            })
                            document.getElementById("register").disabled = true;
                        } else if (!testPhone.test(phone)) {
                            $("#phone").text("手机号格式不正确！").css({
                                "color": "red",
                                "font-size": "18px",
                                "font-family": "楷体"
                            })
                        } else {
                            $("#phone").text("手机号可使用！").css({
                                "color": "black",
                                "font-size": "18px",
                                "font-family": "楷体"
                            })
                            document.getElementById("register").disabled = false;
                        }
                    }
                }, "json");

            });

            //手机号
            var testPhone = /^1[34578]\d{9}$/;

            $("form").submit(function () {
                var uname = $(".username").val();
                var password = $(".password").val();
                var pwd = $(".pwd").val();
                var phone = $(".phone").val();

                if (uname == null || uname == "") {
                    $("#username").text("用户名不能为空！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体"
                    })
                    return false;
                } else if (uname.length > 20 || uname.length < 5) {
                    $("#username").text("用户名长度不符合要求！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体"
                    })
                    return false;

                } else {
                    $("#username").text("");
                }

                if (phone == null || phone == "") {
                    $("#phone").text("手机号不能为空！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体"
                    })
                    return false;
                } else if (!testPhone.test(phone)) {
                    $("#phone").text("手机号格式不正确！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体"
                    })
                    return false;
                } else {
                    $("#phone").text("");
                }

                if (password == null || password == "") {
                    $("#password").text("密码不能为空！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体",
                    })
                    return false;
                } else if (password.length > 20 || password.length < 4) {
                    $("#password").text("密码长度不符合要求 4-20位！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体",
                    })
                    return false;

                } else {
                    $("#password").text("");
                }

                if (pwd == null || pwd == "") {
                    $("#pwd").text("请再次输入密码！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体",
                    })
                    return false;
                } else if (pwd != password) {
                    $("#pwd").text("两次密码不一致！").css({
                        "color": "red",
                        "font-size": "18px",
                        "font-family": "楷体",
                    })
                    return false;
                }

            })
            //头像部分点击
            $("#touxiangshezhi").click(function () {
                $("#touxiangwenjian").click();
            });
        })
    </script>


</head>

<body>
<div class="wrap login_wrap">
    <div class="content">

        <div class="logo"></div>

        <div class="login_box">

            <div class="login_form">
                <div class="login_title">注册</div>
                <form action="/user/addUser" method="post" enctype="multipart/form-data">

                    <div class="form_text_ipt">
                        <input name="username" type="text" class="username"
                               placeholder="用户名 (5-20位)"> <br/>
                        <div id="username"></div>
                    </div>
                    <%----%>
                    <div class="form_text_ipt">
                        <input name="phone" class="phone" type="text" placeholder="手机号">
                        <br/>
                        <div id="phone"></div>
                    </div>
                    <div class="ececk_warning">
                        <span>手机号/邮箱不能为空</span>
                    </div>
                    <div class="form_text_ipt">
                        <input name="password" type="password" class="password"
                               placeholder="密码 (4-20位)"><br/>
                        <div id="password"></div>
                    </div>
                    <div class="ececk_warning">
                        <span>密码不能为空</span>
                    </div>
                    <div class="form_text_ipt">
                        <input name="repassword" class="pwd" type="password"
                               placeholder="重复密码 (4-20位)"> <br/>
                        <div id="pwd"></div>
                    </div>
                    <div class="ececk_warning">
                        <span>密码不能为空</span>
                    </div>

                    <div class="form_text_ipt">
                        <input type="email" name="email" class="email" placeholder="电子邮箱（非必填字段）">
                        <br/>
                        <div id="email"></div>
                    </div>
                    <div class="form_text_ipt" style="height: 60px;">
                        <img src="${pageContext.request.contextPath}/statics/images/loginImage/touxiangshezhi.jpg" width="50px"height="50px" id="touxiangshezhi">
                        头像 <input type="file" name="a_headImage" id="touxiangwenjian" style="display: none"> *非必填字段
                    </div>
                    <!--验证码-->
                    <!--<div class="form_text_ipt">
                            <input name="code" type="text" placeholder="验证码">
                        </div>
                        <div class="ececk_warning"><span>验证码不能为空</span></div>-->

                    <div class="form_btn">
                        <!--<button type="button" onclick="javascript:window.location.href='#'">注册</button>-->
                        <input type="submit" id="register" value="注册"
                               onmouseover="this.style.backgroundColor='aqua';"
                               onmouseout="this.style.backgroundColor='orangered';"
                               class="form_btn" class="form_btn"
                               style="background: orangered; font-size: 20px;"/><br/>
                    </div>
                    <br/>
                    <div class="form_reg_btn">
                        <span>已有帐号？</span> <a href="/user/toLoginYa">马上登录</a><br/>
                    </div>
                    <br/>
                </form>
                <!--其他登录方法-->
                <!--<div class="other_login">
                        <div class="left other_left">
                            <span>其它登录方式</span>
                        </div>
                        <div class="right other_right">
                            <a href="#"><i class="fa fa-qq fa-2x"></i></a>
                            <a href="#"><i class="fa fa-weixin fa-2x"></i></a>
                            <a href="#"><i class="fa fa-weibo fa-2x"></i></a>
                        </div>
                    </div>-->
            </div>
        </div>
    </div>
</div>

<div style="text-align: center;">

    <!--<p>更多模板：
            <a href="http://www.mycodes.net/" target="_blank">源码之家</a>
        </p>-->
</div>
</body>

</html>