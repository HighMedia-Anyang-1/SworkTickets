<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* #searchNav { */
/* 	-webkit-justify-content: flex-end; */
/* 	justify-content: flex-end; */
/* } */

/* a { */
/* 	text-decoration: none; */
/* 	font-weight: bolder; */
/* 	display: inline-block; */
/* 	padding: 5px 10px; */
/* 	background-color: blue; */
/* 	color: #fff; */
/* 	border: 1px solid #777; */
/* 	border-radius: 5px; */
/* } */

/* a:hover, a:active { */
/* 	background-color: red; */
/* } */

/* a.aSel { */
/* 	color: red; */
/* } */

/* div#btnBox { */
/* 	text-align: center; */
/* } */
</style>
<script>

function getone(val){
	location.href="getOne?one_no="+val;

}
function f_write(val){
    console.log(val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getOneList";
    }else{
        location.href="/goWrite";
    }
}
</script>
<body>
	<div class="jumbotron">
		<h1>공지 사항</h1>
	</div>
	<%-- <%@ include file="../../menu.jsp" %> --%>
	<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
		<form class="form-inline" action="getOneList.do" method="post">
			<select class="form-control" id="sel1" name="searchCondition"
				style="display: inline-block !important; margin-right: 10px;">
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}">${option.key}</option>
				</c:forEach>
				<%-- 		<option value="${conditionMap['제목']}">${conditionMap['제목']}</option> --%>
				<%-- 		<option value="${conditionMap['내용']}">${conditionMap['내용']}</option> --%>
			</select> <input class="form-control mr-sm-2" type="text" name="searchKeyword"
				placeholder="검색어를 입력하세요.">
			<button class="btn btn-success" type="submit">검색</button>
		</form>
	</nav>
	<div class="container-fluid">
		<table class="table table-hover">
			<thead class="btn-primary">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${oneList}" var="one">
					<c:if test="${one.one_secret eq 'true'}">
						<c:choose>
							<c:when
								test="${one.one_writer eq mb_Id || mb_Id eq 'admin'}">
								<tr>
									<td onclick="getone(${one.one_no})"
										style="cursor: pointer">${one.one_no}</td>
									<td>${one.one_title }</td>
							</c:when>
							<c:otherwise>
								<tr>
									<td>비밀게시글은 작성자와 관리자만 볼 수 있습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</c:if>

					<c:if test="${one.one_secret eq 'false'}">

						<tr onclick="getone(${one.one_no})" style="cursor: pointer;">
							<td class="tdCenter">${one.one_no}</td>
							<td class="tdCenter">${one.one_title}</td>
							<td class="tdCenter">${one.one_writer}</td>
							<td class="tdCenter">${one.one_date}</td>
							<td class="tdCenter">${one.one_no}</td>

						</tr>

					</c:if>

				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>
		<div id="btnBox">
			<!-- 반복처리할 태그 시작-->
			<c:if test="${paging.nowPageBtn > 1 }">
				<a href="getOneList.do?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
				step="1" var="i">
				<c:choose>
					<c:when test="${paging.nowPageBtn == i}">
						<a class="aSel">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="getOneList.do?nowPageBtn=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
				<a href="getOneList.do?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
			</c:if>
			<!-- 반복처리할 태그 끝 -->
		</div>
		<br>
		<br>

		<%--   <c:if test="${session.getAttribute(mb_id) !==  --%>
		<%--   <div id="footer"> --%>
		      <div onclick="f_write('${mb_Id}')" style="cursor:pointer">글쓰기</div>
	</div>



</body>
</html>
