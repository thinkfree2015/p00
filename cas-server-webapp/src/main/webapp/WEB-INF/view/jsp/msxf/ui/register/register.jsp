﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"
	scope="session" />
<!DOCTYPE HTML>
<html>
<head>
        <link rel="icon" type="image/x-icon" href="${ctx}/favicon.ico" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery-ui-1.10.2.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/amazeui.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/alert.js"></script>
		<script type="text/javascript" src="${ctx}/js/cas.js"></script>
		<link rel="stylesheet" href="${ctx}/css/amazeui.min.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.flat.min.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.flat.css"/>
        <link rel="stylesheet" href="${ctx}/css/admin.css"/>
        <link rel="stylesheet" href="${ctx}/css/app.css"/>
        <link rel="stylesheet" href="${ctx}/css/myorder.css"/>
    <title>注册-e飞蚁</title>


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
        .footer .authentication {background: #000;text-align: center;padding:20px 0}
        .footer .authentication a {display: inline-block;margin:0 20px}
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

<div class="header wh">
    <div class="hd">
        <div class="logo"><a class="icon" href="http://www.efeiyi.com" title="e飞蚁-爱非遗"></a></div><!--
        <div class="nav">
            <ul>
                
                    <li class="">
                        
                            <a class="cur" href="http://www.efeiyi.com" title="首页">电商</a>
                        
                        
                    </li>
                

                
                    <li class="">
                        
                            <a class="" href="#" title="工艺">工艺</a>
                        
                        
                    </li>
                
                <li class="">
                        
                            <a class="" href="http://master.efeiyi.com/" title="大师">大师</a>
                        
                        
                    </li>
                
                
                
            </ul>
        </div>
    --></div>
</div>

<div class="hd login">
    <div class="login-wrap">
        <div class="banner" id="login-b">
         <ul>
           <li><img src="${ctx}/images/login-1.jpg" alt=""/></li>
           <li><img src="${ctx}/images/login-2.jpg" alt=""/></li>
           <li><img src="${ctx}/images/login-3.jpg" alt=""/></li>
          </ul>
           <!--<img src="${ctx}/images/login-1.jpg" alt=""/>
        --></div>
        <div class="login-form reg-form">
            <form class="am-form" data-parsley-validate id="bigUser" name="bigUser"
                  action="<c:url value="/pc/saveEnrollUser"/>" method="post"
                  onkeypress="if(event.keyCode==13||event.which==13){return false;}">
                  <input  type="text" id="backUrl" value="${requestScope.backUrl}" name="backUrl" style="display:none;"/>
                <fieldset>
                    <div class="mt wh">
                        <h1>注册会员</h1>
                          
                        <span class="link">
                            <p>已是会员，</p>
                            <%if(request.getAttribute("backUrl").toString().indexOf("j_spring_cas_security_check")!=-1){
                             String backUrl = request.getAttribute("backUrl").toString();
                             backUrl=backUrl.substring(0, backUrl.indexOf("j_spring_cas_security_check"));
                             request.setAttribute("backUrl",backUrl+"sso.do");}
                             %>
                              <a class="reg" href="${requestScope.backUrl}">登录</a>
                             
                           
                        </span>
                        
                    </div>
                    <div class="am-form-group">
                        <input type="text" id="username" name="username"
                               data-parsley-pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$"
                               data-parsley-error-message="请输入正确的手机号"
                               data-parsley-trigger="change"
                               data-parsley-required-message="请输入您的手机号"
                               placeholder="请输入您的手机号"
                               required>
                        <label class="msg-tips" id="usernameMessage" style="display: none">
                            <span class="msg">！该手机号已存在,如果您是该用户，请 <a href="${requestScope.backUrl}">立刻登录</a></span>
                        </label>
                    </div>
                    <div class="am-form-group">
                        <input class="txt-yzm" type="text" id="verification" minlength="3" placeholder="验证码" data-parsley-required="true" data-parsley-required-message="请输入验证码">
                        <button  class="btn-p1" id="verificationButton">获取验证码</button>

                        <div class=text1<h5 id="consumerVerificationCodeCheck" style="color: red;display: none">
                                手机验证码输入错误</h5>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <input type="password" id="password" name="password" data-parsley-pattern="^[a-zA-Z0-9]{6,16}$"
                               data-parsley-error-message="密码由6-16位字母或数字组成" placeholder="密码由6-16位字母或数字组成"
                               data-parsley-trigger="change" required="" data-parsley-id="6670">
                    </div>
                    <div class="am-form-group">
                        <input type="password" id="passwordAgain" class="form-control" name="passwordAgain"
                               data-parsley-equalto="#password" data-parsley-equalto-message="两次输入不一致"
                               data-parsley-required="true"
                               data-parsley-required-message="请确认密码"
                               data-parsley-trigger="change"
                               placeholder="请与上面输入的值一致">
                        <%--<label class="msg-tips" for="">--%>
                        <%--<span class="msg">！两次密码输入不一致，请重新输入</span>--%>
                        <%--</label>--%>
                    </div>
                    <div class="am-form-group">
                        <label><input class="checkbox" id="agreemen" type="checkbox" checked required/>我已认真阅读并同意<a id="protocol"
                                                                                                     class="agree"
                                                                                                     href="#"
                                                                                                     title="e飞蚁用户注册协议">《e飞蚁用户注册协议》</a></label>
                    </div>
                    <input id="consumerSubmit" type="submit" class="btn btn-primary btn-block"
                           value="注册"
                           style="border-color: #db0c5b;background-color: #db0c5b; display: none"/>
                    <a class="am-btn am-btn-secondary" id="consumerSignin">注 册</a>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<div class="thickframe">
    <div class="thickdiv"></div>
    <div class="thickbox">
        <div class="thicktitle">
            <span>e飞蚁电子商务平台用户注册协议</span><a href="#" id="closeBox" class="icon thickclose">×</a>
        </div>
        <div class="thickcon">
            <div id="protocol-con">
                <h3>特别提示：</h3>
                <p>永新华韵文化发展有限公司（以下简称“永新华韵”）在此特别提醒您，在您（“用户”）注册成为本网站用户前，请您认真阅读本《e飞蚁电子商务平台用户注册协议》（以下简称“协议”），确保您充分理解本协议的所有条款。请您审慎阅读选择接受或不接受本协议。除非您接受本协议的全部条款，否则您无权注册、登录或使用本《用户注册协议》所涉的各类服务。您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各条款的约束。</p>
                <h3>第一条 本站服务条款的确认和接纳</h3>
                <p>1.1本站的各项电子服务的所有权和运作权归永新华韵所有。您同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方之间权利义务的法律文件，自生效起即始终具有法律效力。</p>
                <p>1.2 用户必须是年龄在18周岁以上的具有完全民事行为能力的自然人或依法设立的企业、事业单位、社会团体，如果用户为年龄18周岁以下的自然人，应在父母或监护人的监护参与下才能使用本站。</p>
                <p>1.3  永新华韵保留在法律允许的范围内独自决定拒绝服务、关闭用户账户、清除或编辑内容或取消订单的权利。</p>
                <h3>第2条 本站服务</h3>
                <p>您使用本站提供的服务，必须自行准备如下设备和承担如下开支：（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。</p>
                <h3>第3条 用户信息</h3>
                <p>3.1用户应自行向本站提供真实的注册资料，并保证提供的注册资料真实、准确、完整、合法有效，如用户的注册资料发生变动，应及时对注册资料进行更新。如果用户提供的注册资料存在不合法、不真实、不准确、不详尽的情形，应承担由此引起的一切法律后果。</p>
                <p>3.2永新华韵对用户的真实姓名/名称、通信地址、联系电话、电子邮箱等信息负有保密义务，除非得到用户的事先授权，或者国家法律另有规定，永新华韵不得向外界披露用户的任何隐私信息。</p>
                <p>3.3 用户注册成功后，将产生用户名和密码等账户信息，用户应合理、妥善的保存、使用自己的用户名和密码。若用户发现存在任何非法使用用户账号或存在安全漏洞的情况，应立即通知本站并向公安机关报案。</p>
                <p>3.4用户同意，永新华韵拥有通过邮件、短信电话等形式，向在本站注册、购物用户、收货人发送订单信息、促销活动等告知信息的权利。</p>
                <p>3.5用户应妥善保管在本站注册获得的账户，如用户将账户借给他人使用，应自行承担由此产生的全部责任，并与实际使用人承担连带责任。</p>
                <p>3.6用户同意，永新华韵有权使用用户的注册信息、用户名、密码等信息，登陆进入用户的注册账户，进行证据保全，包括但不限于公证、见证等。</p>
                <h3>第4条 用户义务</h3>
                <p>本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：</p>
                <p>（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；</p>
                <p>（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；</p>
                <p>（3）不得利用本站从事洗钱、窃取商业秘密、窃取个人信息等违法犯罪活动；</p>
                <p>（4）不得干扰本站的正常运转，不得侵入本站及国家计算机信息系统；</p>
                <p>（5）不得传输或发表任何违法犯罪的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽的、不文明的等信息资料；</p>
                <p>（6）不得传输或发表损害国家社会公共利益和涉及国家安全的信息资料或言论；</p>
                <p>（7）不得教唆他人从事本条所禁止的行为；</p>
                <p>（8）不得利用在本站注册的账户进行牟利性经营活动；</p>
                <p>（9）不得发布任何侵犯他人著作权、商标权等知识产权或合法权利的内容；</p>
                <p>用户应不时关注并遵守本站不时公布或修改的各类合法规则规定。</p>
                <p style="font-weight:bold">对于用户在本站内发布的各类不符合国家法律、法规、规章制度和政策的信息，永新华韵有权自行删除而无须通知用户的权利。若用户未遵守本条各款规定的，永新华韵有权暂停或关闭用户帐号。</p>
                <p>用户应不时关注并遵守本站不时公布或修改的各类合法规则规定，并对自己在网上的言论和行为承担法律责任。</p>
                <h3>第5条 商品信息</h3>
                <p>本站上陈列、展示的商品价格、数量、材质以及是否有货等商品信息随时都可以发生变动，请用户密切关注并及时根据变动后的商品信息做出是否购买的决定，本站对商品信息的变动不作特别的通知。由于互联网技术以及其它一些众所周知的原因，本站网页上陈列、展示的商品信息不可避免的会存在一定的滞后性或差错，对此请用户予以理解，本站会采取合理措施确保商品信息的真实性、准确性和及时性。</p>
                <p>为表述便利，商品和服务简称为“商品”或“货物”。</p>
                <h3>第6条 订单</h3>
                <p>6.1用户下订单时，应仔细确认所购商品的名称、价格、数量、型号、规格、尺寸、联系地址、电话、收货人等信息。如收货人与用户本人不一致的，收货人的行为和意思表示视为用户的行为和意思表示，用户应对收货人的行为及意思表示的法律后果承担连带责任。</p>
                <p>6.2由于市场变化等原因，本站无法保证用户提交的订单信息中希望购买的商品都会有货；如用户拟购买的商品发生缺货，用户应予以理解，并可选择取消订单。</p>
                <h3>第7条 配送</h3>
                <p>7.1销售方将会把商品（货物）送到您所指定的收货地址，所有在本站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。</p>
                <p>7.2因如下情况造成订单延迟或无法配送等，销售方不承担延迟配送的责任：</p>
                <p>（1）用户提供的信息错误、地址不详细等原因导致的；</p>
                <p>（2）货物送达后无人签收，导致无法配送或延迟配送的；</p>
                <p>（3）不可抗力因素导致的，例如：自然灾害、交通戒严、突发战争等。</p>
                <p>第8条 所有权及知识产权条款</p>
                <p>本站定义的网络服务内容包括：文字、软件、声音、图片、录像、图表、广告中的全部内容；电子邮件的全部内容；本站为用户提供的其他信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本站授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。</p>
                <p>第9条 责任限制及不承诺担保</p>
                <p>9.1如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，永新华韵会合理地尽力协助处理善后事宜。</p>
                <p>9.2用户个人对网络服务的使用承担风险。本站对此不作任何类型的担保，不论担保形式是明确的或隐含的。本站不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。本站对在本站上得到的任何商品购物服务或交易进程，不作担保。</p>
                <h3>第10条 协议更新及用户关注义务</h3>
                <p>根据国家法律法规变化及网站运营需要，永新华韵有权对本协议条款不时地进行修改，修改后的协议一旦被张贴在本站上即生效，并代替原来的协议。用户可随时登陆查阅最新协议；<strong>用户有义务不时关注并阅读最新版的协议及网站公告。如用户不同意更新后的协议，应立即停止接受e飞蚁平台网站依据本协议提供的服务；如用户继续使用本网站提供的服务的，即视为同意更新后的协议。永新华韵建议用户在使用本站之前阅读本协议及本站的公告。</strong>如果本协议中任何一条被视为废止、无效或因任何理由不可执行，并不影响任何其余条款的有效性和可执行性。 </p>
                <h3>第11条 法律管辖和适用</h3>
                <p>本协议的签订、履行、解释及争议解决，均适用中华人民共和国大陆地区的法律。在本协议履行的过程中如发生争议，用户可与永新华韵协商解决，如协商解决不成的，任何一方可将争议提交永新华韵住所地有管辖权的人民法院诉讼解决。</p>
                <h3>第12条 其他</h3>
                <p>12.1 “e飞蚁平台”网站所有者是指在政府部门依法许可或备案的<span style="text-decoration: underline;"> www.efeiyi.com </span>网站经营主体。</p>
                <p><strong>12.2 用户知晓，如其向自然人商户采购本站陈述或展示的商品，有无法取得合法、正规发票的风险，用户承诺除可直接归责于甲方的原因外，因通过本站交易而引起的发票问题均由其自行解决，与永新华韵无关，用户不得因发票事宜而针对永新华韵提出任何法律要求或主张，亦不得采取法律诉讼、仲裁等行为。</strong></p>
                <p>12.3本协议内容中以黑体、加粗、下划线、斜体等方式显著标识的条款，请用户着重阅读。</p>
                <p>12.3 您点击本协议下方的“同意并继续”按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。</p>
                <p></p>
            </div>
            <div class="btnt"><input type="button" class="btn-img" value="同意并继续"></div>
        </div>
    </div>
</div>

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


/*        $("#consumerSignin").click(function () {
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
        });*/
  $("#consumerSignin").click(function () {
            console.log($("#agreemen").attr("checked"));
            if (isVerification && bool&&$("#agreemen").is(':checked')) {
//                if ($("#userRole").val() == "consumer") {
                $("#consumerSubmit").click();
//                } else if ($("#userRole").val() == "photographer") {
//                    $("#bigUser").attr("action", "/pc/saveEnrollPhotographer.do");
//                    $("#consumerSubmit").click();
//                }
            } else if (!isVerification) {
                $("#consumerVerificationCodeCheck").css("display", "block");
            } else if(!$("#agreemen").is(':checked')){
                showAlert("提示","请勾选同意注册协议");
            }
        });


        $("#username").blur(function () {


            if ($("#verification").val() != "") {
                checkVerificationCode($("#username").val(), $("#verification").val(), "user");
            }
            checkUserName("user");
        });
    });
