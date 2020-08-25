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
<link rel="stylesheet" href="./css/login_signup.css">


<title> Issue, Sign Up </title>
</head>
<body id="LoginForm">
<div class="container">
	<h1 class="form-heading">Sign Up Page</h1>

	
	<div class="login-form">
		<div class="main-div">
    		<div class="panel">
   				<h2>Welcome!</h2>
  				<p>개인정보를 입력하세요</p>
   			</div>
    		<form id="Login" action="add.do" method="POST">
		        <div class="form-group">
	        	    <input type="email" class="form-control" name="userid" id="inputEmail" placeholder="아이디">
        		</div>
       			<div class="form-group">
		            <input type="password" class="form-control" name="pw" id="inputPassword" placeholder="비밀번호">
        		</div>
        		<div class="form-group">
	        	    <input type="text" class="form-control" name="name" id="inputName" placeholder="이름">
        		</div>
        		<div class="form-group">
	        	    <input type="text" class="form-control" name="phone" id="inputPhone" placeholder="전화번호">
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

</body>
</html>
