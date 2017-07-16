<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>小二米店</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<script type="text/javascript" src="js/my.js">
	
</script>
<style type="text/css">
#divcontent hr{background:linear-gradient(to top, white, #f9c349);
margin:auto;
width:100%;height:2px;padding-bottom:5px;border:#f9c349;}
#divcontent{width:90%;margin-left:3%;}
</style>
</head>

<body class="main" onload="startSecond();">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divcontent">
	<hr>
		<table width="80%" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center"><table width="60%"
						border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98"><img
								src="images/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px"><font
								style="font-weight:bold; color:#FF0000">添加到购物车成功</font><br /> <br />
								<span id="second">5</span>秒后自动为您转跳到购物页面 <br/><br />
								<div>
									<div style="float:left;border-radius:5px;width:90px;height:30px;text-align:center;line-height:30px;background:#63c425" onmouseout="this.style.backgroundColor='#63c425'" onmouseover="this.style.backgroundColor='#5ab122'">
										<a href="${pageContext.request.contextPath }/showProductByPageServlet" style="color:white">继续购物</a>
									</div>
									<div style="float:left;margin-left:10px;border-radius:5px;width:90px;height:30px;text-align:center;line-height:30px;background:#63c425" onmouseout="this.style.backgroundColor='#63c425'" onmouseover="this.style.backgroundColor='#5ab122'">
										<a href="${pageContext.request.contextPath }/cart.jsp" style="color:white">查看购物车</a>
									</div>
								</div> 
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
