<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
}
.row {
   margin: 0px auto;
   width:960px;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">학부모면담정보</h1>
		<div class="row">
				<table class="table">
					<tr class="danger">
						<th width="10%" class="text-center">면담번호</th>
						<th width="10%"class="text-center">관계</th>
						<th width="80%"class="text-center">면담내용</th>
					</tr>
		
				<c:forEach var="vo" items="${iList }">
					<tr>
						<td width="10%" class="text-center">${vo.ino }</td>
						<td width="10%" class="text-center">${vo.relation }</td>
						<td width="80%" style="white-space:pre-wrap">${vo.interview }</td>
					</tr>
				</c:forEach>
				</table>
		</div>
	</div>
</body>
</html>