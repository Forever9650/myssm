<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	<style type="text/css">
		body {
		font-family: 楷体;
		font-size: 18px;
	
}
	</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>忘记密码</title>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login/common.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login/font-awesome.min.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/common.js"></script>
		
		
		<script type="text/javascript">
			$(function() {
					var msg = "${msg}";
					if (msg.length>0) {
						alert(msg);
						$("input[name='username']").onFocus;
					}
				$("form").submit(function() {
					var uname = $(".username").val();
					var phone = $(".phone").val();
					if(uname == null || uname == "") {
						$("#username").text("用户名不能为空！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体"
						})
						return false;
					} else {
						$("#username").text("");
					}
					
					//手机号
					var testPhone = /^1[34578]\d{9}$/;
					if (phone==null||phone=="") {
						$("#phone").text("手机号不能为空！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体"
						})
						return false;
					}else if (!testPhone.test(phone)) {
						$("#phone").text("手机号格式不正确！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体"
						})
						return false;
					} else{
						$("#phone").text("");
					} 
					
					
					
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
							找回密码
						</div>
						<form action="userLogin.action?param=testUser" method="post">

							<div class="form_text_ipt">
								<input name="username" class="username" type="text" placeholder="用户名"><br />
								<div id="username">
								</div>
							</div>
							<div class="form_text_ipt">
								<input name="phone" class="phone" type="text" placeholder="注册手机号"><br />
								<div id="phone">
								</div>
							</div>
							<div class="ececk_warning"><span> </span></div>
							<div style="padding-left: 27px ;">
							<input type="button"  value="返回" class="form_btn" onclick="window.history.go(-1)" />
							</div >
							<div class="form_btn">
								<input type="submit" value="验证身份" onmouseover="this.style.backgroundColor='aqua';" onmouseout="this.style.backgroundColor='orangered';" class="form_btn"  class="form_btn" style="background: orangered; font-size: 20px;" /><br />
							</div><br />
							<div class="form_reg_btn">
								<span>还有其他问题？</span>
								<a href="mailto:252129650@qq.com">联系我们</a>
							</div>
							<br />
						</form>
						
					</div>
				</div>
			</div>
		</div>

		
	</body>

</html>