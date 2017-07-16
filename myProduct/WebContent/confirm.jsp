<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<script type="text/javascript" src="js/my.js">
	
</script>
<style type="text/css">
	#zdPay{width:90%;margin-left:3%;border:1px solid black;margin-top:20px;padding:10px 0px 10px 10px;}
	#zdPay h3{border-bottom:1px solid black;padding:2px 0px;}
	#zdPay input{height:30px;line-height:30px;margin-top:5px;}
	#zdPay input[type="submit"]{height:30px;margin-left:30px;padding:2px;}
	#zdPay input[type="submit"]:hover{box-shadow:1px 1px 10px #f9c349}
</style>
</head>
<body>
	<%@include file="head.jsp"%>
	<div id="zdPay">
	<p:user />
	<!-- 确认支付form -->
	<form action="https://www.yeepay.com/app-merchant-proxy/node"
		method="get">
		<h3>订单号：${p2_Order},付款金额 ：${p3_Amt }</h3>
		<input type="hidden" name="pd_FrpId" value="${pd_FrpId }" /> <input
			type="hidden" name="p0_Cmd" value="${p0_Cmd }" /> <input
			type="hidden" name="p1_MerId" value="${p1_MerId }" /> <input
			type="hidden" name="p2_Order" value="${p2_Order }" /> <input
			type="hidden" name="p3_Amt" value="${p3_Amt }" /> <input
			type="hidden" name="p4_Cur" value="${p4_Cur }" /> <input
			type="hidden" name="p5_Pid" value="${p5_Pid }" /> <input
			type="hidden" name="p6_Pcat" value="${p6_Pcat }" /> <input
			type="hidden" name="p7_Pdesc" value="${p7_Pdesc }" /> <input
			type="hidden" name="p8_Url" value="${p8_Url }" /> <input
			type="hidden" name="p9_SAF" value="${p9_SAF }" /> <input
			type="hidden" name="pa_MP" value="${pa_MP }" /> <input type="hidden"
			name="pr_NeedResponse" value="${pr_NeedResponse }" /> <input
			type="hidden" name="hmac" value="${hmac }" /> <input type="submit"
			value="确认支付" />
	</form></div>
	<%@include file="foot.jsp"%>
</body>
</html>