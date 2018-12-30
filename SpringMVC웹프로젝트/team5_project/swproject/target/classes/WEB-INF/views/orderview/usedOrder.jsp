<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../include/header.jsp" %>
  <title>중고 차량 주문</title>
  <script>
  $(document).ready(function() {
	  	
	  	var point = $('#point').val();
	  	var pay = $('#pay').val();
	  	$("#point").attr("min",1,"max",point);
	  	
	  	$('.btn-success').on("click",function(){
	  		$('#point').val('0');
	  	
	  		$('#pay').val(pay-point);
	  		
	  	})
	  
	  
  		$(".btn-primary").on("click", function(){
			formObj.attr("method","get");
			formObj.attr("action","rentInfo");
			formObj.submit();
		});
  		
  		var formObj = $("form[role='form']");


		$(".btn-primary").on("click", function() {
			self.location = "/carview/usedList";
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
  
  
  
<div class="container" style="margin-top:100px">
	<div class="col-md-6 col-md-offset-3">
	
	<div class="page-header text-center">
     		<h2>중고 차량 주문</h2>
  	  </div>
	
		<div class="jumbotron">
			<div class="row">
            
            <div class="col-md-5">
              
            </div>
            <form method="post">
            <div class=".col-md-6 .col-md-offset-3">
			<div class="form-group text-left">
				<label for="exampleInputEmail1">받는 사람</label>Z
				
				<input type="text" class="form-control" name="usename" value="${login.name}" placeholder="받으시는분 성함을 입력해주세요.">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">휴대폰번호</label>
				<input type="text" class="form-control" name="userphone" value="${login.phone}" placeholder="전화번호를 입력해주세요.">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">배송지 주소</label>
				<input type="text" class="form-control" name="orderaddr" value="${login.address}" placeholder="배송지 주소를 입력해주세요.">
			</div>
			
			<div class="form-group text-left">
				<label for="exampleInputPassword1">결제 방법</label>
				<label class="radio-inline">
  				<input type="radio" name="paymethod" value="무통장" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" required> 무통장
				</label>
				<label class="radio-inline">
  				<input type="radio" name="paymethod" value="카드" data-toggle="collapse" data-target="#collapseExample" required> 카드
				</label>
				<div class="collapse" id="collapseExample">
  					<div class="well">
    					입금자 : OOO
  					</div>
				</div>
			</div>
			
			<div class="form-group text-left">
				<label for="exampleInputPassword1">포인트</label>
				<input type="text" class="form-control" id="point" value="${login.point}" placeholder="사용자 포인트">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">총결제 금액</label>
				<input type="text" class="form-control" name="totalmoney" id="pay" value="${usedVO.pay}" placeholder="총 결제 금액">
			</div>
				<input type="hidden" name="usedno"  value="${usedVO.no}">
				<input type="hidden" name="userno"  value="${login.no}">
				<button type="button" class="btn btn-success">포인트 사용</button>
            	<button type="button" class="btn btn-primary">주문취소</button>
				<button type="submit" class="btn btn-warning">결제하기</button>
            </div>
            </form>
          </div>
          </div>
        </div>
    </div>



<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

<script>
  	
  	var bno = ${rentVO.no};
		var template = Handlebars.compile($("#templateAttach").html());
	
		$.getJSON("/orderview/rentgetAttach/"+no,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
  </script>

</body>
</html>
