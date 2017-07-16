<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
<head>

<title>bookStore注册页面</title>
<%--导入css和js --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/my.js"></script> 

<script type="text/javascript">
	function changeImage() {
		document.getElementById("img").src = "${pageContext.request.contextPath}/imageCode?time="
				+ new Date().getTime();
	}

	//通过ajax检测邮箱是否已经存在
	function searchEmail( str ){
		var emailMessage = document.getElementById("emailMessage");
		if(/^\w+(.\w+)?@\w+(.\w)\w+$/g.test(str)){
			
		
		if(""!=str){
			//1-创建XMLHttpRequest对象
			var xhr = getXMLHttpRequest();
			
			//4-处理结果
			xhr.onreadystatechange=function(){
				if( xhr.readyState==4 && xhr.status==200 ){	//请求和服务器响应正常
					
				
					if("yes"==xhr.responseText){
						emailMessage.innerHTML = "<span style='color:green'>该邮箱未被使用</span>";
					}else{
						emailMessage.innerHTML = "<span style='color:red'>该邮箱已被使用 </span>";
					}
				} 
			}
			//2-创建连接
			xhr.open( "GET" , "${pageContext.request.contextPath }/searchEmailServlet?email="+str , true );
			
			//3-发送请求
			xhr.send( ); 
		}
		}else{
			emailMessage.innerHTML = "<span style='color:red'>邮箱格式不正确！ </span>";
		}
	} 
</script>
</head>
<style type="text/css">
	#zdLogo{width:100%;height:150px;}
	
	#zdimg{width:60%;float:left;}
	#zdimg img{height:150px;float:left;margin-left:20%;width:30%;}
	#zdimg h2{float:left;font-size:28px;padding-top:120px;}
	#toLoad{padding-top:120px;font-size:16px;color:lightgray;}
	#hr{height:10px;background: linear-gradient(to top, white, lightgray);}
	
	#divcontent{margin-top:20px;}
	#divcontent {
	width: 53%;
	background-color: #FCFDEF;
	border: 1px solid #EEEDDB;
	text-align:left;
	MARGIN-LEFT: 10%;
	padding-top:20px;
}
	#divcontent form{width:90%;margin:auto;}
	.upline tr{height:30px;line-height:30px;}
	#divcontent td{font-size:16px;}
	#divcontent h1{font-size:20px;margin-top:20px;}
	#divcontent input{height:20px;font-size:16px;line-height:20px;}
	#divcontent input[type="radio"]{height:20px;font-size:16px;padding-top:3px;}
	.lastTab tr{height:40px;line-height:40px;}
	#imgsub{height:40px;}
	.zdAs{position:absolute;top:210px;right:10%;width:26%;}
	.zdAs img{height:600px;width:100%;}
	
	
	.zdtd{width:80px;}
	
	#divcontent label{height:20px;line-height:20px;font-size:16px;display:inline-block;
	width:80px;text-align:right;
	}
	#divcontent input{}
	#divcontent textarea{width:90%;height:40px;margin:auto;}
	
	#divcontent #excp{width:300px;text-align:left;}
	#divcontent #excp font{display:inline-block;width:80px;text-align:right;}
	#excp label{display:inline;}
	#divcontent  .zdnn{display:inline-block;font-size:14px;margin-left:80px;}
</style>

<body class="main">

	<%--导入头 --%>
	<jsp:include page="head.jsp" />
	<div id="zdLogo">
		<div id="zdimg"><img src="images/ricelogo.jpg"/><h2>欢迎注册</h2></div>
		<div id="toLoad"><span>已有账户?</span><a href="#" style="font-size:16px;color:black;">请登录！</a></div>
	</div>
	<div id="hr"></div>
	<div class="zdAs"><img src="" alt="这里放一张图片"/> 
	</div>
	<div id="divcontent">
		<form action="${pageContext.request.contextPath}/register"
			method="post">
			<h1>新会员注册 ${user_msg }</h1><br><br><br>
			<label>会员邮箱：</label><input type="email" name="text" onblur="searchEmail(this.value)" />
			<span id="emailMessage" style="color:#999999" class="zdnn">请输入合法的邮箱</span><br><br>
			<label>会员名：</label><input type="text" name="username" />
			<font color="#999999" class="zdnn">用户名设置至少6位</font><br><br>
			<label>密码：</label><input type="password" name="PASSWORD" />
			<font color="#999999" class="zdnn">密码设置至少6位</font><br><br>
			<label>重复密码：</label><input type="password" name="repassword" /><br><br>
			<label id="excp" ><font>性别：</font>
				<label><input type="radio" name="gender" value="男" checked="checked">男</label>
				&nbsp;&nbsp;<label><input type="radio" name="gender" value="女" checked="checked">女</label>
			</label><br><br>
			<label>重复密码：</label><input type="text" name="telephone" /><br><br>
			<label id="zdex">个人介绍：</label><textarea class="zdtxt" name="introduce" rows="1" cols=""></textarea><br>
			<br><hr><br>
			<h1>注册校验</h1>
						<table border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; ">校验码：</td>
								<td ><input type="text" class="textinput" name="ckcode"/>
								</td>
								<td>${ckcode_msg }</td>
							</tr>
							<tr>
								<td style="text-align:right;width:20%;">&nbsp;</td>
								<td colspan="2" style="width:50%"><img
									src="${pageContext.request.contextPath}/imageCode" width="180"
									height="30" class="textinput" style="height:30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
								</td>
							</tr>
						</table>



						<table width="70%" border="0" cellspacing="0" class="lastTab">
							<tr >
								<td style="padding-top:20px; text-align:center"><input
									type="image" src="images/signup.gif" name="submit" border="0" id='imgsub'
									style="height:30px;">
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
		
	</div>
	
<jsp:include page="foot.jsp"/>







</body>
</html>
