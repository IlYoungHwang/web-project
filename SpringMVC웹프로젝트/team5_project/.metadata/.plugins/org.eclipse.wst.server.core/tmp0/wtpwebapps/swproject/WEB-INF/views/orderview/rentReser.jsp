<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../include/header.jsp" %>
  <title>렌트 차량 예약</title>
 
 
 <script>
 $(document).ready(function(){
	 var start = $('#start').val();
	 var test1 = $('#datetimepicker1').datetimepicker({format:"YYYY-MM-DD HH:mm:ss"});
	 var test2 = $('#datetimepicker2').datetimepicker();
	 
	 var a = $('#start').val();
	 var b = $('#end').val();
	 
	 var point = $('#point').val();
	 var payment = $('#payment').val();
	 $("#point").attr("min",1,"max",point);
	 
	 $(".btn-success").click(function () {
		 $('#payment').val(test1);
			alert(start);
     });
	
	 
	 
	 
	
	
  	$(".btn-primary").on("click", function(){
  		
  		var formObj = $("form[role='form']");
		formObj.attr("method","get");
		formObj.attr("action","/carview/rentList");
		formObj.submit();
	});
  	
  	
  	var no = ${rentVO.no};
  	var template = Handlebars.compile($("#templateAttach").html());

  	$.getJSON("/orderview/rentgetAttach/"+no,function(list){
  		$(list).each(function(){
  			
  			
  			var fileInfo = getFileInfo(this);
  			
  			var html = template(fileInfo);
  			
  			$("#image").attr("src" , html);
  			
  		});
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
  
 <form role="form" method="post">
    
    
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>    
  
<div class="container" style="margin-top:100px">
	<div class=".col-xs-6 .col-md-4">
	<div class="page-header text-center">
     		<h2>렌트 차량 예약</h2>
  	  </div>
	
		<div class="jumbotron">
			<div class="row">
            <div class="col-md-5">
              <img id="image" class="img-thumbnail" width="500" height="500">
              <br><br>
              <table class="table table-bordered">
  					<tr>
  						<th>차종</th><td>${rentVO.name}</td>
  					</tr>
  					<tr>
  						<th>주행요금</th><td>${rentVO.fee}</td>
  					</tr>
  					<tr>
  						<th>대여 위치</th><td>${rentVO.loc}</td>
  					</tr>
  					<tr>
  						<th>연료</th><td>${rentVO.fuel}</td>
  					</tr>
  					<tr>
  						<th>옵션</th><td>${rentVO.opt}</td>
  					</tr>
  					<tr>
  						<th>상태</th><td>${rentVO.state}</td>
  					</tr>
				</table>
            </div>
            
            <div class="col-md-7">
				<div class="form-group text-left">
				<label for="exampleInputPassword1">대여시간</label>
				<div class='input-group date' id='datetimepicker1' >
                    <input type='text' class="form-control" id="start">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
				</div>
				<div class="form-group text-left">
				<label for="exampleInputPassword1">반납시간</label>
				<div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" id="end"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
				</div>
				
				<div class="form-group text-left">
					<label for="exampleInputPassword1">결제 방법</label>
					<label class="radio-inline">
  					<input type="radio" name="radio" value="무통장"> 무통장
					</label>
					<label class="radio-inline">
  					<input type="radio" name="radio" value="신용카드"> 신용카드
					</label>
				</div>
				
				<div class="form-group text-left" >
					<label for="exampleInputPassword1">포인트</label>
					<input type="text" class="form-control" id="point" value="${login.point}">
				</div>
				<div class="form-group text-left">
					<label for="exampleInputPassword1">총결제 금액</label>
					<input type="text" class="form-control" id="payment" value="${login.name}" id="test">
				</div>

				<button type="button" class="btn btn-success">포인트사용</button>
				<button type="submit" class="btn btn-warning">결제하기</button>
				<button type="submit" class="btn btn-primary">목록으로</button>
            </div>
          </div>
          </div>
        </div>
    </div>
 

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="templateAttach" type="text/x-handlebars-template">
  {{imgsrc}}
</script> 


</body>
</html>
