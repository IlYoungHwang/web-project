<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="./include/header.jsp" %>
  <title>메인 화면</title>
  <script type="text/javascript">
  	var result = '${msg}'
  	
  	if(result == 'success'){
  		alert("처리가 완료되었습니다.");
  	} else if(result == 'signup'){
  		alert("회원가입 성공!!");
  	} else if(result == 'pwok'){
  		alert('비밀번호 변경 성공!!')
  	}
  </script>
  <style>
  	body {
 		 background-image:url('/resources/dist/img/boxed-bg.png');
	}
  
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 10px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
      .jumbotron {
      background-color: #f4511e;
      color: #fff;
      padding: 80px 25px;
      font-family: Montserrat, sans-serif;
  	}
  </style>
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
        <li><a href="carview/rentList">렌트차량</a></li>
        <li><a href="carview/usedList">중고차량</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${empty login and empty sellerlogin}">
        <li><a href="userview/mainLogin"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <li><a href="userview/mainSign"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
        </c:if>
       	<c:if test="${not empty login}">
       	<li><a href="userinfo/buyerinfo/profile?no=${login.no}"><span class="glyphicon glyphicon-log-in"></span> 회원정보</a></li>
        <li><a href="userview/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
       	</c:if>
       	<c:if test="${not empty sellerlogin}">
       	<li><a href="userinfo/sellerinfo/profile?no=${sellerlogin.no}"><span class="glyphicon glyphicon-log-in"></span> 회원정보</a></li>
        <li><a href="userview/logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>
  
<div class="jumbotron text-center">
  <img src="/resources/dist/img/KakaoTalk_Photo_2018-06-20-18-17-39.png" width="120" height="50">
  <p>여러분이 고객 또는 판매상인이될 수 있습니다.</p> 
</div>

<div class="container-fluid">    
  <div class="row content">
  
  
    <div class="col-md-6 col-md-offset-3 text-center"> 
    <h1>렌트차량</h1>
    
    <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
  	<!-- Indicators -->
  	<ol class="carousel-indicators">
    	<li data-target="#carousel-example-generic1" data-slide-to="0" class="active"></li>
    	<li data-target="#carousel-example-generic1" data-slide-to="1"></li>
    	<li data-target="#carousel-example-generic1" data-slide-to="2"></li>
  	</ol>


  	<!-- Wrapper for slides -->
  	<div class="carousel-inner" role="listbox">
    	<div class="item active">
      	<img src="/resources/dist/img/credit/2018301933181_2.jpg" width="900px" height="500">
      	<div class="carousel-caption">
        	<h3>소나타</h3>
        	<p>예약 가능</p>
      	</div>
    </div>
    <div class="item">
      <img src="/resources/dist/img/credit/0C8ECD121AC184CA1332E1DCD6703844396E205001BAFA6EBDFAFC18EE364040.JPG" width="900px" height="500">
      <div class="carousel-caption">
        <h3>벤츠2</h3>
        <p>예약 가능</p>
      </div>
    </div>
    <div class="item">
      <img src="/resources/dist/img/credit/2018301973741_2.jpg" width="900px" height="500">
      <div class="carousel-caption">
        <h3>벤츠3</h3>
        <p>예약 가능</p>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic1" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic1" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</div>
 
 <div class="row content">
 <div class="col-md-6 col-md-offset-3 text-center">
  <h1>중고차량</h1>

 <div id="carousel-example-generic2" class="carousel slide" data-ride="carousel">
  	<!-- Indicators -->
  	<ol class="carousel-indicators">
    	<li data-target="#carousel-example-generic2" data-slide-to="4" class="active"></li>
    	<li data-target="#carousel-example-generic2" data-slide-to="5"></li>
    	<li data-target="#carousel-example-generic2" data-slide-to="6"></li>
  	</ol>

  	<!-- Wrapper for slides -->
  	<div class="carousel-inner" role="listbox">
  	
  	
    <div class="item active">
      	<img src="/resources/dist/img/credit/2018301774951_2.jpg" width="900px" height="500">
      	<div class="carousel-caption">
        	<h3>${usedVO.name}</h3>
        	<p>구매 가능</p>
        	
      	</div>
    </div>
    <div class="item">
      <img src="/resources/dist/img/credit/4F1426BA91E30037EF263A3D5DA61294B0971FE601966CA34C64201CE0D18F02.JPG" width="900px" height="500">
      <div class="carousel-caption">
        <h3>벤츠2</h3>
        <p>구매 가능</p>
      </div>
    </div>
    <div class="item">
      <img src="/resources/dist/img/credit/38EB4C7DCA6431AFE77E5CD33401815D533941A8FEE831EBC317B1A3376D82D7.JPG" width="900px" height="500">
      <div class="carousel-caption">
        <h3>벤츠3</h3>
        <p>구매 가능</p>
      </div>
    </div>
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic2" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic2" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
	</div>  	  
	</div>
	</div>
	
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
