<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<html>
<head>
	<%@include file="../../include/header.jsp" %>
  <title>구매자 면허정보</title>
 
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
		
		<form role="form" method="post">
			<div class="form-group text-left">
				<label for="exampleInputEmail1">이름</label>
				<input type="text" class="form-control" value="${licenVO.name}" name="name" placeholder="이름">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">법적생일</label>
				<input type="text" class="form-control" value="${licenVO.birth}" name="birth" placeholder="법적생일">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">면허종류</label>
				<select class="form-control" name="licentype">
  					<option selected>${licenVO.licentype}</option>
				</select>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">면허번호</label>
				<input type="text" class="form-control" value="${licenVO.licennum}" name="licennum" placeholder="면허번호">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">발급일</label>
				<input type="text" class="form-control" value="${licenVO.issu}" name="issu" placeholder="발급일">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">갱신기간 만료일</label>
				<input type="text" class="form-control" value="${licenVO.expir}" name="expir" placeholder="갱신기간">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">주소</label>
				<input type="text" class="form-control" name="address" value="${login.address}" placeholder="주소">
			</div>
				<input type="hidden" class="form-control" name="no" value="${login.no}" placeholder="주소">
				<button type="submit" class="btn btn-warning">취소</button>
				<button type="submit" class="btn btn-warning">수정</button>
		</form>
    </div>
  </div>
</div>
</div>
 



<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
