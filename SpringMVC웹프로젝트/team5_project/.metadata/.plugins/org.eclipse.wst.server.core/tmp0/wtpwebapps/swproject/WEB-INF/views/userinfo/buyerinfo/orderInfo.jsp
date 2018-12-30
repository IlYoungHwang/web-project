<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
  
<html>
<head>
	<%@include file="../../include/header.jsp" %>
  <title>구매자 주문정보</title>
 
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
  <div class="row content">
    
    <div class="col-md-6 col-md-offset-3 text-center"> 
      <div class="page-header">
     		<h2>구매자 마이 페이지</h2>
  	  </div>
  	  
  	 <div class="btn-group btn-group-justified" role="group">
  		<div class="btn-group" role="group">
    		<a href="profile?no=${login.no}" class="btn btn-default">개인정보</a>
  		</div>
  		<div class="btn-group" role="group">
    		<a href="rentInfo" class="btn btn-default">랜트예약정보</a>
  		</div>
  		<div class="btn-group" role="group">
    		<a href="liceninfo?no=${login.no}" class="btn btn-default">면허정보</a>
  		</div>
  		<div class="btn-group" role="group">
    		<a href="orderInfo" class="btn btn-default">주문정보</a>
  		</div>
  		
	</div>
  	  
      <div class="jumbotron" style="margin-top:20px">
		
				<div class="panel panel-default">
  			<!-- Default panel contents -->
  			<div class="panel-heading text-left">주문정보</div>

  			<!-- Table -->
  			<table class="table">
  				<tr>
    				<th>주문번호</th><th>차종정보</th><th>판매자</th><th>주문일자</th><th>금액</th><th>주문상태</th>
  				</tr>
  				<c:forEach items="${list}" var="orderVO">
  				<tr>
  					<td>${orderVO.orderno}</td><td>${orderVO.usedname}</td><td>${orderVO.username}</td> <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${orderVO.orderdate}"/></td><td>${orderVO.totalmoney}</td><td>OK</td>
  				</tr>
				</c:forEach>
  			</table>
		</div>

  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>

		
		
    </div>
  </div>
</div>
</div>
 



</body>
</html>
