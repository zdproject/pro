<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>

<link rel="stylesheet" href="css/main.css" type="text/css" />

<style type="text/css">
	#hr{height:10px;background: linear-gradient(to top, white, lightgray);}
	#divcontent{margin-top:20px;}
	#divcontent {
	width: 75%;padding:20px 30px;
	background-color: #FCFDEF;
	border: 1px solid #EEEDDB;
	MARGIN-LEFT: 10%;
	}
	#divcontent td{}
	#divcontent td{font-size:16px;}
	#zdta td{
		height:30px;line-height:30px;padding-bottom:10px;
	}
	#zdta td input[type="text"]{height:30px;line-height:30px;font-size:14px;}
	#zdta td input[type="password"]{height:30px;line-height:30px;font-size:14px;}
	#zdta td input[type="image"]{height:30px;width:90px;}
	#loadtu{width:100%;height:100%;}
	
	#logindiv {
	background-image: url(images/loginbg.gif);
	width: 305px;
	height: 361px;
	background-repeat: no-repeat;
	margin: 20px;
}
	
</style>
</head>

<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="hr"></div>
	<div id="divcontent">
		<form action="${pageContext.request.contextPath }/loginServlet" method="post">
			<table width="100%" border="0" cellspacing="0">
				<tr>
					<td><div style="height:440px">
							<b>&nbsp;&nbsp;首页&nbsp;&raquo;&nbsp;个人用户登录</b>
							<div>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<div id="logindiv">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td style="text-align:center; padding-top:20px"><img
															src="images/logintitle.gif" width="150" height="30" />
														</td>
													</tr>
													<tr>
														<td style="text-align:center;padding-top:20px;"><font
															color="#ff0000">${requestScope["user_msg"]}</font>
														</td>
													</tr>
													<tr>
														<td style="text-align:center">
															<table width="80%" border="0" cellspacing="0"
																style="margin-top:15px ;margin-left:auto; margin-right:auto" id="zdta">
																<tr>
																	<td
																		style="text-align:right;width:25%">用户名：</td>
																	<td style="text-align:left"><input name="username"
																		type="text" class="textinput" />
																	</td>
																</tr>
																<tr>
																	<td style="text-align:right; ">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
																	<td style="text-align:left"><input name="password"
																		type="password" class="textinput" />
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="text-align:center"><input
																		type="checkbox" name="checkbox" value="checkbox" />
																		记住用户名&nbsp;&nbsp; <input type="checkbox"
																		name="checkbox" value="checkbox" /> 自动登录</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center"><input
																		name="image" type="image" onclick="formcheck()"
																		src="images/loginbutton.gif" width="30%" height="22" 
																		style="margin:auto;"/>
																	</td>
																</tr>

																<tr>
																	<td colspan="2" style="padding-top:10px"><img
																		src="images/loginline.gif" width="95%" height="10" />
																	</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center"><a
																		href="register.jsp"><img name="image"
																			src="images/signupbutton.gif" width="50%" height="33" />
																	</a></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</div></td>
										<td style="text-align:left; padding-top:27px; width:90%">
											<img src='' alt="tupian" id="loadtu"/>
										<!--  	<h1>您还没有注册？</h1>
											<p>注册新会员，享受更优惠价格!</p>
											<p>千种图书，供你挑选！注册即享受丰富折扣和优惠，便宜有好货！超过万本图书任您选。</p>
											<p>超人气社区！精彩活动每一天。买卖更安心！支付宝交易超安全。</p>
											<p style="text-align:right">
												<a href="register.jsp"><img
													src="images/signupbutton.gif" width="135" height="33" /> </a>
											</p>-->
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
