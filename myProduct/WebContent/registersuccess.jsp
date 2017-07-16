<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
<head>

<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<script type="text/javascript" src="js/my.js">
	
</script>
</head>
<style type="text/css">
#divcontent hr{background:linear-gradient(to top, white, #f9c349);
margin:auto;
width:90%;height:2px;padding-bottom:5px;}

</style>
<body class="main" onload="startSecond()">

	<jsp:include page="head.jsp"></jsp:include>
	<jsp:include page="menu_search.jsp" />



	<div id="divcontent">
	<hr>
		<table width="80%" border="0" cellspacing="0" style="padding-left:3%; text-align:center">
			<tr>
				<td style=" text-align:center">
				<table width="60%"
						border="0" cellspacing="0" style="margin-top:50px">
						<tr>
							<td style=" text-align:right"><img
								src="images/IconTexto_WebDev_009.jpg" width="70%"  />
							</td>
							<td style="padding-top:70px"><font
								style="font-weight:bold; color:#FF0000">注册成功,别忘记激活帐户啊</font><br />
								<br /> <a href="index.jsp"><span id="second">10</span>秒后自动为您转跳回首页</a>
							</td>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>



<!-- <div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" /></td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a></td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2008 &copy; eShop All Rights RESERVED.</b> </font></td>
			</tr>
		</table>
	</div> -->	
<jsp:include page="foot.jsp"/>

</body>
</html>
