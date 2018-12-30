<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../../include/header.jsp" %>
  	<title>비밀번호 변경</title>
 	<script>
 	
	function myFunction() {
 		
 		var pw1 = $('#password1').val();
 		var pw2 = $('#passwd').val();
	    
	    
	  
        if ((pw1.length > 0 && pw2.length > 0) && (pw1 == pw2)) {
        	$("#error").removeClass("has-error");
        	$("#error").addClass("has-success");
        } else if(pw1 == "" || pw2 == ""){
        	$("#error").removeClass("has-error");
        	$("#error").removeClass("has-success");
        } else if (pw1 != pw2) {
        	$("#error").addClass("has-error");
        	$("#error").removeClass("has-success");
        }  else if(pw1 == null && pw2 == null ){
        	$("#error").removeClass("has-success");
        	$("#error").removeClass("has-error");
        }
	    
	    
	}
 	
		
 		$(document).ready(function() {

			$(".btn-warning").on("click", function() {
				self.location = "/userinfo/sellerinfo/profile?no=${sellerlogin.no}";
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
     		<h2>비밀번호 변경</h2>
  	  </div>
  
  	  
      <div class="jumbotron" style="margin-top:20px">
		<form method="post">
			<div class="form-group text-left">
				<label for="exampleInputEmail1">새로운 비밀번호</label>
				<input type="password" class="form-control" id="password1" name="password1" oninput="myFunction()"  placeholder="변경할 비밀번호를 입력하세요" >
			</div>
			<div id="error" class="form-group text-left">
				<label for="exampleInputEmail1">비밀번호 확인</label>
				<input type="password" class="form-control" id="passwd" name="passwd" oninput="myFunction()"  placeholder="비밀번호를 다시 한번 입력하세요" >
			</div>
			
			
				<input type="hidden" value="${sellerlogin.no}">
				<button type="button" class="btn btn-warning">취소</button>
				<button type="submit" class="btn btn-warning">변경</button>
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
