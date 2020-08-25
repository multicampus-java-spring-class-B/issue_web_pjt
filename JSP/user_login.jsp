<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="./css/input.css">


<title> Issue, Login </title>
</head>
<body id="InputForm">
<div class="container">
	<h1 class="form-heading">Login Page</h1>

	
	<div class="input-form">
		<div class="main-div">
    		<div class="panel">
   				<h2>Welcome!</h2>
  				<p>아이디와 비밀번호를 입력하세요</p>
   			</div>
    		<form id="Login" action="login.do" method="POST">
		        <div class="form-group">
	        	    <input type="text" class="form-control" name="userid" id="inputID" placeholder="아이디">
        		</div>
       			<div class="form-group">
		            <input type="password" class="form-control" name="pw" id="inputPassword" placeholder="비밀번호">
        		</div>
        		<div class="forgot">
        			<a href="add.do">아직 회원이 아니세요?</a>
				</div>
        		<button type="submit" class="btn btn-primary">로그인</button>
   			</form>
		</div>
		<p class="botto-text"> ISSUE WEB PJT </p>
	</div>
	
	
</div>

</body>
</html>
