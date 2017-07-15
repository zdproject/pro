<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<style type="text/css">
	#divpagecontent{width:90%;margin-left:3%;}
	#divpagecontent hr{background:linear-gradient(to top, white, #f9c349);border:#f9c349;
margin:auto;
width:100%;height:2px;padding-bottom:5px;}
	#divpagecontent table{width:90%;margin:auto;margin-top:10px;}
	#divpagecontent td{font-size:16px;}
	#divpagecontent td a{font-size:16px;}
	#divpagecontent td input[type="text"]{height:20px;line-height:20px;font-size:16px;}
	#divpagecontent td input[type="submit"]{height:20px;line-height:20px;font-size:16px;}
	#divpagecontent td input[type="password"]{height:20px;line-height:20px;font-size:16px;}
</style>
</head>

<body class="main">
	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
	<hr>
		<table border="0" cellspacing="0">
			<tr>
				<td width="20%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath }/findUserByIdServlet">用户信息修改</a>
							</td> 
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/findOrderByUserIdServlet">订单查询</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/logoutServlet">用戶退出</a></td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin-right:50px;">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改
					</div>





					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<form action="${pageContext.request.contextPath }/modifyUserServlet" method="post">
									<input type="hidden" name="id" value="${uu.id }"/>
									<table width="70%" border="0" cellspacing="2" class="upline">
										<tr>
											<td style="text-align:right; width:20%">会员邮箱：</td>
											<td style="width:40%; padding-left:20px">${uu.email }</td>
											<td>&nbsp;</td>


										</tr>
										<tr>
											<td style="text-align:right">会员名：</td>
											<td style="padding-left:20px">${uu.username }</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">修改密码：</td>
											<td><input type="password" name="PASSWORD"
												class="textinput" /></td>
											<td><font color="#999999">密码设置至少6位，请区分大小写</font></td>
										</tr>
										<tr>
											<td style="text-align:right">重复密码：</td>
											<td><input type="password" class="textinput" /></td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td style="text-align:right">性别：</td>
											<td colspan="2">&nbsp;&nbsp;<input type="radio"
												name="gender" value="男" ${uu.gender== "男"? "checked='checked' ":"" } />
												男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
												type="radio" name="gender" value="女" ${uu.gender==
												"女"? "checked='checked' ":"" } /> 女</td>
										</tr>
										<tr>
											<td style="text-align:right">联系方式：</td>
											<td colspan="2"><input name="telephone" type="text"
												value="${uu.telephone }" class="textinput" /></td>
										</tr>

										<tr>
											<td style="text-align:right">&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>
 
									<p style="text-align:center" width="30%">

										<input type="image" src="images/botton_gif_025.gif" border="0">
 
									</p>
									<p style="text-align:center">&nbsp;</p>
								</form>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
