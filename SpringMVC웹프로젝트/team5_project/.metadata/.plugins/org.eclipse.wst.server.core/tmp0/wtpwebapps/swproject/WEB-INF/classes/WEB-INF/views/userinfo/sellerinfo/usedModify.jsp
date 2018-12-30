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
 
	<style>
	.fileDrop {
  	width: 80%;
  	height: 100px;
  	border: 1px dotted gray;
  	background-color: lightslategrey;
  	margin: auto;
  
	}
</style>
	<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			self.location = "/userinfo/sellerinfo/usedInfo?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});

		$(".btn-primary").on("click", function() {
			formObj.submit();
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
  
  
  
<div class="container" style="margin-top:100px">
	<div class="col-md-6 col-md-offset-3 text-center"> 
	
	<div class="page-header text-center">
     		<h2>판매자 중고 차량 수정</h2>
  	  </div>
	
		<div class="jumbotron">
			<div class="row">
			<form role="form" id='registerForm' action="usedModify" method="post">
			<input type="hidden" name="page" value="${cri.page}">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
			<div class="form-group text-left">
				<label for="exampleInputEmail1">제조사</label>
				<input type="text" class="form-control" name="manuf" value="${usedVO.manuf}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">차종</label>
				<input type="text" class="form-control" name="name" value="${usedVO.name}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">연식</label>
				<input type="text" class="form-control"  name="year" value="${usedVO.year}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">주행거리</label>
				<input type="text" class="form-control"  name="driv" value="${usedVO.driv}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">색상</label>
				<input type="text" class="form-control" name="color" value="${usedVO.color}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">차량번호</label>
				<input type="text" class="form-control" name="carnum" value="${usedVO.carnum}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">변속기</label>
				<input type="text" class="form-control" name="trans" value="${usedVO.trans}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">연료</label>
				<input type="text" class="form-control" name="fuel" value="${usedVO.fuel}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">압류저당</label>
				<input type="text" class="form-control" name="seize" value="${usedVO.seize}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">사고유무</label>
				<input type="text" class="form-control" name="acci" value="${usedVO.acci}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">옵션</label>
				<input type="text" class="form-control" name="opt" value="${usedVO.opt}">
			</div>
			<div class="form-group text-left">
				<label for="exampleInputEmail1">판매가격</label>
				<input type="text" class="form-control" name="pay" value="${usedVO.pay}">
			</div>
			<input type="hidden" name="no" value="${usedVO.no}">
			<div class="form-group text-left">
				<label for="exampleInputEmail1">File DROP Here</label>
				<div class="fileDrop"></div>
			</div>
			
			<div class="box-footer">
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
				<button type="submit" class="btn btn-primary">수정</button>
				<button type="submit" class="btn btn-warning">취소</button>
				</form>
          </div>
          </div>
        </div>
    </div>
 




<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>


<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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

<script>
$(document).ready(function(){

	$("#registerForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		that.get(0).submit();
	});


var template = Handlebars.compile($("#template").html());


$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];


	var formData = new FormData();
	
	formData.append("file", file);	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


$(".uploadedList").on("click", ".delbtn", function(event){
	
	event.preventDefault();
	
	var that = $(this);
	 
	$.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
   });
});


var no = ${usedVO.no};
var template = Handlebars.compile($("#template").html());

$.getJSON("/carview/usedgetAttach/"+no,function(list){
	$(list).each(function(){
		
		var fileInfo = getFileInfo(this);
		
		var html = template(fileInfo);
		
		 $(".uploadedList").append(html);
		
	});
});


});


</script>

</body>
</html>
