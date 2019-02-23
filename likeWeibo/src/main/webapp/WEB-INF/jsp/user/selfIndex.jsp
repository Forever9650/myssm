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
                <span class="pull-left" style="margin:15px;">分享身边新鲜事</span>
                <span class="tips pull-right" style="margin:15px;"></span>
                <form method="post" action="${pageContext.request.contextPath}/dt/doAddDT?user_id=${loginUser.userid}" role="form" enctype="multipart/form-data" style="margin-top: 50px;">
                    <div class="form-group">
                        <div class="col-sm-12">

                            <%--<div contentEditable="true" id="content"   class="form-control " ></div>--%>
                            <textarea rows="6" cols="70" class="text-area" name="dtcontent"></textarea>
                        </div>
                        <div class="col-sm-12" style="margin-top: 12px;">
                            <span class="emoji">表情</span>

                            <span class="pic">图片	</span>
                            权限范围：<select name="dtStatus" class="form-select-button">
                            <option value="0">公开</option>
                            <option value="2">仅自己</option>
                        </select>
                            热门话题：<select name="topic_id" >
                            <option value="0">不添加</option>
                            <c:forEach items="${tpList}" var="topics">
                                <option value="${topics.tpid}">${topics.title}</option>
                            </c:forEach>
                        </select>
                            <span>
							    		<input type="file" name="dtPic" class="select_Img" style="display: none">
							    	    <img class="preview" src="">
							    	</span>


                            <div class="myEmoji">
                                <ul id="myTab" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#set" data-toggle="tab">
                                            预设
                                        </a>
                                    </li>
                                    <li><a href="#hot" data-toggle="tab">热门</a></li>

                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="set">
                                        <div class="emoji_1"></div>

                                    </div>
                                    <div class="tab-pane fade" id="hot">
                                        <div class="emoji_2"></div>
                                    </div>

                                </div>
                            </div>
                            <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
                            <button type="submit" id="send" class="btn btn-default pull-right disabled">发布</button>
                        </div>
                    </div>
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
                    <span class="pull-right" style="padding: 10px;"><a id="changeTopic">换话题</a></span>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">
                <div id="topicShow">

                <c:forEach items="${topicPage.list}" var="topics">

                    <div class="col-sm-12 item_hot">
                        <span class="pull-left"><a href="${pageContext.request.contextPath}/dt/doListByTopicId?tpid=${topics.tpid}">#${topics.title}#</a></span>
                        <span class="pull-right item_num">${topics.hot}</span>
                    </div>
                </c:forEach>
                </div>
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
            var oldPn=1;
        $("#changeTopic").click(function () {
            alert(oldPn);
            var pageNo=++oldPn;
           $.post("${pageContext.request.contextPath}/user/refushTopic",{"pageNo":pageNo},function (result) {
                var html ="";
                alert(result.tList.length)

                for (var i =0;i<result.tList.length;i++){
                    /*html +="<div class='col-sm-12 item_hot'> <span class='pull-left'><a href='${pageContext.request.contextPath}/dt/doListByTopicId?tpid="+result.tList[i].tpid+"'>#"+result.tList[i].title+"#</a></span><span class='pull-right item_num'>"+result.tList[i].hot+"</span></div>";*/
                    html +=" <div class=\"col-sm-12 item_hot\">\n" +
                        "                        <span class=\"pull-left\"><a href=\"${pageContext.request.contextPath}/dt/doListByTopicId?tpid=${topics.tpid}\">#"+result.tList[i].title+"#</a></span>\n" +
                        "                        <span class=\"pull-right item_num\">${topics.hot}</span>\n" +
                        "                    </div>";

                }
                $("#topicShow").html(html);
            });
        });
        $("#send").click(function () {
            var dtcontent = $("textarea[name='dtContent']").val();
            alert(dtcontent);
        });
        /* $("#content").keyup(function(){

             //判断输入的字符串长度
             var content_len = $("#content").text().replace(/\s/g,"").length;

             $(".tips").text("已经输入"+content_len+"个字");


             if(content_len==0){
                 // alert(content);
                 $(".tips").text("");
                $("#send").addClass("disabled");
                 return false;
             }else{
                 $("#send").removeClass("disabled");
             }
         });*/


        $(".pic").click(function () {

            $(".select_Img").click();


        })

        // 	function confirm(){

        // 		var r= new FileReader();
        // f=$(".select_Img").files[0];
        // r.readAsDataURL(f);
        // r.onload=function(e) {
        // 	$(".preview").src=this.result;

        // };
        // 	}

        //点击按钮发送内容
        $("#send").click(function () {

            // var myDate = new Date();

            //   var min = myDate.getMinutes();

            //   var time = min-(min-1);

            //   //alert(time);

            var content = $("#content").html();

            //判断选择的是否是图片格式
            var imgPath = $(".imgPath").text();
            var start = imgPath.lastIndexOf(".");
            var postfix = imgPath.substring(start, imgPath.length).toUpperCase();


            if (imgPath != "") {

                if (postfix != ".PNG" && postfix != ".JPG" && postfix != ".GIF" && postfix != ".JPEG") {
                    alert("图片格式需为png,gif,jpeg,jpg格式");
                } else {
                    $(".item_msg").append("<div class='col-sm-12 col-xs-12 message' > <img src='${pageContext.request.contextPath}/statics/images/img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>Jack.C</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>" + content + "<img class='mypic' onerror='this.src='img/bg_1.jpg' src='file:///" + imgPath + "' ></div></div></div>");
                }
            } else {
                $(".item_msg").append("<div class='col-sm-12 col-xs-12 message' > <img src='${pageContext.request.contextPath}/statics/images/img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>Jack.C</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>" + content + "</div></div></div>");
            }

        });

        //添加表情包1
        for (var i = 1; i < 60; i++) {

            $(".emoji_1").append("<img src='${pageContext.request.contextPath}/statics/images/img/f" + i + ".png' style='width:35px;height:35px' >");
        }
        //添加表情包2
        for (var i = 1; i < 61; i++) {

            $(".emoji_2").append("<img src='${pageContext.request.contextPath}/statics/images/img/h" + i + ".png' style='width:35px;height:35px' >");
        }


        $(".emoji").click(function () {

            $(".myEmoji").show();

            //点击空白处隐藏弹出层
            $(document).click(function (e) {

                if (!$("#edit_form").is(e.target) && $("#edit_form").has(e.target).length === 0) {

                    $(".myEmoji").hide();
                }
            });


        });

        //将表情添加到输入框
        $(".myEmoji img").each(function () {
            $(this).click(function () {
                var url = $(this)[0].src;

                $('#content').append("<img src='" + url + "' style='width:25px;height:25px' >");

                $("#send").removeClass("disabled");
            })
        })

        //放大或缩小预览图片
        $(".mypic").click(function () {
            var oWidth = $(this).width(); //取得图片的实际宽度
            var oHeight = $(this).height(); //取得图片的实际高度

            if ($(this).height() != 200) {
                $(this).height(200);
            } else {
                $(this).height(oHeight + 200 / oWidth * oHeight);

            }

        })

    })
</script>
</body>
</html>