<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

   function boardList() {
      f.action = "pageContext.request.contextPath/boardlist/board_list";
      f.submit();
   }
   
   function boardlistCreate() {   
      f.action="./add.do";
      f.method="post";
      f.submit();
   }
   
</script>

<title>게시물 등록</title>
</head>
<body>

   <!--contents-->
   <table>
      <tr>
         <th>&nbsp;&nbsp;<b>등록할 게시물 정보를 입력해주세요</b></th>
      </tr>
   </table>

   <br>

   <!-- view Form  -->
   <form name="f" method="post" action="">
      <table>
         <tr>
            <th>카테고리</th>
            <th><select name="board_name" id="board_name">
                 <!--  <option value="default" selected="selected">카테고리 선택</option> -->
                  <option value="cor">코로나</option>
                  <option value="dust">미세먼지</option>
                  <option value="youtube">youtube 뒷광고</option>
                  
            </select> <%-- <th><input type="text" name="boardname" id="boardname"
               value="${board_name}"></th> --%>
         </tr>
<%--          <tr>
         <th> <input type="hidden" name="user_id" id="user_id" value="${boardlists.user_id}"> </th>
         </tr> --%>
         <tr>
            <th>제 목</th>
            <th><input type="text" name="title" id="title"
               value="${title}"></th>
         </tr>
         <tr>
            <th>내 용</th>
            <th><input type="text" name="content" id="content"
               value="${content}"></th>
         </tr>
      </table>
      <table>
         <tr>
            <th><input type="button" value="게시글 등록" onClick="boardlistCreate()"> &nbsp;
               <input type="button" value="목록으로 돌아가기" onClick="location.href='list.do'" /></th>
         </tr>
      </table>
   </form>


</body>
</html>
