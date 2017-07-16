<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线支付</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

<script type="text/javascript" src="js/my.js">
	
</script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
	form{width:70%;margin:auto;margin-top:20px;text-align:center;}
	.divBank{margin-top:10px;border-top:1px solid #f9c349;
		border-bottom:1px solid #f9c349;padding:10px;
	}
	form input[type="text"]{height:30px;line-height:30px;font-size:14px;
		border:1px solid #63c425;
	}
</style>

</head>

<body>
	<jsp:include page="head.jsp" />
	
	<form action="paysuccess.jsp" method="post">
		订单号：<INPUT TYPE="text" NAME="orderid" value="001" readonly="readonly"> 支付金额：<INPUT
			TYPE="text" NAME="money" value="1000" readonly="readonly">元
		<div class="divBank">
			<div class="divText">选择网上银行</div>
			<div style="margin-left: 20px;">
				<div style="margin-bottom: 20px;">
					<input id="ICBC-NET-B2C" type="radio" name="yh"
						value="ICBC-NET-B2C" checked="checked" />
						 <img
						name="ICBC-NET-B2C" align="middle"
						src="bank_img/icbc.bmp" /> 
						<input
						id="CMBCHINA-NET-B2C" type="radio" name="yh"
						value="CMBCHINA-NET-B2C" />
						 <img name="CMBCHINA-NET-B2C"
						align="middle" src="bank_img/cmb.bmp"/> 
						<input
						id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C" /> 
						<img
						name="ABC-NET-B2C" align="middle"
						src="bank_img/abc.bmp"/> 
						<input
						id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" />
						 <img
						name="CCB-NET-B2C" align="middle"
						src="bank_img/ccb.bmp" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="BCCB-NET-B2C" type="radio" name="yh"
						value="BCCB-NET-B2C" /> 
						<img name="BCCB-NET-B2C" align="middle"
						src="bank_img/bj.bmp" /> <input
						id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C" />
					<img name="BOCO-NET-B2C" align="middle"
						src="bank_img/bcc.bmp" />
						 <input
						id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C" /> 
						<img
						name="CIB-NET-B2C" align="middle"
						src="bank_img/cib.bmp" /> <input
						id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C" />
					<img name="NJCB-NET-B2C" align="middle"
						src="bank_img/nanjing.bmp" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="CMBC-NET-B2C" type="radio" name="yh"
						value="CMBC-NET-B2C" /> 
						<img name="CMBC-NET-B2C" align="middle"
						src="bank_img/cmbc.bmp" /> <input
						id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C" /> <img
						name="CEB-NET-B2C" align="middle"
						src="bank_img/guangda.bmp" /> <input
						id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C" /> <img
						name="BOC-NET-B2C" align="middle"
						src="bank_img/bc.bmp" /> <input
						id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET" />
					<img name="PINGANBANK-NET" align="middle"
						src="bank_img/pingan.bmp" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="CBHB-NET-B2C" type="radio" name="yh"
						value="CBHB-NET-B2C" /> <img name="CBHB-NET-B2C" align="middle"
						src="bank_img/bh.bmp" /> <input
						id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C" />
					<img name="HKBEA-NET-B2C" align="middle"
						src="bank_img/dy.bmp" /> <input
						id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C" />
					<img name="NBCB-NET-B2C" align="middle"
						src="bank_img/ningbo.bmp" /> <input
						id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C" />
					<img name="ECITIC-NET-B2C" align="middle"
						src="bank_img/zx.bmp" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C" />
					<img name="SDB-NET-B2C" align="middle"
						src="bank_img/sfz.bmp" /> <input
						id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C" /> <img
						name="GDB-NET-B2C" align="middle"
						src="bank_img/gf.bmp" /> <input
						id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C" /> <img
						name="SHB-NET-B2C" align="middle"
						src="bank_img/sh.bmp" /> <input
						id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C" />
					<img name="SPDB-NET-B2C" align="middle"
						src="bank_img/shpd.bmp" />
				</div>
				<div style="margin-bottom: 20px;">
					<input id="POST-NET-B2C" type="radio" name="yh"
						value="POST-NET-B2C" /> <img name="POST-NET-B2C" align="middle"
						src="bank_img/post.bmp" /> <input
						id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C" />
					<img name="BJRCB-NET-B2C" align="middle"
						src="bank_img/beijingnongshang.bmp" /> <input
						id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C" /> <img
						name="HXB-NET-B2C" align="middle"
						src="bank_img/hx.bmp" /> <input id="CZ-NET-B2C"
						type="radio" name="yh" value="CZ-NET-B2C" /> <img
						name="CZ-NET-B2C" align="middle"
						src="bank_img/zheshang.bmp" />
				</div>
			</div>
			<div style="margin:auto;border-radius:5px;width:180px;height:40px;text-align:center;line-height:40px;background:#63c425" onmouseout="this.style.backgroundColor='#63c425'" onmouseover="this.style.backgroundColor='#5ab122'">
										<a href="#" style="color:white;font-size:16px;">确认支付	</a>
									</div>
		</div>
	</form>
</body>
</html>
