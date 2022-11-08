<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<title>${exhibition.exh_title}</title>
</head>
<body>
<br><br><br>
<div class="board">
        <h1>${exhibition.exh_title}</h1>
        <h5>${exhibition.exh_st_date} ~ ${exhibition.exh_end_date}</h5>
        <h6>${exhibition.exh_hall}</h6>
</div>
<p>작가 ${exhibition.exh_artist}</p>
<p>관람등급 ${exhibition.exh_rating}</p>
<p>관람시간 ${exhibition.exh_time}</p>
<p>발권정보 ${exhibition.exh_shipping_info}</p>
<p>예매수수료 <fmt:formatNumber value="${exhibition.exh_fee}" groupingUsed="true" />원</p>
<p>가격 <fmt:formatNumber value="${exhibition.exh_price}" groupingUsed="true" />원</p>
   <div id="footer">
			   <form action="/payUser" method="post">
			   <input type="hidden" name="exh_no" value="${exhibition.exh_no}">
            <input type="hidden" name="exh_title" value="${exhibition.exh_title}">
            <input type="hidden" name="amount" value="${exhibition.exh_price}">
         <button type="submit" class="btn btn-primary">예매하기</button>
      </form>
		</div>
		<br>
<%@ include file="UserExhibitionLocation.jsp"%>
<br>
</body>
</html>
