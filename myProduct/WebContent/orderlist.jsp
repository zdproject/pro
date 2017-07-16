<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<style type="text/css">
	#divpagecontent{width:90%;margin-left:3%;margin-top:10px;margin-bottom:10px;}
	#divpagecontent hr{background:linear-gradient(to top, white, #f9c349);border:#f9c349;
margin:auto;
width:100%;height:2px;padding-bottom:5px;}
#divpagecontent table{width:90%;margin:auto;margin-top:10px;}
	#divpagecontent td{font-size:16px;}
	#divpagecontent td a{font-size:16px;}
</style>
</head>

<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
	<hr>
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%"><table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="modifyuserinfo.jsp">用户信息修改</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="orderlist.jsp">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">用戶退出</a></td>
						</tr>




					</table>
				</td>
				<td><div style="text-align:right; margin-right:50px;">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单查询
					</div>


					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>欢迎xxx光临商城！</p>
								<p>
									您有<font style="color:#FF0000">${count }</font>个订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">收件人</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">联系方式</td>
										<td bgcolor="#A3B6E6" class="tableopentd01" style="width:25%">收货地址</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">订单时间</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">状态</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									
										
									</tr>
					
						<c:forEach items="${orders }" var="order" varStatus="vs">
									<tr>
										<td class="tableopentd02">${vs.count }</td>
										<td class="tableopentd02">${order.receiverName }</td>
										<td class="tableopentd02">${order.receiverPhone }</td>
										<td class="tableopentd02">${order.receiverAddress }</td>	
										<td class="tableopentd02">${order.ordertime }</td>
										<td class="tableopentd02">${order.paystate==0? "未支付":"已支付"}</td>
										<td class="tableopentd03"><a href="${pageContext.request.contextPath }/findOrderItemsByOrderIdServlet?orderid=${order.id}">查看</a>&nbsp;&nbsp;<a href="#">刪除</a></td>

									</tr>
			
						</c:forEach>		
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



<!-- 	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" />
				</td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a>
				</td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2008 &copy; eShop All Rights RESERVED.</b> </font>
				</td>
			</tr>
		</table>
	</div> -->

<jsp:include page="foot.jsp" />
</body>
</html>
