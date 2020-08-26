<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="./css/input.css">


<title> Issue, Sign Up </title>
</head>
<body id="InputForm">
<div class="container">
	<h1 class="form-heading">Sign Up Page</h1>

	
	<div class="input-form">
		<div class="main-div">
    		<div class="panel">
   				<h2>Welcome!</h2>
  				<p>개인정보를 입력하세요</p>
   			</div>
    		<form id="Sign Up" action="add.do" method="POST">
		        <div class="form-group">
	        	    <input type="text" class="form-control" name="user_id" id="inputID" placeholder="아이디">
			    <button class="idChk" type="button" id="idChk" value="N" style="margin-left:230px;">확인</button> 
        		</div>
       			<div class="form-group">
		            <input type="password" class="form-control" name="pw" id="inputPassword" placeholder="비밀번호">
        		</div>
        		<div class="form-group">
	        	    <input type="text" class="form-control" name="name" id="inputName" placeholder="이름">
        		</div>
        		<div class="form-group">
	        	    <input type="text" class="form-control" name="hp" id="inputPhone" placeholder="전화번호">
        		</div>
        		<div class="form-group">
	        	    <input type="text" class="form-control" name="sex" id="inputSex" placeholder="성별">
        		</div>
        		<button type="submit" class="btn btn-primary">회원가입</button>
   			</form>
		</div>
		<p class="botto-text"> ISSUE WEB PJT </p>
	</div>
</div>
	
<script>
let error;
$(function(){
	$('#idChk').click(function(){
					
					$.ajax({//ajax통신을 위한 환경설정
						//통신할 서버의 url주소, data타입,성공했을 때 수행할것,error시 수행할것 
						url:'${pageContext.request.contextPath}/user/idChk.do',	
						dataType:'json',
						data : {"user_id" : $("#user_id").val()},
						success: function(data){	 
							if(data==1){
								alert("중복된 아이디입니다.");
							}else if(data==0){
								$('#idChk').attr("value", "Y");
								alert("사용가능한 아이디입니다.");
							}
						},
						error: function(e){
							error=e;
							alert("aJax 통신 에러")
						}
					}); 
				});
});
</script>

</body>
</html>
