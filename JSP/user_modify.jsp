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


<title> Issue, Modify </title>
</head>
<body id="InputForm">
<div class="container">
	<h1 class="form-heading">Modify Page</h1>
	
	<div class="input-form">
		<div class="main-div">
    		<div class="panel">
   				<h2>Modify</h2>
  				<p>수정할 정보를 입력하세요</p>
   			</div>
    		<form id="Modify" action="update.do" method="POST">
    			비밀번호
       			<div class="form-group">
		        	<input type="password" name="pw" class="form-control" id="inputPassword" value="${user.userpwd}">
        		</div>
        		
        		이름
        		<div class="form-group">
	        		<input type="text" name="name" class="form-control" id="inputName" value="${user.username}">
        		</div>
        		
        		전화번호
        		<div class="form-group">
	        		<input type="text" name="hp" class="form-control" id="inputPhone" value="${user.phone}">
        		</div>
        		
        		성별
        		<div class="form-group">
	        		<input type="text" name="sex" class="form-control" id="inputSex" value="${user.sex}">
        		</div>
        		<button type="submit" class="btn btn-primary" onsubmit="return confirm('회원정보를 수정하시겠습니까?');">수정</button>
   			</form>
		</div>
		<p class="botto-text"> ISSUE WEB PJT </p>
	</div>
	
	
</div>

</body>
</html>
