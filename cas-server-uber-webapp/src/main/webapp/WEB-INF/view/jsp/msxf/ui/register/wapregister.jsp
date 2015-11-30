<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"
	scope="session" />
<!DOCTYPE HTML>
<html>
<head>
	<meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="icon" type="image/x-icon" href="${ctx}/favicon.ico" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery-ui-1.10.2.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/cas.js"></script>
		<link rel="stylesheet" href="${ctx}/css/amazeui.min.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.flat.min.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.flat.css"/>
        <link rel="stylesheet" href="${ctx}/css/admin.css"/>
        <link rel="stylesheet" href="${ctx}/wapCss/app.css"/>
        <link rel="stylesheet" href="${ctx}/wapCss/myorder.css"/>
    <title>注册-e飞蚁</title>
  <style type="text/css">
          <style type="text/css">
        .title {
            /*color:#D4D4D4;*/
            font-size: 16px;
            font-weight: bold;
            border-bottom: 2px solid #247ba0;
        }

        .am-nav-tabs > li.am-active > a, .am-nav-tabs > li.am-active > a:hover, .am-nav-tabs > li.am-active > a:focus {
            color: #555;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom-color: transparent;
            cursor: default;
            background-color: #8cc5fb;
            color: white;
        }

        .am-active {
            background-color: #8cc5fb;
        }
    </style>
    <script type="text/javascript">

        var flag = false;


        function validForm() {
            if (flag == bool == true) {
                return true;
            }
            return false;
        }


    </script>

    
    <script type="application/javascript" src="${ctx}/js/parsley/parsley.min.js"></script>
    <script type="application/javascript" src="${ctx}/js/parsley/parsley.remote.min.js"></script> 
    <script>
        $(document).ready(function () {
            $('#btnPanel').on('click', function (event) {
                if ($(event.target).attr('id') == 'consumerEnrollBtn') {
                    /*$('#photographerAttention').fadeOut('fast');
                     $('#consumerAttention').fadeIn('slow');*/
                    $('#photographerAttention').fadeOut('fast', function () {
                        $('#consumerAttention').fadeIn('slow');
                    });

                }
                else if ($(event.target).attr('id') == 'photographerEnrollBtn') {
                    $('#consumerAttention').fadeOut('fast', function () {
                        $('#photographerAttention').fadeIn('slow');
                    });

                }
            });
        });
    </script>
</head>
<body>

