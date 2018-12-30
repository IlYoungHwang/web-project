<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../include/header.jsp" %>
  <title>렌트차량 목록</title>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on("click",function(event) {

							self.location = "rentList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});
</script>  

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/"><img src="/resources/dist/img/credit/html-5.png" class="img-responsive"  width="28" height="28"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="rentList">렌트차량</a></li>
        <li><a href="usedList">중고차량</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${empty login and empty sellerlogin}">
        <li><a href="/userview/mainLogin"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <li><a href="/userview/mainSign"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
        </c:if>
       	<c:if test="${not empty login}">
       	<li><a href="/userinfo/buyerinfo/profile?no=${login.no}"><span class="glyphicon glyphicon-log-in"></span> 회원정보</a></li>
        <li><a href="/userview/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
       	</c:if>
       	<c:if test="${not empty sellerlogin}">
       	<li><a href="/userinfo/sellerinfo/profile?no=${sellerlogin.no}"><span class="glyphicon glyphicon-log-in"></span> 회원정보</a></li>
        <li><a href="/userview/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
  
  
  
<div class="container text-center" style="margin-top:100px">
	<div class="page-header text-center">
		<h2>렌트 차량 목록</h2>
	</div>
	
			<div class="row">
			<div class=".col-xs-6 .col-md-4">
				<select name="searchType" >
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							차종</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							대여위치</option>
					</select> 
					
					<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' >
					
					<button id='searchBtn' class="btn btn-default">Search</button>
				
			</div>
			
			</div>
			<br>
			
		<div class="jumbotron">
			<div class="row">
			
				<c:forEach items="${list}" var="rentVO">
				<div class="col-sm-3 col-md-3">
 					<div class="thumbnail">
						<img src="/displayFile?fileName=${rentVO.fullName}" alt="이미지" width="300" height="300">
						<div class="caption">
							<h3>${rentVO.name}</h3>
							<p>대여료 ${rentVO.fee}원</p>
							<p>대여 ${rentVO.state}</p>
							<p><a href="/orderview/rentReser${pageMaker.makeSearch(pageMaker.cri.page)}&no=${rentVO.no}" class="btn btn-primary" role="button">예약하기</a></p>
						</div>
					</div>
 				</div>   
 				</c:forEach>
			</div>
		</div>
		
		<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="rentList${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="rentList${pageMaker.makeSearch(idx)}">${idx}</a> 
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="rentList${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
							</c:if>
						</ul>
	</div>
		
</div>
 



<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
