<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="icon" href="image/timg11.jpg" type="image/x-icon"/>
		<title>登录界面</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login/reset.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login/common.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login/font-awesome.min.css" />
		<script type="text/javascript" src="/statics/js/common.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function() {
				var msg =  "${msg}";
				if (msg!=null&&msg!=""&&msg!=1) {
					$("#code").text(msg).css({
						"color": "red",
						"font-size": "20px",
						"font-family": "楷体"
					})
					
				}
				var code = "${code}";
				if (code!=null&&code!="") {
					$("#code").text(code).css({
						"color": "red",
						"font-size": "20px",
						"font-family": "楷体"
					})
					
				}
				
				$("input[name='username']").blur(function () {
					var username = $(this).val();
					$.post("/user/yzuname",{"username":username} ,
						function (returnData) {
								if (returnData.umsg==null||returnData.umsg=="") {
									$("#username").text("正确用户名！").css({
										"color": "black",
										"font-size": "18px",
										"font-family": "楷体"
									})
									
									document.getElementById("login").disabled=false;
								}else  {
									$("#username").text("错误用户名！").css({
										"color": "red",
										"font-size": "18px",
										"font-family": "楷体"
									})
									document.getElementById("login").disabled=true;
								}
						}
					);
					
				});
				$("input[name='password']").focus(function () {
					$("#code").text("");
				});
				
				$("form").submit(function() {
					var uname = $(".username").val();
					var password = $(".password").val();
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
					if(password == null || password == "") {
						$("#password").text("密码不能为空！").css({
							"color": "red",
							"font-size": "18px",
							"font-family": "楷体",
						})
						return false;
					} else {
						$("#password").text("");
					}
					var code =  $(".code").val();
					if (code==null||code=="") {
						
						$("#code").text("验证码不能为空！").css({
							"color": "red",
							"font-size": "20px",
							"font-family": "楷体"
						})
						return false; 
					}
				
					
				})
			})
		</script>
	</head>

	<body>
	<a href="${pageContext.request.contextPath}/user/toSelfindex">个人</a>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">

					<div class="login_form">
						<div class="login_title">
							登录
						</div>
						<form action="/user/login" method="post">

							<div class="form_text_ipt">
								<input name="username" class="username" type="text" value="${username }" placeholder="用户名/手机号"><br />
								<div id="username">
								</div>
							</div>
							<div class="ececk_warning"><span> </span></div>
							<div class="form_text_ipt" >
								<input name="password" class="password" type="password" placeholder="密码"><br />
								
								<div id="password">
								</div>
							</div>
							<div style="margin-top: 9px;">
								<input  style="height: 35px;margin-top: 15px;margin-left: 28px;font-size: 15px;font-family: 楷体;  color: #666" name="code" class="code"  type="text" placeholder=&nbsp;验证码 >
								<img src="/user/vcode" alt="点我" style=" width: 80px; margin-top: 14px; height: 35px; float: right;  margin-right: 30px;	" />
								<br /><div id="code" align="center"></div>
							</div>
							<!--<div class="ececk_warning"><span>密码不能为空</span></div>-->
							<div class="form_check_ipt">
								<!--自动登录-->
								<!--<div class="left check_left">
									<label><input name="" type="checkbox"> 下次自动登录</label>
								</div>-->
								<div class="right check_right">
									<a href="${pageContext.request.contextPath}/user/toForget">忘记密码</a>
								</div>
							</div>
							<div class="form_btn">
								
								<input type="submit" id="login" value="登录" onmouseover="this.style.backgroundColor='aqua';" onmouseout="this.style.backgroundColor='orangered';" class="form_btn"  class="form_btn" style="background: orangered; font-size: 20px;" /><br />
							</div><br />
							<div class="form_reg_btn">
								<span>还没有帐号？</span>
								<a href="/user/toAddUser">马上注册</a>
							</div>
							<br />
						</form>
						<!--其他登录 包括QQ微信-->
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

		<!-- <div style="text-align:center;">
			<p>更多模板：
				<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
			</p>
		</div> -->
	
	</body>

</html>