<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif;
}

.w3-sidebar {
	z-index: 3;
	width: 250px;
	top: 43px;
	bottom: 0;
	height: inherit;
}

table td, th {
	border: 1px solid;
}

#ctr {
	margin-left: 0%;
	margin-right: 0%;
}
</style>
<script type="text/javascript">
	function boardList() {
		f.action = "pageContext.request.contextPath/boardlist/board_list";
		f.submit();
	}

	function boardlistCreate() {
		f.action = "./add.do";
		f.method = "post";
		f.submit();
	}
</script>

<title>게시물 등록</title>
</head>
<body>
	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme w3-top w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1"
				href="javascript:void(0)" onclick="w3_open()"><i
				class="fa fa-bars"></i></a> <a href="#"
				class="w3-bar-item w3-button w3-theme-l1">Logo</a> <a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Corona</a>
			<a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">FineDust</a>
			<a href="#"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white">Youtube</a>
			<div class="input-group mb-3" size="50px">
				<input id="SearchText" name="SearchText" type="text"
					class="form-control" placeholder="Search" size="20px"
					style="font-size: 1.5rem">
				<div class="input-group-append">
					<button class="btn btn-success" type="button" id="submitBTN"
						color="black">Go</button>
				</div>
			</div>
		</div>
	</div>

	<form id="asamblyANDgoto">
		<INPUT TYPE="hidden" id="slideindex" name="slideindex" value="">
		<div class="w3-display-middle w3-margin-left w3-round"></div>
	</form>

	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>
	<!--contents-->
	<table>
		<tr>
			<th>&nbsp;&nbsp;<b>등록할 게시물 정보를 입력해주세요</b></th>
		</tr>
	</table>

	<br>

	<!-- view Form  -->
	<div class="w3-main" style="margin-top: 100px">
		<form name="f" method="post" action="">
			<div class="w3-row w3-padding-64" style="margin-left: 50px">
				<div class="w3-twothird w3-container">
					<h3 class="w3-text-teal">카테고리</h3>
					<select name="board_name" id="board_name">
						<!-- <option value="default" selected="selected">카테고리 선택</option> -->
						<option value="cor">코로나</option>
						<option value="dust">미세먼지</option>
						<option value="youtube">youtube 뒷광고</option>
					</select><br>

					<br>
					<h3 class="w3-text-teal">제목</h3>
					<input type="text" name="title" id="title" value="${title}"><br>

					<br>
					<h3 class="w3-text-teal">내용</h3>
					<input type="text" name="content" id="content" value="${content}">

				</div>
				<input type="button" value="게시글 등록" onClick="boardlistCreate()"> &nbsp; <br><br>
				<input type="button" value="목록으로 돌아가기" onClick="location.href='list.do'" />
			</div>
			
		</form>
	</div>
	<footer id="myFooter" style="margin-down: 50px">
		<div class="w3-container w3-theme-l2 w3-padding-32">
			<h4>Footer</h4>
		</div>

		<div class="w3-container w3-theme-l1">
			<p>
				Powered by <a href="https://www.w3schools.com/w3css/default.asp"
					target="_blank">w3.css</a>
			</p>
		</div>
	</footer>

	<!-- END MAIN -->

	<script>
		// Get the Sidebar
		var mySidebar = document.getElementById("mySidebar");

		// Get the DIV with overlay effect
		var overlayBg = document.getElementById("myOverlay");

		// Toggle between showing and hiding the sidebar, and add overlay effect
		function w3_open() {
			if (mySidebar.style.display === 'block') {
				mySidebar.style.display = 'none';
				overlayBg.style.display = "none";
			} else {
				mySidebar.style.display = 'block';
				overlayBg.style.display = "block";
			}
		}

		// Close the sidebar with the close button
		function w3_close() {
			mySidebar.style.display = "none";
			overlayBg.style.display = "none";
		}
	</script>

</body>
</html>