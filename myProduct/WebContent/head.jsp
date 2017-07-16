<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
	*{padding:0px;margin:0px;
	}
	#zdNavbar{
		width:100%;
		height:30px;
		line-height:30px;
		background:#efecec;
	}
	#zdNavbar a{cursor:pointer;}
	#zdNavbar ul{
		list-style:none;
	}
	#zdNav ul{float:left;margin-left:50px}
	#zdNav li{
	height:30px;
		line-height:30px;
		float:left;
		margin-right:20px;
	}
	#zdMainbar ul{
		float:right;margin-right:50px;
	}
	#zdMainbar li{float:left;
	margin-left:20px;}
	#zdMainbar li img{float:left;}
</style>
<div id="divhead">
	<div id="zdNavbar">
		<div id="zdNav">
			<ul>
				<li>欢迎来到本店</li>
				<li><a href="index.jsp">首页</a></li>
			</ul>
		</div>
		<div id="zdMainbar">
			<ul>
				<li><a href="login.jsp">登录</a></li>
				<li><a href="register.jsp">新用户注册</a></li>
				<li><a href="myAccount.jsp">个人中心</a></li>
				<li><img src="images/cart2.png" /> <a
				href="${pageContext.request.contextPath }/lookCartServlet"> 购物车</a></li>
			</ul>
		</div>
	</div>
</div>
