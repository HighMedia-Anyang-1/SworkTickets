<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>
</head>
<body>

<script>
$(document).ready(function(){
	

		
		const review_bno1=2;
		var objparams={review_bno:review_bno1};
		
		console.log("안됨");
		
// 	var objparams={review_bno:review_bno1,review_writer:review_writer1,review_content:review_content1};

		
   $.ajax({
		 type:'post',
		 url:"/reviewList",
		 data:objparams,
		
		success:function(data) {
		console.log(data);
			if(data.total > 0){
				console.log("get list 실행 중");
				var list = data.list;
				
			
				console.log("받아온 데이터의 리스트와, 총 댓글 수 ")
				console.log(list);
				console.log(data.total);
				console.log("list 번호"+list.review_no);
			
				
				var comment_html = "<div>";
				
				$('#count').html(data.total);
				$.each(list, function(i, v){
					console.log("댓글 만들기");
					var content = list[i].review_content;
					var writer = list[i].review_writer;
					var review_no= list[i].review_no;
					
					console.log("댓글번호받아라!!!" +review_no);
					console.log("writer!!!" +writer);
					
					//여기 위를 form 으로 지정해서 
					//현재 update에서는 아래의 폼을 물고 있고 , closest는 자신의 조상을 가르키고 있기 때문에 그것 또한 , 잘 생각해서 .할 것 .
					comment_html += "<div><span id='review_writer'><strong>" + writer + "</strong></span><br/>";
					//writer와 content를 input요소로 넣고 하하고 
					comment_html += "<span id='review_content'>" + content + "</span><br>";
					
// 					alert('세션아이디: '+$("#review_writer").val());
					console.log("댓글 아래로 쭉 떠야함 ");
					if(writer === $("#review_writer").val()){
						//wirter는 db에 있는것   , #review_writer은 세션에 있는 것 
						
						var writer_d = $("#review_writer").val()
						console.log("세션 아이디 값");
						console.log(writer_d);
						console.log("review 값은 무엇일까요?"+review_no);
						var list_no=review_no;
						console.log(list_no);
// 						<td class="tdCenter"><fmt:formatDate value="${one.one_date}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}</td>
// 						console.log("딜리트!!!!!!!!!"+reviewList.review_writer);
// 						 comment_html += "<span id='delete' style='cursor:pointer;' >(삭제하기)</span><br></div><hr>";
// 						comment_html += "<button id='delete' style='cursor:pointer;' onclick11='del(`${mb_Id}`)'>(삭제하기)</button><br></div><hr>";
<%-- 						comment_html += "<button id='delete' style='cursor:pointer;' onclick='del(<%=list[i].review_no%>)'>(삭제하기)</button><br></div><hr>"; --%>
											comment_html += "<button id='delete' style='cursor:pointer;' onclick='del("+list_no+")'>(삭제하기)</button><br></div><hr>";	 
											
										
											
											comment_html += "<button id='update1' style='cursor:pointer;' onclick='updateReview("+list_no+")'>(수정하기)</button><br></div><hr>";
											
											
// 											comment_html += "<div><fmt:formatDate value="${list.review_reg}" pattern="yyyy-MM-dd HH:mm-ss" var="today" />${today}<br></div><hr>";
					}
					else{
						comment_html += "</div><hr>";
					}
					
				});
				console.log('99999999: '+comment_html);
				$(".comment_Box").html(comment_html);
				
				
			}else{
					console.log("total 이 0 일때 ");
				var comment_html = "<div>등록된 댓글이 없습니다.</div>";
				$(".comment_Box").html(comment_html);
			}
		}
   });	
		
 	


$('#Comment_regist').click(function() {
	
	console.log("댓글버튼 실행");
	//Json으로 전달할 파라미터 변수선언 // 전시회에서 와야할 게시물 번호 
			//${exh_no};
	const review_bno = 2;
	const review_writer = $('#review_writer').val();
	const review_content = $('#review_content').val();
	//작성한 작성자와 내용 
	 
	console.log(review_bno);
	console.log(review_writer);
	console.log(review_content);

	if(review_writer == ''){
		alert('로그인 후 이용해주세요');
		return;
	}else if(review_content == '') {
		alert('내용을 입력하세요');
	}
	
	$.ajax({
		type:'post',
		url:'/insertReview',
		data: JSON.stringify(
			{
				"review_bno":review_bno,
				"review_writer":review_writer,
				"review_content":review_content
				
			}		
		),
		contentType: 'application/json',
		success:function(data){
			console.log('통신성공' + data);
			if(data === 'InsertSuccess') {
				alert('댓글 등록이 완료되었습니다.');
				console.log('댓글 등록 완료');
				console.log();
				$('#review_writer').val(review_writer);
//					$('#review_content').val('');
					$('#review_content').val(review_content);
					// 댓글이 등록되면 , 새로운 댓글창 나오면서 댓글 아이디는 작성자로, 댓글창은 빈문자로 만든다 .
				 window.location.reload();
			} else {
				alert('로그인 이후 이용해주시기 바랍니다.');
				console.log('댓글 등록 실패');
			}
		},
		error:function(){
			alert('통신실패');
		}
	});// 댓글 비동기 끝
		
})// 댓글등록 이벤트 끝



});



