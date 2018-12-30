<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
  
<html>
<head>
	<%@include file="../../include/header.jsp" %>
  <title>판매자 중고차량 정보</title>
  <script type="text/javascript">
  	var result = '${msg}'
  	
  	if(result == 'usedmove'){
  		alert("삭제가 완료되었습니다.");
  	} else if(result == 'modify'){
  		alert("수정이 완료되었습니다.");
  	}
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
        <li><a href="/carview/rentList">렌트차량</a></li>
        <li><a href="/carview/usedList">중고차량</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${empty login and empty sellerlogin}">
        <li><a href="userview/mainLogin"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <li><a href="userview/mainSign"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
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
  
  
  
<div class="container-fluid" style="margin-top:50px">    
	<div class="page-header text-center">
		<h2>중고차량 등록 목록</h2>
  	  </div>
  
		<div class="row content">    
			<div class="col-md-6 col-md-offset-3 text-center"> 
				<div class="btn-group btn-group-justified" role="group">
					<div class="btn-group" role="group">
						<a href="profile?no=${sellerlogin.no}" class="btn btn-default">개인정보</a>
					</div>
					<div class="btn-group" role="group">
						<a href="rentInfo" class="btn btn-default">나의 렌트차량</a>
					</div>
					<div class="btn-group" role="group">
						<a href="usedInfo" class="btn btn-default">나의 중고차량</a>
					</div>
				</div>
  	  
		<div class="jumbotron" style="margin-top:20px">
			<div class="panel panel-default">
  			<!-- Default panel contents -->
  			<div class="panel-heading text-left">주문정보</div>

  			<!-- Table -->
  			<table class="table">
  				<tr>
    				<th>번호</th><th>차량이름</th><th>등록일자</th><td>판매승인</td>
  				</tr>
  				<c:forEach items="${list}" var="usedVO">
  				<tr>
  					<td>${usedVO.no}</td><td><a href="usedPage${pageMaker.makeQuery(pageMaker.cri.page) }&no=${usedVO.no}">${usedVO.name}</a></td><td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${usedVO.regdate}"/></td><td>${usedVO.appro}</td>
  				</tr>
				</c:forEach>
  			</table>
		</div>
		
		<div class=".col-md-6 text-right">
		<a href="usedAdd"><button class="btn btn-warning">중고 차량 등록</button></a>
		</div>
		
		
		
<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="usedInfo${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="usedInfo${pageMaker.makeQuery(idx)}">${idx}</a> 
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="usedInfo${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a></li>
							</c:if>
						</ul>
	</div>
		
		
		
		</div>
		
		
		
		
    </div>
  
</div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
