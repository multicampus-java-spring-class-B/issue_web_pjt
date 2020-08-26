<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<title>메인 페이지</title>
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
#MainIMG:hover{
opacity: 0.8;
}
</style>
<body class="w3-content w3-black" style="max-width:1500px; max-height:1000px;">
<!-- Header with Slideshow -->
<header class="w3-display-container w3-center">
  <button class="w3-button w3-block w3-green w3-hide-large w3-hide-medium" onclick="document.getElementById('download').style.display='block'">Download <i class="fa fa-android"></i> <i class="fa fa-apple"></i> <i class="fa fa-windows"></i></button>
  <div class="mySlides w3-animate-opacity">
    <a href="#" id="MainIMG"><img class="w3-image" src="${pageContext.request.contextPath}/resources/img/LOOP1.jpg" alt="DUST" style="min-width:500px; opacity: 80%;" width="1500" height="1000"></a>
  </div><!-- 미세먼지 관련 list 이동 -->
  <div class="mySlides w3-animate-opacity">
    <a href="#" id="MainIMG"><img class="w3-image" src="${pageContext.request.contextPath}/resources/img/LOOP2.jpg" alt="CORONA" style="min-width:500px; opacity: 80%;" width="1500" height="1000"></a>
  </div><!-- 코로나 관련 list 이동 -->
  <div class="mySlides w3-animate-opacity">
    <a href="#" id="MainIMG"><img class="w3-image" src="${pageContext.request.contextPath}/resources/img/LOOP3.jpg" alt="YOUTUBE" style="min-width:500px; opacity: 80%;" width="1500" height="1000"></a>
  </div><!-- 뒷광고 관련 list 이동 -->
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
  	<button type="button" class="btn btn-light"><a href="${pageContext.request.contextPath}/user/login.do">로그인</a></button>
  </c:if>
  
  <c:if test="${!empty login}">
  	<button type="button" class="btn btn-light"><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></button>
  	
  	<c:choose>
  		<c:when test="${login.user_id eq 'admin'}">
			<button type="button" class="btn btn-light"><a href="${pageContext.request.contextPath}/user/list.do">유저 리스트</a></button>  		
  		</c:when>
  		
  		<c:otherwise>
  			<button type="button" class="btn btn-light"><a href="${pageContext.request.contextPath}/user/view.do">내 정보</a></button>
  		</c:otherwise>
  	</c:choose>
  </c:if>
  </span>
  <a class="w3-button w3-black w3-display-right w3-margin-right w3-round w3-hide-small w3-hover-light-grey" onclick="plusDivs(1)" id="nextBTN">  <i class="fa fa-angle-right"></i></a>
  <a class="w3-button w3-black w3-display-left w3-margin-left w3-round w3-hide-small w3-hover-light-grey" onclick="subDivs(1)" id="previousBTN">  <i class="fa fa-angle-left"></i></a>
</header>

<!-- The App Section -->
<div class="w3-padding-64 w3-white">
  <div class="w3-row-padding">
    <div class="w3-col l8 m6">
      <h1 class="w3-jumbo" id="main_Ltitle"><b>프로젝트</b></h1>
      <h1 class="w3-xxxlarge w3-text-green" id="main_Stitle"><b>ㅇㅇㅇ</b></h1>
      <p id="main_Scontents"><span class="w3-xlarge" id="main_LContents">코로나바이러스다</span> 코로나 바이러스 설명이다</p>
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
  <p class="w3-medium">Powered by <a href="#" target="_blank" class="w3-hover-text-green">이모저모팀</a></p>
</footer>
<form action="post"></form>

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
		$('#asamblyANDgoto').attr('action', '${pageContext.request.contextPath}/search.do'); //검색하면 갈 서블릿, slideindex(카테고리)와 SearchText를 넘겨줌
		$('#asamblyANDgoto').submit();
	})
	
	
	$('#main_Ltitle').text("FINE DUST");
	$('#main_Stitle').text("미세먼지");
	$('#main_Lcontents').text("메인");
	$('#main_Scontents').text($.ajax({ //ajax 통신시작
		url:'${pageContext.request.contextPath}/jsonlist.do',
		dataType:'json',
		success:function(data){
			$('#main_Ltitle').text("FINE DUST");
			$('#main_Stitle').text("미세먼지");
			$('#main_Scontents').text(data[slideIndex-1].board_contents);
		},
		error:function(e){
			error = e;
			alert("ajax 통신 에러");
		}
	})
	);
	
	$('#nextBTN').click(function(){
		$.ajax({ //ajax 통신시작
			url:'${pageContext.request.contextPath}/jsonlist.do',
			dataType:'json',
			success:function(data){
				changeText(data);
			},
			error:function(e){
				error = e;
				alert("ajax 통신 에러");
			}
		});
	})
	$('#previousBTN').click(function(){
		$.ajax({ //ajax 통신시작
			url:'${pageContext.request.contextPath}/jsonlist.do',
			dataType:'json',
			success:function(data){
				changeText(data);
			},
			error:function(e){
				error = e;
				alert("ajax 통신 에러");
			}
		});
	})
})

function changeText(data){
		if(slideIndex == 1){
		$('#main_Ltitle').text("FINE DUST");
		$('#main_Stitle').text("미세먼지");
		$('#main_Scontents').text(data[slideIndex-1].board_contents);
		}
		else if (slideIndex == 2){
		$('#main_Ltitle').text("COVID-19");
		$('#main_Stitle').text("코로나 바이러스");
		$('#main_Scontents').text(data[slideIndex-1].board_contents);
		}
		else{
		$('#main_Ltitle').text("BACK ADVERTISEMENT");
		$('#main_Stitle').text("뒷광고");
		$('#main_Scontents').text(data[slideIndex-1].board_contents);
		}
}


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
