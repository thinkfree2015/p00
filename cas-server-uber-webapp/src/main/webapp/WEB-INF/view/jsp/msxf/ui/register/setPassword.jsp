<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
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
        <link rel="stylesheet" href="${ctx}/css/myorder.css"/>
        <style type="text/css">
        .footer .authentication {background: #000;text-align: center;padding:20px 0}
        .footer .authentication a {display: inline-block;margin:0 20px}
        </style>
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
<div class="new">
  <div class="short">
    <form id="myform" action="${ctx}/myEfeiyi/updatePassword" method='post'>
    <input  type="text" id="id" value="${user.id}" name="id" style="display:none;"/>
      <ul>
        <li>
          <label>设置新密码</label>
          <input name="np" class="txt" type="password" placeholder="请输入新密码"onblur="checkLg(this);">
          <span class="active-d span2"></span>
        </li>
        <li>
          <label>重复新密码</label>
          <input name="pwd" class="txt" type="password" placeholder="请重复输入新密码" onkeydown="checkEq(this);" onkeyup="checkEq(this);">
          <span class="active-d span2"></span>
        </li>
        <li>
          <label></label>
          <span class="span-lest2"><a onclick="okChange()">保存并登录</a></span>
        </li>
      </ul>
    </form>
  </div>
</div>
<!-- //End--footer-->
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<c:url value="${ctx}/js/jquery.min.js"/>"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<c:url value="/scripts/js/amazeui.ie8polyfill.min.js"/>"></script>
<![endif]-->
<script src="<c:url value="${ctx}/js/amazeui.min.js"/>"></script>
<script src="<c:url value="${ctx}/js/system.js"/>"></script>
<script>

  function okChange(){
    var  flag = true;
    var np= $(":input[name='np']").val();
    var pwd= $(":input[name='pwd']").val();
    $(".active-d").each(function(){
      if($(this).text()!="" || np=="" || pwd==""){
        flag = false;
        return false;
      }
    });
    if(flag==true){
      
       document.getElementById('myform').submit();
       //document.getElementById('myform').submit();
    }
  }

  function checkEq(obj){

    var np = $(":input[name='np']").val();
    var newPassword = $(obj).val();
    if(np != newPassword){
      $(obj).next("span").text("您输入的两次密码不一致");
    }else{
      $(obj).next("span").text("");
    }
  }
  function checkLg(obj){
    var lg= $(":input[name='np']").val().length;
    if(lg<5 || lg>16){
      $(obj).next("span").text("密码由6位-16位字母或数字组成");
    }else{
      $(obj).next("span").text("");

    }
  }
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
