<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../include/header.jsp" %>
  <title>구매자 로그인</title>
  
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
  
<div class="container-fluid" style="margin-top:50px">    
  <div class="row content">
    
    <div class="col-md-6 col-md-offset-3 text-center"> 
      <div class="page-header">
     		<h1>구매자 로그인</h1>
  	  </div>
      <div class="jumbotron">
  	   		<form class="form-signin" action="/userview/loginPost" method="post">
      		<img class="mb-4" src="/resources/dist/img/keyhole.png" alt="" width="72" height="72">
      		<h3 class="h3 mb-3 font-weight-normal">어서오세요!</h3>
      		<label for="inputEmail" class="sr-only">Email address</label>
      		<input type="email" name="email" class="form-control" placeholder="Email address" required autofocus>
      		<label for="inputPassword" class="sr-only">Password</label>
      		<input type="password" name="passwd" class="form-control" placeholder="password" required>
      		<div class="checkbox mb-3">
        	<label><input type="checkbox" value="remember-me"> 아이디저장</label>
      		</div>
      			<button class="btn btn-lg btn-warning btn-block" type="submit">로그인</button>
    		</form>
    		<strong>회원이 아니신가요?</strong><a href="#">회원가입</a>
  	   </div>
    </div>
  </div>
</div>
 
 



<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