function del(val){
	console.log("딜리트함수 실행");
	console.log(val);
	console.log(val);
	var delConfirm = confirm('정말 삭제하시겠습니까?');
    if (delConfirm == true) {
        alert('삭제되었습니다.');
        location.href ="deleteReview?review_no="+val;
    }
    else {
        alert('삭제가 취소되었습니다.');
    }
}

function updateReview(val){
//  일단 list.no는 필요 없음
	
	
	document.querySelectorAll('.btn-comment-update').forEach(function (item) {
        item.addEventListener('click', function () { // 버튼 클릭 이벤트 발생시
            const form = this.closest('form'); // btn의 가장 가까운 조상의 Element(form)를 반환 (closest)
            commentUpdate(form); // 해당 form으로 업데이트 수행
        });
    });
	
	 /** 댓글 수정 */
    function commentUpdate(form) {
        const data = {
            
            comment: form.querySelector('#comment-content').value(),
        }
        if (!data.comment || data.comment.trim() === "") {
            alert("공백 또는 입력하지 않은 부분이 있습니다.");
            return false;
        }
        const con_check = confirm("수정하시겠습니까?");
        if (con_check === true) {
            $.ajax({
                type: 'POST',
                url: "updateReview",
                dataType: 'JSON',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function () {
                window.location.reload();
            }).fail(function (error) {
                alert(JSON.stringify(error));
            });
        }
	
	 }
			
}
	}
	
}
$(document).ready(function(){
$("#delete").click(function(){
	
	console.log("딜리트함수 실행");
});
});

</script>

<div class="comment-box">
                    
   		                 <div class="comment-count">댓글 <span id="count">0</span></div>
   		                 
						<input type="hidden" id="review_no" name="review_no" value="2">
						
   		                 	   <!-- <span class="c-icon"><i class="fa-solid fa-user"></i>  -->
   		                 <div class="comment-name">
	                        <span class="anonym">작성자  <input type="text" class="form-control"  placeholder="아이디" id="review_writer" name ="review_writer" value="${mb_Id}" readonly style="width: 300px; border:none;">
	                        </span>
	                      </div>   
	                  
	                  
	                        	<div class="content"> 내용:
	                        	
	                        	<span><input type="text" class="form-control"id="review_content" name="review_content" placeholder="내용을 입력하세요" style="width: 300px; border:none;">
	                        	</span>
	                        	</div>
	                        	<div class="regBtn">
                    		<button id="Comment_regist"> 댓글등록</button>
                    	 </div>
	                        	
	                        	
	                   	
<!-- 	                        	댓글 작성되면 작고 올라올 곳  -->
	                        	<div class="">
	                        	</div>
	                        	
	                        	
	                        	
                {{! 댓글 수정 }}
                <form class="collapse multi-collapse-{{id}}">
<!--                     <input type="hidden" id="id" value="{{id}}"> -->
<!--                     <input type="hidden" id="postsId" value="{{postsId}}"> -->
                    <div class="form-group">
                        <textarea class="form-control" id="comment-content" rows="3">{{comment}}</textarea>
                    </div>
                    <button type="button"  class="btn btn-outline-primary bi bi-pencil-square btn-comment-update"> 수정</button>
                 </form> <br>
                    
                    
                    
                    <div class="comment_Box"></div>
	                        <!-- </span> -->
                     <!--<img src="/익명.jpg" width ="50px" alt="My Image"><!-->
                     
                     
                        <!-- <span class="com-function-btn" type="hidden">
                            
                            <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                         </span> -->
</div>
                    
                    	
                    	 
</body>
</html>