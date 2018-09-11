<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>剪影</title>
	<meta name="keywords" content="盒老师">
	<meta name="content" content="盒老师">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="${ pageContext.request.contextPath}/css/login.css">
    <script type="text/javascript" src="${ pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>

</head>
<body class="login_bj" >

<div class="zhuce_body">
	<!-- <div class="logo"><a href="#"><img src="images/logo.png" width="114" height="54" border="0"></a></div> -->
	
    <div class="zhuce_kong">
    	<div class="zc">
        	<div class="bj_bai">
            <h3>欢迎注册</h3>
       	  	  <form action="" method="get">
                <input name="" type="text" class="kuang_txt phone" placeholder="账号">
                <input name="" type="text" class="kuang_txt email" placeholder="邮箱">
                <input name="" type="text" class="kuang_txt possword" placeholder="密码">
                <input name="" type="text" class="kuang_txt yanzm" placeholder="输入验证码">
                <div>
                	<input type="button" class="btn_zhuce" value="发送验证码">
                </div>
                <div>
               		<input name="" type="checkbox" value=""><span>已阅读并同意<a href="#" target="_blank"><span class="lan">《剪影用户协议》</span></a></span>
                </div>
                <input name="注册" type="button" class="btn_zhuce" value="注册">
                
                </form>
            </div>
        	<div class="bj_right">
            	<p>使用以下账号直接登录</p>
                <a href="#" class="zhuce_qq">QQ注册</a>
                <a href="#" class="zhuce_wb">微博注册</a>
                <a href="#" class="zhuce_wx">微信注册</a>
                <p>已有账号？<a href="${ pageContext.request.contextPath}/view/login.jsp">立即登录</a></p>
            
            </div>
        </div>
        <P>52moment.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您注册剪影</P>
    </div>

</div>
    

</body>
</html>