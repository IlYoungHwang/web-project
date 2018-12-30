<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../../include/header.jsp" %>
  <title>판매자 개인정보</title>
 <script>
  		var result = '${msg}'
	  	
	  	if(result == 'success'){
	  		alert("회원정보 변경 완료!!");
	  	} 
  		
  		$(document).ready(function() {

  			var formObj = $("form[role='form']");

  			console.log(formObj);

  			$(".btn-warning").on("click", function() {
  				self.location = "/userinfo/sellerinfo/profile?no=${userVO.no}";
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
     		<h2>판매자 계정관리</h2>
  	  </div>
  	
  	  
      <div class="jumbotron" style="margin-top:20px">
      	<form method="post">
			<div class="form-group text-left">
				<label for="exampleInputEmail1">이메일</label>
				<input type="email" class="form-control" name="email" value="${userVO.email}" placeholder="이메일을 입력하세요">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">이름</label>
				<input type="text" class="form-control"  name="name" value="${userVO.name}" placeholder="이름을 입력하세요">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">휴대전화번호</label>
				<input type="text" class="form-control" name="phone" value="${userVO.phone}" placeholder="전화번호를 입력하세요">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">주소</label>		
				<input type="text" class="form-control" name="address" value="${userVO.address}" placeholder="주소를 입력하세요">
				<input type="hidden" class="form-control" name="no" value="${userVO.no}">
			</div>
				<button type="button" class="btn btn-warning">취소</button>
				<button type="submit" class="btn btn-primary">수정</button>
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