<%--<div class="hd login">--%>
    <%--<div class="login-wrap">--%>
        <%--<div class="banner"><img src="<c:url value="/scripts/images/login-1.jpg"/>" alt=""/></div>--%>
        <%--<div class="login-form reg-form">--%>
            <%--<form class="am-form" data-parsley-validate id="bigUser" name="bigUser"--%>
                  <%--action="<c:url value="/pc/saveEnrollUser.do"/>" method="post"--%>
                  <%--onkeypress="if(event.keyCode==13||event.which==13){return false;}">--%>
                <%--<fieldset>--%>
                    <%--<div class="mt wh">--%>
                        <%--<h1>注册会员</h1>--%>
                        <%--<span class="link">--%>
                            <%--<p>已是会员，</p>--%>
                            <%--<a class="reg" href="<c:url value="/login"/> ">登录</a>--%>
                        <%--</span>--%>
                    <%--</div>--%>
                    <%--<div class="am-form-group">--%>
                        <%--<input type="text" id="username" name="username"--%>
                               <%--data-parsley-pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$"--%>
                               <%--data-parsley-error-message="请输入正确的手机号"--%>
                               <%--data-parsley-trigger="change"--%>
                               <%--data-parsley-required-message="请输入您的手机号"--%>
                               <%--placeholder="请输入您的手机号"--%>
                               <%--required>--%>
                        <%--<label class="msg-tips" id="usernameMessage" style="display: none">--%>
                            <%--<span class="msg">！该手机号已存在,如果您是该用户，请 <a href="<c:url value="/login"/> ">立刻登录</a></span>--%>
                        <%--</label>--%>
                    <%--</div>--%>
                    <%--<div class="am-form-group">--%>
                        <%--<input class="txt-yzm" type="text" id="verification" minlength="3" placeholder="验证码" required>--%>
                        <%--<a class="btn-yzm" id="verificationButton">获取验证码</a>--%>

                        <div class="help-block">
                            <h5 id="consumerVerificationCodeCheck" style="color: red;display: none">
                                手机验证码输入错误</h5>
                        </div>
                    <%--</div>--%>

                    <%--<div class="am-form-group">--%>
                        <%--<input type="password" id="password" name="password" data-parsley-pattern="^[a-zA-Z0-9]{5,15}$"--%>
                               <%--data-parsley-error-message="密码由6-16位字母或数字组成" placeholder="密码由6-16位字母或数字组成"--%>
                               <%--data-parsley-trigger="change" required="" data-parsley-id="6670">--%>
                    <%--</div>--%>
                    <%--<div class="am-form-group">--%>
                        <%--<input type="password" id="passwordAgain" class="form-control" name="passwordAgain"--%>
                               <%--data-parsley-equalto="#password" data-parsley-equalto-message="两次输入不一致"--%>
                               <%--data-parsley-required="true"--%>
                               <%--data-parsley-required-message="请确认密码"--%>
                               <%--data-parsley-trigger="change"--%>
                               <%--placeholder="请与上面输入的值一致">--%>
                        <%--&lt;%&ndash;<label class="msg-tips" for="">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class="msg">！两次密码输入不一致，请重新输入</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</label>&ndash;%&gt;--%>
                    <%--</div>--%>
                    <%--<div class="am-form-group">--%>
                        <%--<label><input class="checkbox" type="checkbox" checked required/>我已认真阅读并同意<a id="protocol"--%>
                                                                                                     <%--class="agree"--%>
                                                                                                     <%--href="#"--%>
                                                                                                     <%--title="e飞蚁用户注册协议">《e飞蚁用户注册协议》</a></label>--%>
                    <%--</div>--%>
                    <%--<input id="consumerSubmit" type="submit" class="btn btn-primary btn-block"--%>
                           <%--value="注册"--%>
                           <%--style="border-color: #db0c5b;background-color: #db0c5b; display: none"/>--%>
                    <%--<a class="am-btn am-btn-secondary" id="consumerSignin">注 册</a>--%>
                <%--</fieldset>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<header class="am-header custom-header">
                           
                            <!-- //End--chevron-left-->
                            <h1 class="am-header-title">注册</h1>
                            <!-- //End--title-->
                           
                            <!-- //End--chevron-left-->
                            <!--<div class="menu-list">-->
                                <!--<ul class="bd">-->
                                    <!--<li><a href="" title="首页">首页</a></li>-->
                                    <!--<li><a href="" title="分类">分&nbsp;类</a></li>-->
                                    <!--<li class="active"><a href="" title="购物车">购&nbsp;物&nbsp;车</a></li>-->
                                    <!--<li><a href="" title="传承人">传承人</a></li>-->
                                    <!--<li><a href="" title="个人中心">个&nbsp;人&nbsp;中&nbsp;心</a></li>-->
                                <!--</ul>-->
                            <!--</div>-->
                        </header>
