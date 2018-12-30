<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../include/header.jsp" %>
  <title>구매자 회원가입</title>
 
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
    
    <div class="col-md-4 col-md-offset-4 text-center"> 
      <div class="page-header">
     		<h1>구매자 회원가입</h1>
  	  </div>
  	  
  	  <div class="jumbotron">
          <form role="form" method="post">
            <div class="form-group text-left">
             <label for="InputEmail"><i class="glyphicon glyphicon-envelope"></i>  이메일</label>
              <input type="email" class="form-control" name="email" placeholder="이메일 주소를 입력하세요" required autofocus>
            </div>
            <div class="form-group text-left">
              <label for="InputPassword1"><i class="glyphicon glyphicon-pencil"></i>  비밀번호</label>
              <input type="password" class="form-control" name="passwd" placeholder="비밀번호를 입력하세요" required>
            </div>
            <div class="form-group text-left">
              <label for="username"><i class="glyphicon glyphicon-user"></i>  이름</label>
              <input type="text" class="form-control" name="name" placeholder="이름을 입력하세요" required>
            </div>
            <div class="form-group text-left">
              <label for="username"><i class="glyphicon glyphicon-phone-alt"></i>  휴대전화번호</label>
              <input type="text" class="form-control" name="phone" placeholder="전화번호를 입력하세요" required>
            </div>
            <div class="form-group text-left">
              <label for="username"><i class="glyphicon glyphicon-home"></i>  주소</label>
              <input type="text" class="form-control" name="address" placeholder="주소를 입력하세요" required>
            </div>
            <input type="hidden"  name="auth" value="0">
        	<br>
            <div class="form-group text-center">
              <button type="reset" class="btn btn-warning glyphicon glyphicon-remove">가입취소</button>
              <button type="submit" class="btn btn-warning glyphicon glyphicon-ok">회원가입</button>
            </div>
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
