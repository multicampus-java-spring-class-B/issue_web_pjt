<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size: 16px;}
img {margin-bottom: -8px;}
.mySlides {display: none;}
</style>
<body class="w3-content w3-black" style="max-width:1500px; max-height:1000px;">
<!-- Header with Slideshow -->
<header class="w3-display-container w3-center">
  <button class="w3-button w3-block w3-green w3-hide-large w3-hide-medium" onclick="document.getElementById('download').style.display='block'">Download <i class="fa fa-android"></i> <i class="fa fa-apple"></i> <i class="fa fa-windows"></i></button>
  <div class="mySlides w3-animate-opacity">
    <img class="w3-image" src="${pageContext.request.contextPath}/resources/img/LOOP1.jpg" alt="Image 1" style="min-width:500px; opacity: 80%;" width="1500" height="1000" >
  </div>
  <div class="mySlides w3-animate-opacity">
    <img class="w3-image" src="${pageContext.request.contextPath}/resources/img/LOOP2.jpg" alt="Image 2" style="min-width:500px; opacity: 80%;" width="1500" height="1000">
  </div>
  <div class="mySlides w3-animate-opacity">
    <img class="w3-image" src="${pageContext.request.contextPath}/resources/img/LOOP3.jpg" alt="Image 3" style="min-width:500px; opacity: 80%;" width="1500" height="1000">
  </div>
  <form id="asamblyANDgoto">
    <INPUT TYPE="hidden" id="slideindex" name="slideindex" value="">
  <div class="w3-display-middle w3-margin-left w3-round">
  <div class="input-group mb-3">
	<input id="SearchText" name="SearchText" type="text" class="form-control" placeholder="Search" size="40px" style="font-size: 2rem">
    <div class="input-group-append">
      <button class="btn btn-success" type="button" id="submitBTN">Go</button>
     </div>
  </form>
  </div>
  </div>
  
  <span class="w3-display-topright w3-margin-right" id="UserINFO">
  <c:if test="${empty login}">
  <button type="button" class="btn btn-light">회원가입</button>
  <button type="button" class="btn btn-light">로그인</button> 
  </c:if>
  
  <c:if test="${!empty login}">
  <button type="button" class="btn btn-light">로그아웃</button>
  <button type="button" class="btn btn-light">마이페이지</button> 
  </c:if>
  
  </span>
  <a class="w3-button w3-black w3-display-right w3-margin-right w3-round w3-hide-small w3-hover-light-grey" onclick="plusDivs(1)">  <i class="fa fa-angle-right"></i></a>
  <a class="w3-button w3-black w3-display-left w3-margin-left w3-round w3-hide-small w3-hover-light-grey" onclick="subDivs(1)">  <i class="fa fa-angle-left"></i></a>
</header>

<!-- The App Section -->
<div class="w3-padding-64 w3-white">
  <div class="w3-row-padding">
    <div class="w3-col l8 m6">
      <h1 class="w3-jumbo" id="main_Ltitle"><b>프로젝트</b></h1>
      <h1 class="w3-xxxlarge w3-text-green" id="main_Stitle"><b>ㅇㅇㅇ</b></h1>
      <p id="main_Scontents"><span class="w3-xlarge" id="main_LContents">코로나바이러스다</span> 코로나 바이러스 설명이다</p>
      <button class="w3-button w3-light-grey w3-padding-large w3-section w3-hide-small" onclick="document.getElementById('download').style.display='block'">
        <i class="fa fa-download"></i> Download Application
      </button>
      <p>Available for <i class="fa fa-android w3-xlarge w3-text-green"></i> <i class="fa fa-apple w3-xlarge"></i> <i class="fa fa-windows w3-xlarge w3-text-blue"></i></p>
    </div>
    <div class="w3-col l4 m6">
      <div class="w3-center w3-hide-large w3-hide-medium">
        <button class="w3-button w3-block w3-padding-large" onclick="document.getElementById('download').style.display='block'">
          <i class="fa fa-download"></i> Download Application
        </button>
        <img src="/w3images/img_app." class="w3-image w3-margin-top" width="335" height="471">
      </div>
    </div>
  </div>
</div>
<!-- Footer -->
<footer class="w3-container w3-padding-32 w3-light-grey w3-center w3-xlarge">
  <div class="w3-section">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>

<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}
function subDivs(n) {
  showDivs(slideIndex -= n);
}

$(function() {
	$('#submitBTN').click(function (){
		if(slideIndex == 1){
		$('#slideindex').val("DUS");
		}
		else if (slideIndex == 2){
		$('#slideindex').val("COR");
		}
		else{
		$('#slideindex').val("YOU");
		}
		$('#asamblyANDgoto').attr('method', 'GET');
		$('#asamblyANDgoto').attr('action', '${pageContext.request.contextPath}/Test2.do');
		$('#asamblyANDgoto').submit();
	})
	
	
	$('#main_Ltitle').text("메인");
	$('#main_Stitle').text("메인");
	$('#main_Lcontents').text("메인");
	$('#main_Scontents').text("메인");
	
})


function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</html>
