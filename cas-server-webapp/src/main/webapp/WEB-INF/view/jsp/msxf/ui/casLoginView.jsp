<%@ page pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"
	scope="session" />

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>e飞蚁用户认证中心</title>
		<link rel="icon" type="image/x-icon" href="${ctx}/favicon.ico" />
		<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/jquery-ui-1.10.2.min.js"></script>
		<script type="text/javascript" src="${ctx}/js/cas.js"></script>
		<link rel="stylesheet" href="${ctx}/css/amazeui.min.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.flat.min.css"/>
		<link rel="stylesheet" href="${ctx}/css/amazeui.flat.css"/>
        <link rel="stylesheet" href="${ctx}/css/admin.css"/>
        <link rel="stylesheet" href="${ctx}/css/app.css"/>
		<!--[if lt IE 9]>
		<script src="${ctx}/js/html5shiv-3.7.2.min.js" type="text/javascript"></script>
	<![endif]-->
	</head>

	<style>
body {
	background-color: #FFFFFF;
}

#msg {
	padding: 20px;
	margin-bottom: 10px;
}

#msg.errors {
	border: 1px dotted #BB0000;
	color: #BB0000;
	padding-left: 100px;
	background: url(${ctx}/images/error.gif) no-repeat 20px center;
}
.login-form .mt {margin-bottom:30px}
.login-form  h1 {font-size:18px;float:left}
.login-form  .link {float:right;margin-top:5px}
.login-form  .link a,.login-form .am-form .link p {font-size:12px;color:#999;float:left}
.login-form  .link a:hover {color:#f00}
.login-form  .link .reg {color:#036;text-decoration:underline}
.footer .authentication {background: #000;text-align: center;padding:20px 0}
.footer .authentication a {display: inline-block;margin:0 20px}
</style>

	<body>
	
	<%  
   
   String ip = request.getHeader("x-forwarded-for"); 
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
        ip = request.getHeader("Proxy-Client-IP"); 
    } 
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
        ip = request.getHeader("WL-Proxy-Client-IP"); 
    } 
    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
        ip = request.getRemoteAddr(); 
    } 
   ip = ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;

   
 %>
		<c:if test="${not pageContext.request.secure}">
			<!--
			<div id="msg" class="errors">
				<h2>
					
				</h2>
				<p>
					
				</p>
			</div>
		-->
		</c:if>
<div class="header wh">
    <div class="hd">
        <div class="logo"><a class="icon" href="http://www.efeiyi.com" title="e飞蚁-爱非遗"></a></div>
        <!--<div class="nav">
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
					<!--<img src="${ctx}/images/login-1.jpg" alt="" />
				-->
				<ul>
                  <li><img src="${ctx}/images/login-1.jpg" alt=""/></li>
                  <li><img src="${ctx}/images/login-2.jpg" alt=""/></li>
                  <li><img src="${ctx}/images/login-3.jpg" alt=""/></li>
                </ul>
				</div>
				<div class="login-form" >

					<form:form method="post" commandName="${commandName}"
						htmlEscape="true">
						<fieldset>
							
							<form:errors path="*" id="msg" cssClass="errors" element="div"
								htmlEscape="false" />
							<input type="hidden" name="lt" value="${loginTicket}" />
							<input type="hidden" name="execution" value="${flowExecutionKey}" />
							<input type="hidden" name="_eventId" value="submit" />
							<div class="mt wh">
								<h1>
									会员登录
								</h1>
								<span class="link"><!-- <a href="javascript:void(0);">没有账号? </a> --><a class="reg"
									href="${ctx}/register?service=<%=request.getParameter("service") %>">没有账号?注册</a> </span>
							</div>


							<div class="am-form-group">
								<i class="icon name"></i>
								<c:if test="${not empty sessionScope.openIdLocalId}">
					       <strong>${sessionScope.openIdLocalId}</strong>
									<input type="hidden" name="username"
										value="${sessionScope.openIdLocalId}" />
								</c:if>
								<c:if test="${empty sessionScope.openIdLocalId}">
									<form:input tabindex="1" path="username" placeholder="已验证手机"
										htmlEscape="true" minlength="3" cssClass="text1 textam"/>
								</c:if>

							</div>

							<div class="am-form-group">
								<i class="icon pwd"></i>
								<form:password tabindex="2" path="password" placeholder="密码"
									htmlEscape="true" minlength="3" cssClass="text1 textam"/>

							</div>
							<%
							if(null!=session.getAttribute(ip) && Integer.parseInt(session.getAttribute(ip).toString())>=1){ %>
							<div class="am-form-group">
								<form:input tabindex="3" path="captcha" placeholder="验证码"
									htmlEscape="true" maxlength="4" size="15"  cssClass="text1"/>
								<img style="cursor: pointer; vertical-align: middle;"
									src="captcha.jsp"
									onClick="this.src='captcha.jsp?time'+Math.random();">
							</div>
							<%} %>
							<div class="am-form-group">
							<input type="checkbox" tabindex="4" name="rememberMe"
									value="true" />
								<label for="warn" style="margin-left: 4px;">
									自动登录
								</label>
								
								<a class="forgetpwd" href="<c:url value="/forgetPwd"/>"
									title="忘记密码">忘记密码？</a>
							</div>


							<input class="am-btn am-btn-secondary " type="submit" tabindex="5"
								value="登录" />

						</fieldset>
					</form:form>



				</div>
			</div>
		</div>
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