<div class="enroll">
    <form data-parsley-validate id="bigUser" name="bigUser"
          action="<c:url value="/pc/saveEnrollUser"/>" method="post"
          onkeypress="if(event.keyCode==13||event.which==13){return false;}">
        <input type="hidden" name="unionid" value="${unionid}">
        <input  type="text" id="backUrl" value="${requestScope.backUrl}" name="backUrl" style="display:none;"/>
        <div class="start">
            <div class="login">
                <ul class="page">
                    <li>
                        <label>手机号</label>
                        <input class="txt" type="text" id="username" name="username"
                               data-parsley-pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$"
                               data-parsley-error-message="请输入正确的手机号"
                               data-parsley-trigger="change"
                               data-parsley-required-message="请输入您的手机号"
                               placeholder="请输入您的手机号"
                               required>
                        <label class="msg-tips" id="usernameMessage" style="display: none">
                            <span class="msg">！该手机号已存在,如果您是该用户，请 
                            <%if(request.getAttribute("backUrl").toString().indexOf("j_spring_cas_security_check")!=-1){
                             String backUrl = request.getAttribute("backUrl").toString();
                             backUrl=backUrl.substring(0, backUrl.indexOf("j_spring_cas_security_check"));
                             request.setAttribute("backUrl",backUrl+"sso.do");}
                             %>
                            <a href="${requestScope.backUrl}">立刻登录</a>
                            
                            </span>
                        </label>
                    </li>
                    <li>
                        <label>验证码</label>
                        <div class="tet1">
                            <span class="span-ipt"><input class="txt1 am-u-sm-7 am-u-end" type="text" id="verification"  placeholder="验证码" data-parsley-required="true" data-parsley-required-message="请输入验证码"></span>
                            <span class="span-btn"><button  class="btn-p-1" id="verificationButton">获取验证码</button></span>
                        </div>
                    </li>
                    <li>
                        <label>设置密码</label>
                        <input class="txt" type="password" id="password" name="password" data-parsley-pattern="^[a-zA-Z0-9]{6,16}$"
                               data-parsley-error-message="密码由6-16位字母或数字组成" placeholder="密码由6-16位字母或数字组成"
                               data-parsley-trigger="change" required="" data-parsley-id="6670">
                    </li>
                    <li>
                        <label>重复密码</label>
                        <input class="txt" type="password" id="passwordAgain" class="form-control" name="passwordAgain"
                               data-parsley-equalto="#password" data-parsley-equalto-message="两次输入不一致"
                               data-parsley-required="true"
                               data-parsley-required-message="请确认密码"
                               data-parsley-trigger="change"
                               placeholder="请与上面输入的值一致">
                    </li>
                </ul>
            </div>
           <div class="err-tips">注册即视为同意<a href="http://passport.efeiyi.com/registerDeal.html">《e飞蚁用户注册协议》</a></div>
            <div class="edit-info">
                <%--<input type="submit" value="注册" class="a">--%>
                <input id="consumerSubmit" type="submit" class="a"
                       value="注册"
                       style="border-color: #db0c5b;background-color: #db0c5b; display: none"/>
                <a class="a" id="consumerSignin">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
            </div>
        </div>
    </form>
</div>
<footer class="bd footer">
    <div class="bd info">
        <a class="icon"></a>

        <div class="txt">中&nbsp;&nbsp;国&nbsp;&nbsp;非&nbsp;&nbsp;遗&nbsp;&nbsp;电&nbsp;&nbsp;商&nbsp;&nbsp;平&nbsp;&nbsp;台
        </div>
        <div class="wechat"></div>
        <div class="txt">关注微信公众号</div>
        <div class="txt">领取好礼</div>
    </div>
    <div class="bd copyright">京ICP备15032511号-1</div>
