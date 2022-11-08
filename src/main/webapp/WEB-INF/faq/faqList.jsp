<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

function getfaq(val){
	location.href="getFaq?faq_no="+val;

}
function f_write(val){
    console.log(val);
    if(val == ''){
        alert("로그인이 되야 작성 가능합니다");
        location.href="/getFaqList";
    }else{
        location.href="/goWriteFaq";
    }
}
</script>
<body>
	<div class="board">
		<h1>FAQ</h1>
	</div>
	<%-- <%@ include file="../../menu.jsp" %> --%>
	<nav id="searchNav" class="sub_title">
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
					<th>카테고리</th>
					<th>등록일</th>
					
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${faqList}" var="faq">
<%-- 					<c:if test="${one.one_secret eq 'true'}"> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when --%>
<%-- 								test="${one.one_writer eq mb_Id || mb_Id eq 'admin'}"> --%>
<!-- 								<tr> -->
<%-- 									<td onclick="getone(${one.one_no})" --%>
<%-- 										style="cursor: pointer">${one.one_no}</td> --%>
<%-- 									<td>${one.one_title }</td> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<tr> -->
<!-- 									<td>비밀게시글은 작성자와 관리자만 볼 수 있습니다.</td> -->
<!-- 								</tr> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>

<%-- 					</c:if> --%>

<%-- 					<c:if test="${one.one_secret eq 'false'}"> --%>

<%-- 						<tr onclick="getfaq(${faq.faq_title})" style="cursor: pointer;"> //faq_no 칼럼 추가 예정 --%>
<%-- 							<td class="tdCenter">${one.one_no}</td> --%>
							<tr onclick="getfaq(${faq.faq_no})" style="cursor: pointer;">
							<td class="tdCenter" style="width:10%;" >${faq.faq_no}</td>
							<td class="tdCenter" style="width:60%;"  onclick="getfaq(${faq.faq_no}")">${faq.faq_title}</td>
							<td class="tdCenter" style="width:15%;" >${faq.cate_name}</td>
							
<%-- 							<td class="tdCenter">${faq.faq_reg}</td> --%>
							<td class="tdCenter" style="width:15%;" ><fmt:formatDate value="${faq.faq_reg}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
<%-- 							<td class="tdCenter">${faq.faq_content}</td> --%>
	
						</tr>

<%-- 					</c:if> --%>

				</c:forEach>
			</tbody>
		</table>
		<div>
		<button class="write" onclick="f_write('${mb_Id}')" style="cursor:pointer">글쓰기</button>
		</div>
		</div>
		<div id="btnBox_parent">
		<div id="btnBox">
			<!-- 반복처리할 태그 시작-->
			<c:if test="${paging.nowPageBtn > 1 }">
				<a href="getFaqList?nowPageBtn=${paging.nowPageBtn -1 }">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
				step="1" var="i">
				<c:choose>
					<c:when test="${paging.nowPageBtn == i}">
						<a class="aSel">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="getFaqList?nowPageBtn=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
				<a href="getFaqList?nowPageBtn=${paging.nowPageBtn +1 }">&gt;</a>
			</c:if>
			<!-- 반복처리할 태그 끝 -->
		</div>
		<br>
		<br>

		<%--   <c:if test="${session.getAttribute(mb_id) !==  --%>
		<%--   <div id="footer"> --%>
		     
	</div>



</body>
</html>
