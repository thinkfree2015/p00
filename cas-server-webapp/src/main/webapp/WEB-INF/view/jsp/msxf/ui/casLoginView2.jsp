<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"
	scope="session" />

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>e飞蚁用户认证中心</title>
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
        <!--<link rel="stylesheet" href="${ctx}/css/app.css"/>
        --><link rel="stylesheet" href="${ctx}/wapCss/app.css"/>
        <link rel="stylesheet" href="${ctx}/wapCss/signon.css"/>
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

<div class="single-sign-on">
		<div class="hd login">
			<div class="login-wrap">
			
				
				<div class="login-form" >

					<form:form method="post" commandName="${commandName}"
						htmlEscape="true">
						 <fieldset style="padding:0">
							<form:errors path="*" id="msg" cssClass="errors" element="div"
								htmlEscape="false" />
							<input type="hidden" name="lt" value="${loginTicket}" />
							<input type="hidden" name="execution" value="${flowExecutionKey}" />
							<input type="hidden" name="_eventId" value="submit" />
							 <header class="am-header custom-header">
                        
                            <!-- //End--chevron-left-->
                            <h1 class="am-header-title">登录</h1>
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
                        <!--//End--header-->
                        <div class="bk">
                            <div class="ld">
							<div class="mt wh">
						
								<span class="link"> <!--<a href="javascript:void(0);">没有账号? </a> --><a class="reg"
									href="${ctx}/register?service=<%=request.getParameter("service") %>">没有账号?注册</a> </span>
							</div>


							<div class="am-form-group">
								<i class="icon name"></i>
								<label>手机号</label>
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
								<label>密码</label>
								<form:password tabindex="2" path="password" placeholder="密码"
									htmlEscape="true" minlength="3" cssClass="text1 textam"/>

							</div>
							<%
							if(null!=session.getAttribute(ip) && Integer.parseInt(session.getAttribute(ip).toString())>=1){ %>
							<div class="am-form-group">
							<label>验证码</label>
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
								<label for="warn" class="warn">
									自动登录
								</label>
								
								<a class="forgetpwd" href="<c:url value="/forgetPwd"/>"
									title="忘记密码">忘记密码？</a>
							</div>


							<input class="am-btn am-btn-secondary " type="submit" tabindex="5"
								value="登&nbsp;&nbsp;&nbsp;&nbsp;录" />
                        </div>
                        </div>
						</fieldset>
					</form:form>
 </div>


				</div>
			</div>
		</div>



	</body>
</html>