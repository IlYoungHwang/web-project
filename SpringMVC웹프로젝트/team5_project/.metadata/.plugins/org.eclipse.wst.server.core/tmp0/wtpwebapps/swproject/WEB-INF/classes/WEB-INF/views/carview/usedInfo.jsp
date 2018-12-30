<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<%@include file="../include/header.jsp" %>
  <title>중고차량 상세 정보</title>
  
  <script>
 $(document).ready(function(){
	 
  	$(".btn-primary").on("click", function(){
  		
  		var formObj = $("form[role='form']");
		formObj.attr("method","get");
		formObj.attr("action","usedList");
		formObj.submit();
	});
 });
  </script>
  <script>
  	
  	var bno = ${usedVO.no};
		var template = Handlebars.compile($("#templateAttach").html());
	
		$.getJSON("/usedInfo/"+no,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
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
        <li><a href="rentList">렌트차량</a></li>
        <li><a href="usedList">중고차량</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/userview/mainLogin"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <li><a href="/userview/mainSign"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
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
     		<h2>중고 차량 상세 정보</h2>
  	  </div>
	
		<div class="jumbotron">
			<div class="row">
            
            
            <div class="col-md-5">
            	<br>
              <img src="/displayFile?fileName=${usedVO.fullName}" class="img-thumbnail" width="500" height="500">
            </div>
            
            <div class="col-md-7">

            	<h3>차량 정보</h3>
				<table class="table table-hover">
  					<tr class="active">
  						<th>판매자</th><td>${userVO.name}</td><th>연락처</th><td>${userVO.phone}</td>
  					</tr>
  					<tr>
  						<th>제조사</th><td>${usedVO.manuf}</td><th>차종</th><td>${usedVO.name}</td>
  					</tr>
  					<tr>
  						<th>연식</th><td>${usedVO.year}</td><th>차량번호</th><td>${usedVO.carnum}</td>
  					</tr>
  					<tr>
  						<th>주행</th><td>${usedVO.driv}km</td><th>연료</th><td>${usedVO.fuel}</td>
  					</tr>
  					<tr>
  						<th>변속</th><td>${usedVO.trans}</td><th>색상</th><td>${usedVO.color}</td>
  					</tr>
  					<tr>
  						<th>압류저당</th><td>${usedVO.seize}</td><th>사고유무</th><td>${usedVO.acci}</td>
  					</tr>
				</table>
				
				
				<h3>옵션 정보</h3>
				<table class="table table-hover">
					<tr>
  						<td>${usedVO.opt}</td>
  					</tr>
				</table>
				
				<a href="/orderview/usedOrder?no=${usedVO.no}"><button class="btn btn-warning">주문하기</button></a>
				<button type="submit" class="btn btn-primary">목록으로</button>
            </div>
            
          </div>
          </div>
        </div>
    </div>
 



<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>
</body>
</html>
