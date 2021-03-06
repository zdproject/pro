<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
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

	<div id="divpagecontent">
	<hr class="zdFir">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详细信息
					</div>



					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p>订单编号:001</p></td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="40%">商品名称</td>
													<td width="10%">价格</td>
													<td width="10%">数量</td>
													<td width="10%">小计</td>

												</tr>
											</table>
									
									<c:forEach items="${productsInfo }" var="o" varStatus="vs">
											<table width="100%" border="0" cellspacing="0">
												<tr>
													<td width="10%">${vs.count }</td>
													<td width="40%">${o.product.name }</td>
													<td width="10%">${o.product.price }</td>
													<td width="10%">${o.buynum }</td>
													<td width="10%">${o.buynum * o.product.price }</td>

												</tr>
											</table>
											<c:set var="totalPrice" value="${totalPrice+o.buynum * o.product.price }"></c:set>
										</c:forEach>
											

											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font style="color:#FF0000">合计：&nbsp;&nbsp;${totalPrice}</font></td>
												</tr>
											</table>


											<hr>
											<p style="text-align:right">
												<a href="pay.jsp"><img src="images/gif53_029.gif" width="204"
													height="51" border="0" /> </a>
											</p>
										</td>
									</tr>
								</table>
							</td>


						</tr>


					</table>
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
