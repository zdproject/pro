<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/my.js">
	
</script>
<script type="text/javascript">

	function fillNameValue(subDiv) {
		document.getElementById("name").value = subDiv.innerHTML;
	
		document.getElementById("content").style.display="none";
	}
	function del() {
		document.getElementById("content").style.display="none";
	}
	//var nameElement = document.getElementById("name");
	//nameElement.onblur=function(){
	//	document.getElementById("content").innerHTML='';
		//document.getElementById("content").style.display="none";
	//}
	function searchName() {
		var nameElement = document.getElementById("name");
		//获取输入的信息
		var nameValue = nameElement.value;
		
		document.getElementById("content").innerHTML = "";
		
		//1.获取XMLHttpRequest对象
		var xmlhttp = getXMLHttpRequest();
		
		//2.绑定回调函数
		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				
				var ss = eval("(" + xmlhttp.responseText + ")");//得到服务器返回的数据
		
				if(ss.length>0){
					document.getElementById("content").style.display="block";
					for ( var i = 0; i < ss.length && i < 5 ; i++) {
						document.getElementById("content").innerHTML += "<div onclick='fillNameValue(this)'>"
								+ ss[i] + "</div>"
					} 
				} 
			}  
		};
		//2.open方法建立连接--设置请求方法（get\post）并设置请求链接
		xmlhttp.open("GET",
				"${pageContext.request.contextPath}/findProductNameServlet?name="
						+ window.encodeURIComponent(nameValue, "utf-8")
						+ "&time=" + new Date().getTime());
		//3.send方法发送内容（若通过get传递，则填null）
		xmlhttp.send(null);
	};
	var con=document.getElementById('content');
	var nameElement = document.getElementById("name");
	document.addEventListener('click',function(event){
		if(event.target==con){nameElement.valeu=con.innerHTML;del()}
		else if(event.target!=nameElement){del()};
	},false
	)
</script>
<style  type="text/css">
	#zdSearch{
		width:100%;	
		height:150px;
		overflow:hidden;
		margin-bottom:5px;
	}
	#zdSearch:after{
		content:'';
		display:block;
		clear:all;
	}
	#zdImg{width:25%;float:left;height:150px;}
	#zdImg img{width:50%;margin-top:15px;}
	#serbar{width:75%;float:left;height:150px;}
	#serbar form{width:50%;margin-top:20px;}
	#name{width:85%}
	#serchBnt{width:15%;background:#f9c349;}
	#serchBnt:hover{background:#f4b03b;border:2px solid #f4b03b;}
	#name,#serchBnt{height:40px;font:"微软雅黑";font-size:16px;border:2px solid #f9c349;margin:0px;padding:0px}
	.btnS{width:100%;height:30px;color:#e28b1b;border:none;
		line-height:30px;float:left;font-size:16px;}
	#zdMore ul{list-style:none;}
	#zdMore li{float:left;border-right:1px solid lightgray;padding:0px 5px;color:gray;}
	#zdMore li a{color:gray;}
	#zdMore{margin-left:3%;}
	#content div{
		height:20px;line-height:20px;width:85%;text-align:left;
		font-size:18px;
		padding:0px 5px;
		background:white;
	}
	#content div:hover{background:gray;}
	#zdAside{
		width:35px;
		
		position:fixed;
		right:0px;top:0px;
		background:#40444e;
		font-size:16px;
		z-index:9999;
	}
	#zdAside{height:100%;}
	#gouwuche{height:45%;display:flex;flex-direction:column-reverse;}
	#guanzhu{height:45%;display:flex;align-items:center;}
	#huidao{height:10%;display:flex;align-items:center;}
</style>
<div id="zdSearch">
	<div id="zdImg"><a href="index.jsp" style="display:block;"><img src="images/ricelogo.jpg" /></a>
	</div>
	<div id="serbar">
		<form action="${pageContext.request.contextPath}/findProductBySearchServlet"
		method="post">
			<marquee class='btnS'>现在是一个测试环节哟，测试环节哟哟!&nbsp;&nbsp;&nbsp;&nbsp;现在是一个测试环节哟，测试环节哟哟!
				&nbsp;&nbsp;&nbsp;&nbsp;现在是一个测试环节哟，测试环节哟哟!&nbsp;&nbsp;&nbsp;&nbsp;现在是一个测试环节哟，测试环节哟哟!</marquee><input type="text" placeholder="请输入搜索商品的名称" name="searchText" 
			onkeyup="searchName();" id="name" autocomplete="off"/><input type="button" value="搜索" id="serchBnt"/>
		<div id="content"></div>
		</form>
		<div id="zdMore">
			<ul>
				<li><a href="#">五常稻花香</a></li>
				<li><a href="#">长粒香</a></li>
				<li><a href="#">有机大米</a></li>
				<li><a href="#">鸭稻米</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="zdAside">
	<div id="gouwuche">
	<a href="${pageContext.request.contextPath }/lookCartServlet"><img src="zdImg/gouwu.png" onMouseOver="this.src='zdImg/gouwuche2.png'" onMouseOut="this.src='zdImg/gouwu.png'"/></a></div>
	<div id="guanzhu">
	<a onclick="change(window.location,'米店')" href="#">
	<img src="zdImg/guanzhu.png" onMouseOver="this.src='zdImg/guanzhu2.png'" onMouseOut="this.src='zdImg/guanzhu.png'"/></a></div>
	<div id="huidao">
	<a href="#zdSearch"><img src="zdImg/huidao.png" onMouseOver="this.src='zdImg/huidao2.png'" onMouseOut="this.src='zdImg/huidao.png'"/></a></div>
</div>
<script  type="text/javascript">
	function change(siteUrl,siteName){
		try        {      
			 //判断浏览器是否支持document.all         
			if(document.all){                      
			//如果支持则用external方式加入收藏夹                       
			window.external.addFavorite(siteUrl,siteName);                
			 }else if(window.sidebar){                      
			  //如果支持window.sidebar，则用下列方式加入收藏夹    
			                
			window.sidebar.addPanel(siteName, siteUrl,'');            
			}                
			}   
			//处理异常      
			 catch (e)        {          
			 alert("加入收藏夹失败，请使用Ctrl+D快捷键进行添加操作!");     
			  }
	}
	
</script>
		



