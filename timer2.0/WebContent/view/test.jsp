<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" /> 
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<style type="text/css">
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

	
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container col-sm-12">
<div class="row">
  <div class="col-sm-6 col-md-5">
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
		<li><a href="#">General</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-heart"></span>28</a></li>
		<li><a href="#" class=""><span class="glyphicon glyphicon-comment"></span>128</a></li>
		</ul>
	 </div>
      </div>
    </div>
  </div>
</div>
</div>

</body>
</html>