$('#protocol').click(function(){
            $('.thickframe').show();
            return false;
        })
        $('#closeBox,.btnt .btn-img').click(function(){
            $('.thickframe').hide();
            return false;
        })
</script>
<style>
#login-b li {position: absolute;top:0;left:0;}
#login-b {
    position: relative;
    width: 490px;
    height: 410px;
}
</style>
<script>
$(function(){
    $('#login-b li').hide();
    $('#login-b li').eq(0).show();
    setInterval(autoRun,5000);
    var index=0;
    function autoRun(){
        index++;
        if(index>=3){
            index=0;
        }
        $('#login-b li').eq(index).fadeIn().siblings('li').fadeOut();
    }
})
</script>
<div class="footer wh">
<div class="service wh">
<div class="icon phone"></div>
<div class="line"></div>
<div class="icon platform"><a href="http://www.efeiyi.com/document/richTextView?group=ec.ptys" target="_blank" title="平台优势">平台优势</a></div>
<div class="line"></div>
<div class="icon chengbao"><a href="http://www.315cheng.com" target="_blank" title="诚品宝">诚品宝</a></div>
<div class="line"></div>
<div class="icon wechat"><i class="icon"></i></div>
</div>
<div class="links wh">
<a href="http://www.efeiyi.com/document/richTextView?group=ec.gwlc " target="_blank" title="帮助中心">帮助中心</a>
<a class="line"></a>
<a href="http://www.efeiyi.com/document/richTextView?group=ec.zpbz " target="_blank" title="服务保障">服务保障</a>
<a class="line"></a>
<a href="http://www.efeiyi.com/document/richTextView?group=ec.gywm " target="_blank" title="关于我们">关于我们</a>
<a class="line"></a>
<a href="http://www.efeiyi.com/document/richTextView?group=ec.lxwm" target="_blank" title="联系我们">联系我们</a>
<a class="line"></a>
<a href="http://www.efeiyi.com/document/richTextView?group=ec.cpyc" target="_blank" title="诚聘英才">诚聘英才</a>
<a class="line"></a>
<a href="http://www.efeiyi.com/document/richTextView?group=ec.yjfk" target="_blank" title="意见反馈">意见反馈</a>
<a class="line"></a>
<a href="http://www.efeiyi.com/document/richTextView?group=ec.flsm" target="_blank" title="法律声明">法律声明</a>
</div>
<div class="copyright wh">
<div class="phone">
<strong>商家入住热线</strong>
<em>400-876-8766</em>
</div>
<div class="frlinks">
<span>友情链接：</span>
<a rel="nofollow" href="http://en.unesco.org/" target="_blank" title="联合国教科文组织">联合国教科文组织</a>
<a rel="nofollow" href="http://www.mcprc.gov.cn/" target="_blank" title="中国文化部">中国文化部</a>
</div>
<div class="info">Copyright © 2015-2022 永新华韵文化发展有限公司版权所有-京ICP备15032511号-1</div>
</div>
<div class="wh authentication">
        <a href="http://www.miitbeian.gov.cn" target="_blank" title="网站域名备案"><img src="${ctx}/images/authentication-1.png" alt="网站域名备案"></a>
        <a href="http://www.baic.gov.cn/" target="_blank" title="企业信用信息备案"><img src="${ctx}/images/authentication-2.png" alt="企业信用信息备案"></a>
        <a href="${ctx}/images/license.jpg" target="_blank" title="企业营业执照"><img src="${ctx}/images/authentication-3.png" alt="企业营业执照 "></a>
    </div>
</div>
<!--[if lte IE 8 ]>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<c:url value="/scripts/js/amazeui.ie8polyfill.min.js"/>"></script>
<![endif]-->

<script type='text/javascript'>
(function(){
    $('.btn-top-wechat').hover(function(){
        $(this).find('.top-wechat').stop(true).slideDown('fast');
    },function(){
        $(this).find('.top-wechat').stop(true).slideUp('fast');
    });
    //footer二维码
    $('.footer .service .wechat').hover(function(){
        $(this).find('.icon').fadeIn('100');
    },function(){
        $(this).find('.icon').delay(2000).fadeOut();
    })
})();
    (function(m, ei, q, i, a, j, s) {
        m[a] = m[a] || function() {
                    (m[a].a = m[a].a || []).push(arguments)
                };
        j = ei.createElement(q),
                s = ei.getElementsByTagName(q)[0];
        j.async = true;
        j.src = i;
        s.parentNode.insertBefore(j, s)
    })(window, document, 'script', '//eco-api.meiqia.com/dist/meiqia.js', '_MEIQIA');
    _MEIQIA('entId', 486);
</script>
<div style="display: none">
    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256452193'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256452193' type='text/javascript'%3E%3C/script%3E"));</script>
</div>
</body>
</html>
