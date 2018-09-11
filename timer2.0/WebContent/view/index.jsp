<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${ pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="${ pageContext.request.contextPath}/js/jquery-1.8.1.min.js"></script>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ma5slider.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
<style type="text/css">
	.controll-height{
		height: 1680px;
	}
	.footer_star{
		display: block;
		margin: 0 0 2em 0;
		border: 0;
    	font-size: 100%;
    	font: inherit;
    	vertical-align: baseline;
	}
	.footer_star li {
		float:right;
		list-style: none;
	
	} 
	.padding-dorder{
		padding-left: 5px;
		padding-right: 5px;
		padding-top: 10px;
		padding-bottom: 5px;
	}
	.container-fluid{
		background: #2E2E2E;
	}
	.nav-black{
		
	}
	.message_list{
		list-style: none;
	
	}

	.message_list ul li img{
		margin-left: 10px;
		margin-bottom: 8px;
		width: 40px;
		height: 40px;
		color: #fff;
	}
	.message_list ul li span{
		color: #f16e50;
	}
	
	/* .message_list ul li span{
		width:80px;
		height: 40px;
		font-size:10px;
		text-align: center;
		
	
	} */
	
	
}
</style>
</head>
<body>
<div class="container-fluid">
<header>
 <nav class="navbar navbar-inverse navbar-default col-md-12 nav-black">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand"></a>
                    <button class="navbar-toggle" data-toggle="collapse" data-target=.navbar-responsive-collapse>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </button>
                </div>
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav  navbar-left">
                        <li class="index"><a href="${pageContext.request.contextPath}/view/index.jsp">广场</a></li>
                        <li class="userlook"><a href="${pageContext.request.contextPath}/view/userlook.jsp">时光册</a></li>
                        <li class="guangguang"><a href="${pageContext.request.contextPath}/view/guangguang.jsp">爱时光</a></li>
                        <li class="words"><a href="${pageContext.request.contextPath}/view/words.jsp">时光瓶</a></li>
                    </ul>
                    <%
                    	if (null == null || "".equals("")){
                    	
                    %>
                    <ul class="nav navbar-nav navbar-right regi_login" style="height: 50px;">
                    	<li><a href="${pageContext.request.contextPath}/view/register.jsp">注册</a></li>
                    	<li><a href="${pageContext.request.contextPath}/view/login.jsp">登录</a></li>
                    </ul>
                    <%
                    	}else{
                    
                    %>
                    <ul class="nav navbar-nav navbar-right admin_te" style="height: 50px;">
                    	<li><a href="${pageContext.request.contextPath}/view/admin.jsp">控制台</a></li>
              			<li style="height: 50px;text-align: center;margin-top: 10px;"><img alt="" src="${user.img}" class="img-circle" style="width:30px;height:30px;"></li>
                    </ul>
                    <%
                    	}
                    
                    %>
                </div>
            </div>
    </nav>
 </header>
 <div class="mainContent">
    <aside class="aside-left">
      <div class="avatar">
        <a href="#"><span>花笺</span></a>
      </div>
      <section class="topspaceinfo">
        
        <p class="small">于千万人之中，我遇见了我所遇见的人....</p>
      </section>
      <div class="userinfo"> 
        <p class="q-fans"> 粉丝：<a href="/" target="_blank">167</a></p> 
        <p class="btns"><a href="/" target="_blank" >私信</a><a href="/" target="_blank">相册</a><a href="/" target="_blank">留言板</a></p>   
      </div>
      <section class="newpic">
         <h2>最新照片</h2>
         <ul>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/01.jpg"></a></li>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/02.jpg"></a></li>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/03.jpg"></a></li>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/04.jpg"></a></li>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/05.jpg"></a></li>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/06.jpg"></a></li>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/07.jpg"></a></li>
           <li><a href="/"><img src="${ pageContext.request.contextPath}/images/08.jpg"></a></li>
         </ul>
      </section>
      <section class="taglist">
         <h2>全部标签</h2>
         <ul>
           <li><a href="/"><span class="label label-warning">旅游</span></a></li>
           <li><a href="/"><span class="label label-warning">美食</span></a></li>
           <li><a href="/"><span class="label label-warning">运动</span></a></li>
           <li><a href="/"><span class="label label-warning">技术宅 </span></a></li>
        </ul>
      </section>
    </aside>
    
    <div class="blogitem">
    <div class="container controll-height  col-md-12 ">
    <div class="col-sm-12 col-md-12" style="padding-top: 10px;margin:0 auto">
    <div class="thumbnail">
      <img src="${ pageContext.request.contextPath}/images/pic01.jpg" alt="..." class="img-responsive">
      <div class="caption">
      <div>
      <img alt="" src="${ pageContext.request.contextPath}/images/avatar.jpg" class="img-responsive img-circle" style="display: inline-block;">
       <span>Tom</span>
      </div>
       <div>
       	<p class="small padding-dorder">我的小鱼你醒了,还认识早晨吗?昨夜你曾经说,愿夜幕永不开启。
       	你的香腮边轻轻滑落的，
		是你的泪，还是我的泪？
		初吻吻别的那个季节，
		不是已经哭过了吗？
		我的指尖还记忆着，
		你慌乱的心跳。
		温柔的体香里，
		那一缕长发飘飘。
       	</p>
       </div>
      <div class="footer_star">
		<ul class="stats">
		<li><a href="#" class=""><span class="glyphicon glyphicon-heart"></span>10&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-comment"></span>128&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-thumbs-up"></span>152&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		</ul>
	 </div>
      </div>
    </div>
  </div>
  
  
  <div class="col-sm-12 col-md-12" style="padding-top: 10px;margin:0 auto">
    <div class="thumbnail">
      <img src="${ pageContext.request.contextPath}/images/pic01.jpg" alt="..." class="img-responsive">
      <div class="caption">
      <div>
      <img alt="" src="${ pageContext.request.contextPath}/images/avatar.jpg" class="img-responsive img-circle" style="display: inline-block;">
       <span>Tom</span>
      </div>
       <div>
       	<p class="small padding-dorder">我的小鱼你醒了,还认识早晨吗?昨夜你曾经说,愿夜幕永不开启。
       	你的香腮边轻轻滑落的，
		是你的泪，还是我的泪？
		初吻吻别的那个季节，
		不是已经哭过了吗？
		我的指尖还记忆着，
		你慌乱的心跳。
		温柔的体香里，
		那一缕长发飘飘。
       	</p>
       </div>
      <div class="footer_star">
		<ul class="stats">
		<li><a href="#" class=""><span class="glyphicon glyphicon-heart"></span>10&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-comment"></span>128&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-thumbs-up"></span>152&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		</ul>
	 </div>
      </div>
    </div>
  </div>
  
  <div class="col-sm-12 col-md-12" style="padding-top: 10px;margin:0 auto">
    <div class="thumbnail">
      <img src="${ pageContext.request.contextPath}/images/pic01.jpg" alt="..." class="img-responsive">
      <div class="caption">
      <div>
      <img alt="" src="${ pageContext.request.contextPath}/images/avatar.jpg" class="img-responsive img-circle" style="display: inline-block;">
       <span>Tom</span>
      </div>
       <div>
       	<p class="small padding-dorder">我的小鱼你醒了,还认识早晨吗?昨夜你曾经说,愿夜幕永不开启。
       	你的香腮边轻轻滑落的，
		是你的泪，还是我的泪？
		初吻吻别的那个季节，
		不是已经哭过了吗？
		我的指尖还记忆着，
		你慌乱的心跳。
		温柔的体香里，
		那一缕长发飘飘。
       	</p>
       </div>
      <div class="footer_star">
		<ul class="stats">
		<li><a href="#" class=""><span class="glyphicon glyphicon-heart"></span>10&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-comment"></span>128&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-thumbs-up"></span>152&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
		</ul>
	 </div>
      </div>
    </div>
  </div>
  
  
  
  
  
  
    </div>
   
   
   
   
  <div class="col-md-12 col-md-offset-4">
  <nav aria-label="Page navigation">
  		<ul class="pagination">
    		<li>
      		<a href="#" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
      		</a>
    	</li>
    	<li><a href="#">1</a></li>
    	<li><a href="#">2</a></li>
    	<li><a href="#">3</a></li>
    	<li><a href="#">4</a></li>
    	<li><a href="#">5</a></li>
    	<li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
  
  </div>
      
      
    
    </div>
    
     <aside class="aside-right">
      <section class="newpic">
         <h2>猜你喜欢</h2>
         <div class="ma5slider anim-horizontal horizontal-dots horizontal-navs center-dots inside-dots autoplay">
                <div class="slides">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/banner01.jpg" alt="" class="img-responsive"></a>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/banner02.jpg" alt="" class="img-responsive"></a>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/banner03.jpg" alt="" class="img-responsive"></a>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/banner04.jpg" alt="" class="img-responsive"></a>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/banner05.jpg" alt="" class="img-responsive"></a>
                </div>
          </div>
         
      </section>
      
      <section>
      <h2>访客情况</h2>
      <div class="userinfo">
         <ul>
           <li><a href="/">今日访客:520</a></li>
           <li><a href="/">历史访客:1314</a></li>
       	   <li><a href="/" class="text-primary">查看历史访客</a></li>
         </ul>
      </div>
         
      </section>
      <section class="message_list">
         <h2>最新留言</h2>
         <ul>
           <li>
           <img alt="" src="${ pageContext.request.contextPath}/images/photo.jpg" class="img-responsive img-circle" style="display: inline-block;">
       		<span>Tom&nbsp;&nbsp;对你说:</span>
       		<span>我想你了</span>
           </li>
           <li>
           <img alt="" src="${ pageContext.request.contextPath}/images/photo.jpg" class="img-responsive img-circle" style="display: inline-block;">
       		<span>Tom&nbsp;&nbsp;对你说:</span>
       		<span>我想你了</span>
           </li>
           <li>
           <img alt="" src="${ pageContext.request.contextPath}/images/photo.jpg" class="img-responsive img-circle" style="display: inline-block;">
       		<span>Tom&nbsp;&nbsp;对你说:</span>
       		<span>我想你了</span>
           </li>
           
        </ul>
      </section>
    </aside>
    
    
    
    
    
    
    
    
 </div>
