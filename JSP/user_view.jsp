<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	function userModify() {
		f.action = "modify.do";
		f.submit();
	}
	function userRemove() {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			f.action = "remove.do";
			f.submit();
		}
	}
</script>


<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">My Info</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원정보 보기 </h4>
					</div>


					<div class="modal-body">
						<table width=780 border=0 cellpadding=0 cellspacing=0>
							<tr>
								<td width="20"></td>
								<td>
									<!--contents-->
									<table width=500 border=0 cellpadding=0 cellspacing=0>
										<tr>
											<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자
													관리 - 사용자 정보보기</b></td>
										</tr>
									</table> <br> <!-- view Form  -->
									<form name="f" method="post" action="">
										<input type="hidden" name="user_id" value="${user.user_id }">
										<table border="0" cellpadding="0" cellspacing="1" width="480"
											bgcolor="BBBBBB">
											<tr>
												<td width=120 align=center bgcolor="E6ECDE" height="22">사용자
													아이디</td>
												<td width=490 bgcolor="ffffff" style="padding-left: 10">
													${user.user_id}</td>
											</tr>
											<tr>
												<td width=120 align=center bgcolor="E6ECDE" height="22">이름</td>
												<td width=490 bgcolor="ffffff" style="padding-left: 10">
													${user.name}</td>
											</tr>
								
											<tr>
												<td width=120 align=center bgcolor="E6ECDE" height="22">전화번호</td>
												<td width=490 bgcolor="ffffff" style="padding-left: 10">
													${user.hp}</td>
											</tr>
											<tr>
												<td width=120 align=center bgcolor="E6ECDE" height="22">성별</td>
												<td width=490 bgcolor="ffffff" style="padding-left: 10">
													${user.sex}</td>
											</tr>
										</table>
									</form>
									<table width=610 border=0 cellpadding=0 cellspacing=0>
										<tr>
											<td align=center><input type="button" value="수정"
												onClick="userModify()"> &nbsp; <input type="button"
												value="" onClick="userRemove()"> </td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>



					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
