<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/main.css" type="text/css" />
	
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
		<table border="0" cellspacing="0">
			<tr>

				<td>
					<div style="text-align:right; margin-right:50px;">
						<a href="index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;计算机&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;图书列表
					</div>

					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>计算机</h1>&nbsp;&nbsp;&nbsp;&nbsp;共100种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img
										src="${pageContext.request.contextPath }/images/productlist.gif"
										width="100%" height="38" />
								</div>

								<table cellspacing="0" class="booklist">
									<tr>
										<c:forEach items="${pb.products }" var="b">
											<td>

												<div class="divbookpic">
													<p>
														<a href="${pageContext.request.contextPath }/findBookInfoServlet?id=${b.id}"><img
															src="${pageContext.request.contextPath }/upload/${b.imgurl}"
															width="115" height="129" border="0" /> </a>
													</p>
												</div>

												<div class="divlisttitle">
													<a
														href="${pageContext.request.contextPath }/findBookInfoServlet?id=${b.id}">书名:${b.name
														}<br />售价:${b.price } </a>
												</div>
											</td>
										</c:forEach>
									</tr>
								</table>

								<div class="pagination">
									<ul>


										<li class="disablepage" style="border:0px solid red;"><a
											href="${pageContext.request.contextPath  }/showProductByPageServlet?currentPage=${pb.currentPage==1?1:pb.currentPage-1}&category=${pb.category}">上一页</a>
										</li>


										<li>第${pb.currentPage }页/共${pb.totalPage }页</li>

										<li class="nextPage"><a
											href="${pageContext.request.contextPath  }/showProductByPageServlet?currentPage=${pb.currentPage==pb.totalPage?pb.totalPage:pb.currentPage+1}&category=${pb.category}">下一页</a>
										</li>


									</ul>
								</div></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
