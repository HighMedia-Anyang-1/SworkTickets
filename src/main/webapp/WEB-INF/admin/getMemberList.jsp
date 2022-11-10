<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="../../header.jsp"%> --%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/style_admin.css" rel="stylesheet" />
<link href="css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</head>
<body>
	<!-- <br><br><br> -->
	<!-- 		<nav id="nav">
			<div id="nav_box"></div>
		</nav> -->
	<div>
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand logoimg" href="index.jsp" style="text-align: center;"> <img style="width: 140px;"
				src="./images/logo.png">&nbsp&nbsp
			</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link header-logout" href="/logoutGO">로그아웃</a></li>
				</ul>
			</div>
		</nav>
		<section id="container">
			<aside>
				<div id="layoutSidenav" style="text-align: center;">
					<div id="layoutSidenav_nav">
						<nav class="sb-sidenav accordion sb-sidenav-dark"
							id="sidenavAccordion">
							<div class="sb-sidenav-menu">
								<div class="nav">
									<div class="sb-sidenav-menu-heading"></div>
									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
										aria-expanded="false" aria-controls="collapseLayouts">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 회원관리
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
<!-- 											<a class="nav-link" -->
<!-- 												href="/registerTerm?agree1=true&agree2=true&agreeAll=true';">회원등록</a> -->
											<a class="nav-link" href="/admin/member">회원등록</a>
											<a class="nav-link" href="/getMemberList">회원목록</a> <a
												class="nav-link" href="/getAllPayList">회원결제</a>
										</nav>
									</div>

									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
										data-bs-target="#collapseLayouts_exh" aria-expanded="false"
										aria-controls="collapseLayouts_exh">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 전시관리
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts_exh"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="#">전시등록</a> <a class="nav-link "
												href="/getExhibitionList">전시목록</a>
										</nav>
									</div>

									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
										data-bs-target="#collapseLayouts_coupon" aria-expanded="false"
										aria-controls="collapseLayouts_coupon">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 쿠폰관리
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts_coupon"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="/insertCouponForm">쿠폰등록 </a> <a
												class="nav-link" href="/getCouponList">쿠폰목록</a>
										</nav>
									</div>


									<a class="nav-link collapsed" href="#"
										data-bs-toggle="collapse"
										data-bs-target="#collapseLayouts_service"
										aria-expanded="false" aria-controls="collapseLayouts_service">
										<div class="sb-nav-link-icon">
											<i class="fas fa-columns"></i>
										</div> 고객센터
										<div class="sb-sidenav-collapse-arrow">
											<i class="fas fa-angle-down"></i>
										</div>
									</a>
									<div class="collapse" id="collapseLayouts_service"
										aria-labelledby="headingOne"
										data-bs-parent="#sidenavAccordion">
										<nav class="sb-sidenav-menu-nested nav">
											<a class="nav-link" href="/getBoardList">공지사항</a> <a
												class="nav-link" href="/getFaqList">FAQ</a> <a
												class="nav-link" href="/getOneList">1:1 문의</a>
										</nav>
									</div>
								</div>

							</div>

						</nav>
					</div>
				</div>
			</aside>
			<div id="container_box">
				<div class="wrap" style="padding: 40px;">
					<div class="container">
						<h2 style="text-align: center; font-weight: bold;">회원목록</h2>
					</div>
					<br> <br> <br>
					<div class="res_tbl_wrap">
						<nav id="searchNav" class="navbar navbar-expand-sm"
							style="border-bottom: none;">
							<form class="form-inline" action="getMemberList" method="post">
								<select class="form-control" id="sel1" name="searchCondition"
									style="display: inline-block !important; margin-right: 10px; appearance:auto;">
									<c:forEach items="${conditionMap}" var="option">
										<option value="${option.value}">${option.key}</option>
									</c:forEach>
									<%-- 		<option value="${conditionMap['제목']}">${conditionMap['제목']}</option> --%>
									<%-- 		<option value="${conditionMap['내용']}">${conditionMap['내용']}</option> --%>
								</select> <input class="form-control mr-sm-2" type="text"
									name="searchKeyword" placeholder="검색어를 입력하세요.">
								<button class="btn-purple" type="submit" style="margin-right: 10px;">검색</button>
								<button type="button" class="btn-purple" onclick="location.href='/registerTerm?agree1=true&agree2=true&agreeAll=true';">회원등록</button>
								<br>
							</form>
						</nav>
					</div>
					<form name="form" action="updateMember" method="post">
						<table class="table">
							<thead>
								<tr class="text-center">
									<th>번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>생년월일</th>
									<th>이메일</th>
									<th>회원여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${memberList}" var="member">
									<tr onclick="location.href='mypage?mb_id=${member.mb_id}'"
										style="cursor: pointer;" class="text-center">
										<td scope="row" data-label="번호">${member.mb_no}</td>
										<td data-label="아이디">${member.mb_id}</td>
										<td data-label="이름">${member.mb_name}</td>
										<td data-label="주소">${member.mb_address}</td>
										<td data-label="전화번호">${member.mb_phone}</td>
										<td data-label="생년월일">${member.mb_birth}</td>
										<td data-label="이메일">${member.mb_email}</td>
										<td data-label="회원여부">${member.mb_yn}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br> <br>
					</form>
					<div class="container text-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<!-- 		맨처음 -->
								<c:if test="${paging.nowPageBtn > 1 }">
									<li class="page-item "><a class="page-link"
										href="getMemberList?nowPageBtn=1">&laquo;</a></li>
								</c:if>
								<c:if test="${paging.nowPageBtn > 1 }">
									<li class="page-item "><a class="page-link"
										href="getMemberList?nowPageBtn=${paging.nowPageBtn-1}">&lt;</a></li>
								</c:if>

								<!-- 반복처리 태그 -->
								<c:forEach begin="${paging.startBtn}" end="${paging.endBtn }"
									step="1" var="i">
									<c:choose>
										<c:when test="${paging.nowPageBtn==i}">
											<li class="page-item active"><a class="page-link"
												href="getMemberList?nowPageBtn=${i}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item "><a class="page-link"
												href="getMemberList?nowPageBtn=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 		반복 끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<li class="page-item "><a class="page-link"
										href="getMemberList?nowPageBtn=${paging.nowPageBtn+1}">&gt;</a></li>
								</c:if>
								<!-- 		맨끝 -->
								<c:if test="${paging.nowPageBtn < paging.totalBtnCnt }">
									<li class="page-item"><a class="page-link"
										href="getMemberList?nowPageBtn=${paging.totalBtnCnt}">&raquo;</a></li>
								</c:if>
							</ul>
						</nav>

					</div>
					<br> <br>
					<div id="footer"></div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
