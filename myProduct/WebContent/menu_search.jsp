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
						document.getElementById("content").innerHTML += "<div onclick='fillNameValue(this)'  onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)'>"
								+ ss[i] + "</div>"
					} 
					document.getElementById("content").innerHTML += "<div onclick='del()' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)' style='font-size:18px;text-align:center;color:#cccccc;padding-top:3px;padding-bottom:3px;'>x</div>"
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
	
	function changeBackground_over(div){
		div.style.background="gray";
	}
	 
	function changeBackground_out(div){
		div.style.background="white";
	}

</script>

<div id="divmenu">
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=literature">脑</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=life">子</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=computer">是</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=english">个</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=经管">好</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=励志">东</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=社科">西</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=学术">，</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=少儿">可</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=艺术">惜</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=原版" style="font-size:25px;">李</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=科技" style="font-size:18px;">敏</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=考试">没</a>
	<a
		href="${pageContext.request.contextPath}/showProductByPageServlet?category=生活百科">有</a>
		
	<a href="${pageContext.request.contextPath}/showProductByPageServlet" style="color:#FFFF00">！&nbsp;！&nbsp;！</a>
</div>
<div id="divsearch">
	<form action="${pageContext.request.contextPath}/findProductBySearchServlet"
		method="post">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td style="text-align:right; padding-right:220px">
				Search <input
					type="text" name="name" class="inputtable"  onkeyup="searchName();"
					id="name" autocomplete="off" /> 
					<input type="image" src="images/serchbutton.gif"
					border="0" style="margin-bottom:-4px">
				</td>
			</tr>
		</table> 

	</form>
</div>
<div id="content"  style="position:absolute;z-index:999;background-color:white;width:128px; text-align:left;margin-left:945px;color:black;float:left;margin-top: -20px;display: none">
</div>