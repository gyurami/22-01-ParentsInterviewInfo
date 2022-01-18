<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1 class="text-center">학생정보</h1>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-right">
					  <form action="post" action="##########">
						Search: <select name=fs class="input-sm">
							<option value="grade">학년</option>
							<option value="sclass">반</option>
							<option value="name">이름</option>
						</select>
						<input type="text" name="ss" size="15" class="input-sm">
						&nbsp;<input type="submit" value="검색" class="btn btn-xs btn-danger">
					  </form>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr class="danger">
					<th class="text-center">학년</th>
					<th class="text-center">반</th>
					<th class="text-center">이름</th>
				</tr>
				<c:forEach var="vo" items="${studentlist }">
					<tr class="text-center">
						<td>${vo.grade }학년</td>
						<td>${vo.sclass }반</td>
						<td><a href="detail.do?no=${vo.no }&name=${vo.name }">${vo.name }</a></td>
					</tr>
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="main.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-xs btn-success">이전</a>
							${curpage } page / ${totalpage } pages
						<a href="main.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-xs btn-success">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>