<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="euc-kr"%>
  
  
<html>
<head>
	<%@include file="../../include/header.jsp" %>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
  <title>렌트차량 등록</title>
  <style>

    .fileDrop {
  		width: 100%;
  		height: 100px;
  		border: 1px dotted gray;
  		background-color: lightslategrey;
  		margin: auto;
	}
  </style>
  <script>
	$(document).ready(function() {
		
		$(".btn-primary").on("click", function() {
			self.location = "/userinfo/sellerinfo/rentInfo";
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
        <li><a href="/swproject/userview/mainLogin"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <li><a href="/swproject/userview/mainSign"><span class="glyphicon glyphicon-log-in"></span> 회원가입</a></li>
      </ul>
    </div>
  </div>
</nav>
  
  
  
<div class="container" style="margin-top:100px">
	<div class="col-md-6 col-md-offset-3 text-center"> 
	
	<div class="page-header text-center">
     		<h2>렌트 차량 등록</h2>
  	  </div>
	
		<div class="jumbotron">
			<div class="row">
           <form id='registerForm' role="form" method="post">
			<div class="form-group text-left">
				<label for="exampleInputEmail1">차종</label>
				<input type="text" class="form-control" name="name" placeholder="이메일을 입력하세요" required>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">주행 요금</label>
				<input type="text" class="form-control" name="fee" placeholder="암호" required>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">연료</label>
				<input type="text" class="form-control" name="fuel" placeholder="암호" required>
			</div>
			<div class="form-group text-left">
				<label for="exampleInputPassword1">옵션</label>
				<input type="text" class="form-control" name="opt" placeholder="암호" required>
			</div>
			<div class="form-group text-left">
			<label for="exampleInputPassword1">렌트대여위치</label>
				<input type="text" class="form-control" name="loc" required>
			</div>
			<div class="form-group">
			<label for="exampleInputEmail1">File DROP Here</label>
			<div class="fileDrop"></div>
			</div>

			<div class="box-footer">
			<ul class="mailbox-attachments clearfix uploadedList"></ul>
			</div>
			
				<input type="hidden" name="userno" value="${sellerlogin.no}">
				<button type="button" class="btn btn-primary">취소</button>
				<button type="submit" class="btn btn-warning">등록</button>
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

});
</script>

</body>
</html>
