<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>设置新密码</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/common.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/1.12.4/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/login/common.js"></script>
		
	
		<script type="text/javascript">
			
			$(function() {
				
				$("form").submit(function() {
					var password = $(".password").val();
					var pwd = $(".pwd").val();
					
				
					
					
					
					
					if(password == null || password == "") {
						$("#password").text("密码不能为空！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体",
						})
						return false;
					} else if (password.length<4||password.length>20) {
						$("#password").text("密码长度不符合要求 4-20 位！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体",
						})
						return false;
					} 
					else {
						$("#password").text("");
					}

					 if(pwd == null || pwd == "") {
						$("#pwd").text("请再次输入密码！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体",
						})
						return false;
					} else if (pwd!=password) {
						$("#pwd").text("两次密码不一致！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体",
						})
						return false;
					} 
					
					 alert("保管好密码！去登录！");
				})
			
			})
			
		</script>


	</head>

	<body>
		<div class="wrap login_wrap">
			<div class="content">

				<div class="logo"></div>

				<div class="login_box">

					<div class="login_form">
						<div class="login_title">
							设置新密码！
						</div>
						<form action="userLogin.action?param=savaToLogin" method="post">

							
							
							
							<div class="form_text_ipt">
							<input type="hidden" name="username" value="${user.username }" />
							<input type="hidden" name="nickname" value="${user.nickname }" />
							<input type="hidden" name="phone" value="${user.phone }" />
							<input type="hidden" name="userid" value="${user.userid }" />
								<input name="password" type="password" class="password" placeholder="请输入新密码"><br />
								<div id="password">
								</div>
							</div>
							<div class="form_text_ipt">
								<input name="repassword" class="pwd" type="password" placeholder="再次输入密码">
								<br />
								<div id="pwd">
								</div>
							</div>
							<!--验证码-->
							<!--<div class="form_text_ipt">
								<input name="code" type="text" placeholder="验证码">
							</div>
							<div class="ececk_warning"><span>验证码不能为空</span></div>-->

							<div class="form_btn" >
								<!--<button type="button" onclick="javascript:window.location.href='#'">注册</button>-->
								<input type="submit" value="保存" onmouseover="this.style.backgroundColor='aqua';" onmouseout="this.style.backgroundColor='orangered';" class="form_btn"  class="form_btn" style="background: orangered; font-size: 20px;" /><br />
							</div><br />
							
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

		<div style="text-align:center;">
			
			
		</div>
	</body>

</html>