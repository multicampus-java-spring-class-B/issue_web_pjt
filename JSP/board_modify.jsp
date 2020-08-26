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
</style>
<body>
	<!-- modify -->
	<form name="f" method="POST" action="update.do">
		<input type="hidden" name="post_id" id="post_id"value="${boardlists.post_id}"> 
		<input type="hidden" name="user_id" id="user_id" value="${boardlists.user_id}"> 
		<input type="hidden" name="board_name" id="board_name" value="${boardlists.board_name}">
		<input type="hidden" name="wtime" id="wtime" value="${boardlists.wtime}">

		<table>
			<tr>
				<th>제목</th>
				<th><input type="text" name="title" id="title"
					value="${boardlists.title}"></th>
			</tr>

			<tr>
				<th>내용</th>
				<th><input type="text" name="content" id="content"
					value="${boardlists.content}"></th>
			</tr>
			<tr>
				<th><input type="submit" value="완료"
					onsubmit="return confirm('정말로 수정하시겠습니까?');"></th>
			</tr>
		</table>

	</form>

	<br>

	<table>
		<!-- 
      <tr>
         <td align = center>
            <input type = "button" value = "완료" onclick="boardlistUpdate()">
            <input type = "button" value = "목록" onclick="boardList()">
         </td>      
      </tr>
       -->
	</table>

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