</footer>
<script>

    var isConsumerCodeRight = false;
    var isVerification = false;

    //验证用户名
    function usernameConfirm() {
        var reg = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
        var username
        username = $("#username").val();

        if (reg.test(username)) {
            $("#usernameConfirmWarning").hide();
            return true;
        } else {
            $("#usernameConfirmWarning").show();
            return false;
        }
    }


    var bool = false;


    function checkUserName(usertype) {

        var username = "";
        if (usertype == "user") {
            username = $("#username").val();
//                $("#name").val($("#username").val());
            $("#phone").val($("#username").val());
        } else {
            username = $("#photographerUsername").val();
            $("#pgphone").val($("#photographerUsername").val());
        }


        if ((username != null && username != "")) {
            jQuery.ajax({
                type: 'post',
                async: false,
                url: '<c:url value="/pc/checkUserName"/>',
                dataType: 'json',
                data: {
                    username: username
                },
                success: function (data) {
//                console.log("检查用户名");
                    if (usertype == "user") {
//                    console.log("user type is user");
                        if (data) {
//                        console.log("用户名已经存在");
                            $("#usernameMessage").show()
                            bool = false;
                        } else {
//                        console.log("用户名不存在");
                            $("#usernameMessage").hide();
                            bool = true;
                        }
                    } else {
//                        console.log("user type is photographer");
                        if (data) {
//                        console.log("用户名已经存在");
                            $("#pgUsernameMessage").text("用户名已存在!");
                            bool = false;
                        } else {
//                        console.log("用户名不存在");
                            $("#pgUsernameMessage").text("");
                            bool = true;
                        }
                    }
                }
            });
        }
//    console.log("检查用户名");
//    console.log(bool)
        return bool;
    }


    var wait = 60;//时间
    function time(o, p) {//o为按钮的对象，p为可选，这里是60秒过后，提示文字的改变
        if (wait == 0) {
            o.removeAttr("disabled");
            o.html("获取验证码");//改变按钮中value的值
//        p.html("如果您在1分钟内没有收到验证码，请检查您填写的手机号码是否正确或重新发送");
            wait = 60;
        } else {
            o.attr("disabled", true);//倒计时过程中禁止点击按钮
            o.html(wait + "秒后重试");//改变按钮中value的值
            wait--;
            setTimeout(function () {
                        time(o, p);//循环调用
                    },
                    1000)
        }
    }

    function sendVerificationCode(phone) {
        $.ajax({
            type: 'get',
            async: false,
            url: '<c:url value="/pc/verification/send"/>',
            dataType: 'json',
            data: {
                phone: phone
            },
            success: function (data) {
                if (data) {
                    console.log("发送验证吗成功");
                } else {
                    console.log("发送验证码失败");
                }
            },
            error: function () {
                console.log("数据获取失败");
            }
        });
    }

    function checkVerificationCode(phone, code, userType) {
        isVerification = false;
        isPhotographerVerification = false;
        jQuery.ajax({
            type: 'get',
            async: false,
            url: '<c:url value="/pc/verification/verify2"/>',
            dataType: 'json',
            data: {
                verificationCode: code,
                phone: phone
            },
            success: function (data) {
                if (data) {
                    if (userType == "user") {
                        isVerification = true;
                        $("#consumerVerificationCodeCheck").css("display", "none");
                    } else {
                        isPhotographerVerification = true;
                        $("#photographerVerificationCodeCheck").css("display", "none");
                    }
//                console.log("验证成功");
                } else {
                    if (userType == "user") {
                        isVerification = false;
                    } else {
                        isPhotographerVerification = false;
                    }
                    console.log("验证失败");
                }
            },
            error: function () {
                console.log("数据获取失败");
            }
        });
    }

    $().ready(function () {

        $("#verificationButton").click(function () {
            if ($("#username").val() != "") {
                if (true) {
                    sendVerificationCode($("#username").val())
                    time($("#verificationButton"));
                }
            }
        });

        $("#verification").blur(function () {
            checkVerificationCode($("#username").val(), $("#verification").val(), "user");
        });


        $("#consumerSignin").click(function () {
            if (isVerification && bool) {
//                if ($("#userRole").val() == "consumer") {
                $("#consumerSubmit").click();
//                } else if ($("#userRole").val() == "photographer") {
//                    $("#bigUser").attr("action", "/pc/saveEnrollPhotographer.do");
//                    $("#consumerSubmit").click();
//                }
            } else if (!isVerification) {
                $("#consumerVerificationCodeCheck").css("display", "block");
            }
        });


        $("#username").blur(function () {


            if ($("#verification").val() != "") {
                checkVerificationCode($("#username").val(), $("#verification").val(), "user");
            }
            checkUserName("user");
        });
    });
</script>
</body>
</html>

