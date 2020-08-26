<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="./css/table.css">

<title>Issue, User List</title>

<script>
	
$(function() {
	$('#delete-form').submit(function() {
		$.ajax({  
			url:'/user.adminremove.do',
			dataType: 'json',  
			success: function(data) { 
				showTable(data);
			},
			error: function(err) {
				error = err;
				alert("오류 발생! 다시 시도해주세요");
			}  
		});
	});
});

function showTable(data) {
	let tag = "";
	tag += "<table border=1 class='tableb'>" 
				+ "<tr>" 
					+ "<th>user_id</th>" 
					+ "<th>pw</th>" 
					+ "<th>name</th>" 
					+ "<th>hp</th>" 
					+ "<th>sex</th>" 
					+ "<th><input type='submit' value='delete' onclick='return check()'></th>" 
				+ "</tr>" 
				+ "<div id='modal-body' class='modal-body'>	";
	
	$(data).each((i, item) => {
		tag += "<tr>" 
			 	+ "<td>" + item.user_id + "</td>"
			    + "<td>" + item.pw + "</td>" 
			    + "<td>" + item.name + "</td>"
			    + "<td>" + item.hp + "</td>"
			    + "<td>" + item.sex + "</td>"
			    + "<td><input type='checkbox' name='user_id' value='" + item.user_id + "'></td>"
			  +"<tr>";
	});
	
	tag += "</div></table>";
	$('#delete-form').html(tag);
}
	
	
	
function check() {
	return confirm("선택한 유저들을 삭제합니다");
}
	
</script>

</head>
<body>





<!-- main페이지에 이어붙여야함 -->





<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable">
	Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">User List</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <!-- Modal body -->
      <form action="${pageContext.request.contextPath}/user/adminremove.do" method="POST">
      <table border=1 class="tableb">
      		<tr>
		    <th>user_id</th>
		    <th>pw</th>
		    <th>name</th>
		    <th>hp</th>
		    <th>sex</th>
		    <th><input type="submit" value="delete" onclick="return check()"></th>
 		</tr>
      <div class="modal-body">
      	<c:forEach var="user" items="${users}">
        	 <tr> 
        	 	<td>${user.user_id}</td>
        	 	<td>${user.pw}</td>
        	 	<td>${user.name}</td>
        	 	<td>${user.hp}</td>
        	 	<td>${user.sex}</td>
        	 	<td><input type="checkbox" name="user_id" value="${user.user_id}"></td>
        	 </tr>
        </c:forEach>
        
      </div>
      </table>
      </form>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
