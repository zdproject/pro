<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<style type="text/css">
	#divpagecontent{width:90%;margin-left:3%;margin-top:10px;margin-bottom:10px;}
	.zdFir{background:linear-gradient(to top, white, #f9c349);border:#f9c349;
margin:auto;
width:100%;height:2px;padding-bottom:5px;}
#divpagecontent table{width:95%;margin:auto;margin-top:10px;}
	#divpagecontent td{font-size:16px;}
	#divpagecontent td a{font-size:16px;}
	.divlisttitle {
	line-height: 120%;
	text-align:center;
	}
	
</style>
</head>

<body class="main">

	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />


	<div id="divpagecontent" style="border:0">
	<hr class="zdFir">
		<table width="80%"  style="margin:0 auto"   border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 50px 5px 0px">
						<a href="#">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="#">&nbsp;计算机</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;java编程思想
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="ad/page_ad.jpg" width="100%" height="84" />

								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td width="30%">

											<div class="divbookcover">
												<p>
													<img src="${pageContext.request.contextPath }/upload/${pp.imgurl}" width="213" height="269" border="0" />
												</p>
											</div>

											<div style="text-align:center; margin-top:25px">
												<img src="images/buybutton.gif" border="0" onclick="isAddCart('${pp.pnum}')"/>
												
											</div>
										</td>
										<td style="padding:20px 5px 5px 5px"><img
											src="images/miniicon3.gif" width="16" height="13" /><font
											class="bookname">&nbsp;&nbsp;${pp.name }</font>

											<hr style="width:20%" />售价：<font color="#FF0000">￥:${pp.price }元</font>  
												    &nbsp; &nbsp;库存：<font color="#FF0000">${pp.pnum }件</font>
											<hr style="width:35%" /> 类别：${pp.category }

											<hr style="width:50%" />  
											<p>
												<b>内容简介：</b>
											</p>${pp.description }</td>
									</tr>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>
<script type="text/javascript">
	function isAddCart(x){
		if(x>0){
			location.href="${pageContext.request.contextPath}/addCartServlet?id="+${pp.id};
		}
	}
</script>

 
	<jsp:include page="foot.jsp" />


</body>
</html>
