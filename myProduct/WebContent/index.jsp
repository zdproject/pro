<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>bookStore首页</title>
<%--导入css --%>
<link rel="stylesheet" href="css/main.css" type="text/css" />
<link rel="stylesheet" href="linkresource/bootstrap.css"/>
<style type="text/css">
	#myID{
		width:900px;
		margin:0px auto;
	}
	#myId img{
		width:900px;
		height:400px;
		
	}
	#myID a{
		display: block;
		width: 100px;
		height: 100px;
		line-height:100px;
		font-size: 50px;
		margin-top: 150px;
	}
	
	#zdBar{
		height:40px;line-height:40px;
		background:#f9c349;
		z-index:1;
	}
	#zdBar div:hover{background:#f4b03b;z-index:1;cursor:pointer;}
	.zdBActive{background:#f4b03b;margin-left:3%;}
	#zdBar a{color:white;font-size:16px;}
	#zdShow img{height:400px;width:100%}
	#mainPro{margin-left:3%;background:#efecec;padding-bottom:30px;height:400px;overflow:auto;}
	.product{text-align:left;margin-top:30px;border-bottom:1px solid red;float:left;padding-bottom:10px}
	.product ul{list-style:none;}
	.product li{float:left;margin-right:10px;}
	.product li a{font-size:14px;color:black;}
	.product p{clear:both;}
	.product p a{color:#f4b03b;font-size:18px;}
	.productDes h3{margin-top:40px;}
	#cc{margin-bottom:0px;}
	.productDes{margin-top:50px;margin:auto;margin-bottom:0px;width:95%;}
	.productDes:after{
		content:'';
		display:block;
		clear:both;
	}
	.productDes div{}
	.productDes h3{text-align:left;padding:0px 10px;
		width:200px;height:50px;line-height:50px;
		background:#f4b03b;font: "微软雅黑";
	}
	.productDes hr{background:#f4b03b;width:95%;height:1px;margin:0px}
	.datu{
		width:60%;height:300px;float:left;
	}
	.productDes img:hover{box-shadow:1px 1px 10px #f9c349}
	.xiaotu{width:40%;height:150px;float:left;}
	.hengtu{width:100%;clear:both;height:130px;margin-top:15px;}
	 .proMain{width:31%;float:left;margin-right:1%;}
	 .proMain h4{text-align:left; background:#f4b03b;font: "微软雅黑";	
	 	height:50px;line-height:50px;padding-left:12px;
	 }
	 #test{overflow:hidden;}
	 
	 .zdIndex{height:480px;background-repeat:no-repeat; background-size: cover;}
	 .szdIndex{margin-left:3%;padding:0px;}
	 .szdIndex ul{list-style:none;width:100%;margin:0px;}
	 .szdIndex li{height:80px;line-height:100px;background:rgba(30,30,100,0.5);cursor:pointer;
	 	border-bottom:1px solid white;font-size:16px;color:white;
	 }
	 .szdIndex li:hover{background:lightgray;}
</style>

</head>

<body class="main" onload="show('ad/1.jpg')">

	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp"%>
	<div id="cc">
	<div class='container-fluid'>
		<div class='row' id="zdBar">
			<a href="#"><div class='col-lg-2 col-md-2 col-sm-2 col-xs-2 zdBActive'>产品分类</div></a>
			<a href="${pageContext.request.contextPath}/showProductByPageServlet?category=literature"><div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>首页</div></a>
			<a href="${pageContext.request.contextPath}/showProductByPageServlet?category=life"><div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>地方馆</div></a>
			<a href="${pageContext.request.contextPath}/showProductByPageServlet?category=computer"><div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>地方馆</div></a>
			<a href="${pageContext.request.contextPath}/showProductByPageServlet?category=english"><div class='col-lg-2 col-md-2 col-sm-2 col-xs-2'>地方馆</div></a>
		</div>
		<div class="row zdIndex" id="zd1">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 szdIndex">
				<ul>
					<li onmouseover="show('ad/2.jpg')">大米好</li>
					<li onmouseover="show('ad/3.jpg')">土壤好</li>
					<li onmouseover="show('ad/4.jpg')">水源好</li>
					<li onmouseover="show('ad/5.jpg')">气候好</li>
					<li onmouseover="show('ad/2.jpg')">品种好</li>
					<li onmouseover="show('ad/1.jpg')">质量好</li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	<div class="productDes">
			<h3>活动专区</h3><hr>
			<div>
			<div class="proMain">
				<h4>折扣专区</h4>
				<img class="datu" alt="datupian" src="">
				<img class="xiaotu" alt="xiaotupain" src="">
				<img class="xiaotu" alt="xiaotupian" src="">
				<img class="hengtu" alt="hengtupian" src="">
			</div>
			<div class="proMain">
				<h4>包邮专区</h4>
				<img class="datu" alt="tupian" src="">
				<img class="xiaotu" alt="tupian" src="">
				<img class="xiaotu" alt="tupian" src="">
				<img class="hengtu" alt="tupian" src="">
			</div>
			<div class="proMain">
				<h4>买赠专区</h4>
				<img class="datu" alt="tupian" src="">
				<img class="xiaotu" alt="tupian" src="">
				<img class="xiaotu" alt="tupian" src="">
				<img class="hengtu" alt="tupian" src="">
			</div>
		</div>
		</div>
	<jsp:include page="foot.jsp"/>
	
	<script type="text/javascript">
	var as=document.getElementById('zd1');
	function show(str){
		as.style.background="url("+str+")";
		as.style.backgroundRepeat="no-repeat";
		as.style.backgroundSize="cover";
	}


</script>
	
	<script src="linkresource/jquery-2.1.0.js"></script>
	<script src="linkresource/bootstrap.js"></script>
</body>
</html>
