<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<style type="text/css">
	#zdFoot{
		width:100%;
		height:80px;
		text-align:center;
		position:abosulte;
		overflow:hidden;
	}
	#zdFoot ul{
		list-style:none;
		width:250px;
		margin:auto;
		margin-top:40px;
	}
	#zdFoot li{float:left;padding:0px 5px;border-right:1px solid black;}
	#zdFoot li:last-child{border:none;}
	#zdFoot p{clear:both;}
	#zdFoot a{color:black;}
	
	#divfoot{margin-top:30px;}
	#divfoot{overflow:hidden;}
	#link{width:90%;padding-top:10px;overflow:hidden;margin-left:3%;}
	#link hr{background:linear-gradient(to top, white, #f9c349);width:100%;height:2px;padding-bottom:5px;border:#f9c349;}
	#link img{width:30%;float:left;height:100px;}
	#sLinks{width:60%;float:left;margin-left:2%;}
	#sLinks ul{width:30%;float:left;border-right:1px solid black;list-style-type:none;color:black;}
	#sLinks ul:last-child{border-right:none;}
	#sLinks li a{font:8px tahoma,arial,'Hiragino Sans GB',\5b8b\4f53,sans-serif;padding-bottom:5px;font-family:"SimSun";
		color:#40444e;
	}
	
</style>
<div id="divfoot">
	<div id="newFoot">
	
		<div id="link">
			<hr>
			<img src="" alt="logo"/>
			
			<div id="sLinks">
				<ul>
					<h4>友情链接</h4>
					<li><a href="#">链接一</a></li>
					<li><a href="#">链接二</a></li>
					<li><a href="#">链接三</a></li>
					<li><a href="#">链接四</a></li>
				</ul>
				<ul>
					<h4>友情链接</h4>
					<li><a href="#">链接一</a></li>
					<li><a href="#">链接二</a></li>
					<li><a href="#">链接三</a></li>
					<li><a href="#">链接四</a></li>
				</ul>
				<ul>
					<h4>友情链接</h4>
					<li><a href="#">链接一</a></li>
					<li><a href="#">链接二</a></li>
					<li><a href="#">链接三</a></li>
					<li><a href="#">链接四</a></li>
				</ul>
			</div>
			
		</div>
		
		<div id="zdFoot">
		
			<ul>
				<li><a href="#">关于我们</a></li>
				<li><a href="#">留言反馈</a></li>
				<li><a href="#">更多应用</a></li>
				<li><a href="#">加入我们</a></li>
			</ul>
			<p><font color="#40444e"><b>COPYRIGHT
									2017 &copy; BookStore All Rights RESERVED.</b> </font></p>
		</div>
		
	</div>
</div>