<footer>
   <div class="footavatar">
     <img src="${ pageContext.request.contextPath}/images/photo.jpg" class="footphoto img-responsive img-circle">
     <ul class="footinfo">
       <p class="fname"><a href="/dancesmile" >青轻飞扬</a>  </p>
       <p class="finfo">性别：女 年龄：25岁</p>
       <p>现居：四川成都</p></ul>
   </div>
   <section class="visitor">
     <h2>最近访客</h2>
      <ul>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s0.jpg" class="img-responsive img-circle"></a></li>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s1.jpg" class="img-responsive img-circle"></a></li>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s2.jpg" class="img-responsive img-circle"></a></li>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s3.jpg" class="img-responsive img-circle"></a></li>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s5.jpg" class="img-responsive img-circle"></a></li>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s6.jpg" class="img-responsive img-circle"></a></li>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s7.jpg" class="img-responsive img-circle"></a></li>
        <li><a href="/"><img src="${ pageContext.request.contextPath}/images/s8.jpg" class="img-responsive img-circle"></a></li>
      </ul>
   </section>
   <div class="Copyright">
     <ul>
       <a href="/">帮助中心</a><a href="/">空间客服</a><a href="/">投诉中心</a><a href="/">空间协议</a>
     </ul>
     <p>Design by DanceSmile</p>
   </div>
 </footer>



</div>

 <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
 <script src="${pageContext.request.contextPath}/js/jquery.ui.touch-punch.min.js"></script>
 <script src="${pageContext.request.contextPath}/js/functions.js"></script>
 <script src="${pageContext.request.contextPath}/js/ma5slider.min.js"></script>
   		  

<script type="text/javascript">
   	$(window).on('load', function () {
   	       $('.ma5slider').ma5slider();
   	        		// Methods

   	   });
   		  
 </script>
</body>
</html>
