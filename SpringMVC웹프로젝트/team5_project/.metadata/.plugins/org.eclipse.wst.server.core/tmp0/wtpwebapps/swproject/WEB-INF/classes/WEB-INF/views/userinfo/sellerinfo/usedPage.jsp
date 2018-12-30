<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
  
<html>
<head>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<%@include file="../../include/header.jsp" %>
  <title>렌트차량 정보</title>
  
	
</head>
<body>

 <form role="form" action="usedModify" method="post">
    
    <input type='hidden' name='no' value ="${usedVO.no}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>  

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
  
  
  
<div class="container" style="margin-top:100px">
	<div class="col-md-6 col-md-offset-3 text-center"> 
	
	<div class="page-header text-center">
     		<h2>판매자 중고차량 정보</h2>
  	  </div>
	
		<div class="jumbotron">
			<div class="row">
			
			<div class="form-group text-left">
				<label for="exampleInputEmail1">제조사</label>
				<input type="text" class="form-control" name="manuf" value="${usedVO.manuf}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">차종</label>
				<input type="text" class="form-control" name="name" value="${usedVO.name}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">연식</label>
				<input type="text" class="form-control"  name="year" value="${usedVO.year}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">주행거리</label>
				<input type="text" class="form-control"  name="driv" value="${usedVO.driv}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">색상</label>
				<input type="text" class="form-control" name="color" value="${usedVO.color}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">차량번호</label>
				<input type="text" class="form-control" name="carnum" value="${usedVO.carnum}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">변속기</label>
				<input type="text" class="form-control" name="trans" value="${usedVO.trans}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">연료</label>
				<input type="text" class="form-control" name="fuel" value="${usedVO.fuel}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">압류저당</label>
				<input type="text" class="form-control" name="seize" value="${usedVO.seize}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">사고유무</label>
				<input type="text" class="form-control" name="acci" value="${usedVO.acci}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">옵션</label>
				<input type="text" class="form-control" name="opt" value="${usedVO.opt}" readonly>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">판매가격</label>
				<input type="text" class="form-control" name="pay" value="${usedVO.pay}" readonly>
			</div>
			<div class="box-footer">
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
				<button type="submit" class="btn btn-warning">수정</button>
				<button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
				<button type="submit" class="btn btn-primary">목록으로</button>
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
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>  




<script>

$(document).ready(function(){

	var formObj = $("form[role='form']");
	
	console.log(formObj);

	$(".btn-warning").on("click", function(){
		formObj.attr("action", "usedModify");
		formObj.attr("method", "get");		
		formObj.submit();
	});


	$(".btn-primary").on("click", function(){
		formObj.attr("method","get");
		formObj.attr("action","usedInfo");
		formObj.submit();
	});
	
	
	var no = ${usedVO.no};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/carview/usedgetAttach/"+no,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
	
	$("#removeBtn").on("click", function(){
		

		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
			});
		}

		formObj.attr("action", "usedmove");
		formObj.submit();
	});	
});
</script>
</body>
</html>
