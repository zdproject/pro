<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<script type="text/javascript" src="js/my.js">
	
</script>
<style type="text/css">
#divcontent hr{background:linear-gradient(to top, white, #f9c349);
margin:auto;
width:90%;height:2px;padding-bottom:5px;}
#divcontent{margin-left:3%;}
</style>
</head>

<body class="main" onload="startSecond();">

	<jsp:include page="head.jsp" />
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
								<br /> <a href="index.jsp"><span id="second">5</span>秒后自动为您转跳回首页</a>
							</td>
						</tr>
					</table>
					<h1>&nbsp;</h1></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
