<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <title>demo2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/style.css">
    <style>
        body input text {

            width: auto;
        }

    </style>
</head>
<body>
<nav class="navbar  navbar-fixed-top" role="navigation" style="background: #e0620d ;padding-top: 3px;height:50px;">
    <div class="container-fluid" style="background: #fff;">
        <div class="navbar-header ">
            <span class="navbar-brand " href="#">ISoul</span>

            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#my-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="#热门话题#">
                <i class="glyphicon glyphicon-search btn_search"></i>
                <!--  <button type="submit" class="btn btn-default">提交</button> -->
            </div>

        </form>

        <div class="collapse navbar-collapse" id="my-navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;Jack.C</a></li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        设置 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">登录</a></li>
                        <li><a href="#">注册</a></li>

                    </ul>
                </li>
            </ul>

        </div>


    </div>
    <hr style="margin: 0;padding: 0;color:#222;width: 100%">
</nav>

<div class="container container_bg">
    <div class="row">
        <div class="col-sm-2"></div>

        <div class="col-sm-6 col-xs-12 my_edit">
            <div class="row" id="edit_form">
                <span class="pull-left" style="margin:15px;">修改个人信息</span>
                <span class="tips pull-right" style="margin:15px;"></span>
                <form method="post" action="${pageContext.request.contextPath}/dt/doAddDT?user_id=${loginUser.userid}" role="form" enctype="multipart/form-data" style="margin-top: 50px;">
                    <p>
                        用户名：<br/><input type="text" name="username" id="username" value="${loginUser.username}">
                    </p>
                    <p>
                        一句话描述自己：<br/>
                        <textarea rows="2" cols="50"  name="signature">${loginUser.signature}</textarea>
                    </p>
                    <p>
                        年龄：<br/><input type="text" name="age" id="age" value="${loginUser.age}">

                    </p>
                    <p>


                        性别：<br/><input type="radio" name="sex" <c:if test="${loginUser.sex==1}">value="1" checked="checked"</c:if>>男
                                <input type="radio" name="sex" value="2" <c:if test="${loginUser.sex==2}">value="1" checked="checked"</c:if>>女
                    </p>
                    <p>
                        联系电话：<br/><input type="text" name="phone" id="phone" value="${loginUser.phone}">
                    </p>
                    <p>
                        email:<br/> <input type="email" name="email" id="email" value="${loginUser.email}">
                    </p>
                    <p></p>
                            <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
                            <button type="submit" id="send" class="btn btn-default pull-right disabled">确认修改</button>
                            <button type="button"  onclick="window.history.go(-1)" class="btn-info">返回</button>

                </form>
            </div>


            <div class="row item_msg" style="height: auto;background: white" >

                <%--<div class="col-sm-12 col-xs-12 message" style="height: auto" >
                     <img src="${pageContext.request.contextPath}/statics/images/img/icon.png" class="col-sm-2 col-xs-2" style="border-radius: 50%">
                     <div class="col-sm-10 col-xs-10">
                        <span style="font-weight: bold;">${loginUser.username}</span>
                        <br>
                         <small class="date" style="color:#999">1分钟前</small>
                        <div class="msg_content">happy day!
                         <img class="mypic" src="${pageContext.request.contextPath}/statics/images/img/bg_1.jpg" >
                         </div>

                     </div>--%>
                <c:forEach items="${dtList}" var="dt">
                    <%--<div class="col-sm-12 col-xs-12 message" >--%>
                    <img src="${pageContext.request.contextPath}/statics/images/img/icon.png" class="col-sm-2 col-xs-2"
                         style="border-radius: 50%">
                    <div class="col-sm-10 col-xs-10">
                        <span style="font-weight: bold;">${dt.username}</span>
                        <br>
                        <small class="date" style="color:#999">
                            <fmt:formatDate value="${dt.dtcreatDate}" type="both"></fmt:formatDate>
                        </small>
                        <div class="msg_content">${dt.dtcontent}
                            <img class="mypic" src="${pageContext.request.contextPath}/statics/images/img/bg_1.jpg">
                            <br><a href="">#${dt.topic.title}#</a>
                        </div>

                    </div>
                    <%-- </div>--%>
                </c:forEach>


            </div>


        </div>


        <div class="col-sm-3 col-xs-12 part_right">
            <div class="row text-center inform">
                <img src="${pageContext.request.contextPath}/statics/images/img/icon.png">
                <h4 style="font-weight: bold;">${loginUser.username}</h4>
                <div class="col-sm-12 my_inform">
                    <div class="col-sm-4 col-xs-4">
                        <div>${loginUser.like}</div>
                        <div class="sort">关注</div>

                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>${loginUser.fans}</div>
                        <div class="sort">粉丝</div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>没实现</div>
                        <div class="sort">博客</div>
                    </div>
                </div>
                <div class="col-sm-12 text-center" style="padding: 10px"><a href="${pageContext.request.contextPath}/user/toUpdate">编辑资料</a></div>
            </div>
            <div class="row part_hot">
                <div class="col-sm-12">
                    <span class="pull-left" style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
                    <span class="pull-right" style="padding: 10px;">换话题</span>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">
                <c:forEach items="${topicPage.list}" var="topics">

                    <div class="col-sm-12 item_hot">
                        <span class="pull-left"><a href="${pageContext.request.contextPath}/dt/doListByTopicId?tpid=${topics.tpid}">#${topics.title}#</a></span>
                        <span class="pull-right item_num">${topics.hot}</span>
                    </div>
                </c:forEach>
                <hr style="margin: 0;padding: 0;width: 100%">

                <div class="col-sm-12 text-center" style="padding: 10px"><a href="#">查看更多</a></div>

            </div>

        </div>
    </div>


</div>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {


    })
</script>
</body>
</html>