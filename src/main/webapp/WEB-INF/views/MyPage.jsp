<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- AOS CSS -->
<link rel="stylesheet"
	href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap JS and Popper.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
<style>
.tabs-container {
	display: flex;
	gap: 20px;
	font-size: 16px;
}

.tab-item {
	display: flex;
	align-items: center;
	position: relative;
	cursor: pointer;
}

.tab-text {
	margin-right: 5px;
}

.tab-count {
	color: gray;
}

.tab-underline {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 1px;
	background-color: transparent;
}

.tab-item.active .tab-underline {
	background-color: black;
}

.card-container {
	display: flex;
	align-items: center;
	padding: 30px;
	border: 1px solid #e0e0e0;
	border-radius: 5px;
	width: 100%;
	margin: 20px auto;
}

.card-image {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 15px;
}

.card-content {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.card-title {
	font-weight: bold;
}
.written-card-title {
    font-weight: bold;
    white-space: nowrap;  /* 텍스트를 한 줄로 유지 */
    overflow: hidden;    /* 내용이 넘칠 경우 숨김 */
    text-overflow: ellipsis;  /* 넘친 내용을 말줄임표로 표시 */
    max-width: 100%;    /* 최대 너비 지정 */
}
.highlight {
	color: red;
}

.card-btn {
	background-color: #000000;
	color: #FFF;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.written-card-container {
	display: flex;
	align-items: center;
	padding: 30px;
	border: 1px solid #e0e0e0;
	border-radius: 5px;
	width: 100%;
	margin: 20px auto;
}

.written-card-image {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 15px;
}

.written-card-content {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.written-card-title {
	font-weight: bold;
}

.review-detail {
	flex-grow: 2;
	display: flex;
	flex-direction: column;
	
	align-items: flex-start;
	margin-left: 20px;
	display: flex;
    flex-direction: column;
    align-items: flex-start; /* 왼쪽 정렬을 나타냄 */
    justify-content: space-between; /* 요소들 사이에 공간을 균등하게 분배 */
    width: 100%; /* div가 전체 너비를 차지하도록 설정 */
}
.review-detail-actions {
    align-self: flex-end; /* 컨테이너 내에서 자기 자신을 오른쪽 끝으로 정렬 */
    display: flex;
    gap: 10px; /* 버튼 사이에 간격을 줌 */
}
.review-date {
	font-size: 12px;
	color: gray;
	margin-bottom: 5px;
}

.review-points {
	font-size: 14px;
	color: green;
	margin-bottom: 10px;
}

.review-text {
	font-size: 14px;
	color: #333;
}

.imgtext{
	margin-left :20px;
	margin-right: 20px;
}
.modal-dialog-centered {
  display: flex;
  align-items: center;
  justify-content: center;
}
#modalImage {
  object-fit: contain;
  max-width: 100%;
  max-height: 100vh;
}
.navbar-custom {
    /* 사용자 정의 스타일 */
    background-color: #000000; 
}

.navbar-brand-custom{
    /* 사용자 정의 스타일 */
    color: #fff; 
}

.nav-link {
    color: #000000;
}
.nav-links {
    color: #fff;
     margin-right: 30px; /* 오른쪽에 15px 마진 추가 */
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-custom">
		<a class="navbar-brand navbar-brand-custom" href="/">Bloom</a>

		<!-- Navbar content: 네비게이션 바에 들어갈 내용들 -->
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-links" href="/MyPage">${sessionScope.email}</a></li>
				<li class="nav-item"><a class="nav-links" href="/">홈</a></li>
				<li class="nav-item"><a class="nav-links" href="/logout">로그아웃</a></li>
				<!-- 기타 링크 및 콘텐츠 추가 -->
			</ul>
		</div>
	</nav>
	<div class="container my-5">
		<h1 class="mb-4">마이페이지</h1>
		<ul class="nav nav-tabs" role="tablist">
    		<li class="nav-item">
        		<a class="nav-link active" id="order-history-tab" data-toggle="tab" href="#order-history"
        								 role="tab" aria-controls="order-history" aria-selected="true">주문 내역 조회</a>
    		</li>
			<li class="nav-item"><a class="nav-link" id="user-info-tab"
				data-toggle="tab" href="#user-info">회원 정보</a></li>
			<!-- <li class="nav-item"><a class="nav-link"
				id="recent-products-tab" data-toggle="tab" href="#recent-products">최근
					본 상품</a></li> -->
			<li class="nav-item"><a class="nav-link" id="my-review-tab"
				data-toggle="tab" href="#review-products">나의 리뷰</a></li>
		</ul>
		<div class="tab-content mt-4">
    		<div class="tab-pane fade show active" id="order-history" role="tabpanel" aria-labelledby="order-history-tab">
				<h3>주문 내역 조회</h3>
				<!-- ... 여기에 데이터를 추가 ... -->
				<table class="table table-striped">
					<thead>
                <tr>
                    <th>상품 이미지</th>
                    <th>상품명</th>
                    <th>단일가격</th>
                    <th>총 가격</th>
                    <th>수량</th>
                    <th>사이즈</th>
                    <th>주문날짜</th>
                    <th>상태</th>
                    <th>배송 주소</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${myBuy}">
                    <tr>
                        <td><img src="${order.img1}" alt="상품 이미지" width="50"></td>
		                        <td> <a href="/product_detail?product_id=${order.product_id}" style="color: #000000; font-weight: bold;">${order.name}</a></td>
		                       	<td><fmt:formatNumber value="${order.price}" type="number" pattern="#,###" /></td>
		                       	<td><fmt:formatNumber value="${order.price * order.quantity}" type="number" pattern="#,###" /></td>
		                        <td>${order.quantity}</td>
		                        <td>${order.size}</td>
		                        <td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd" /></td>
		                        <td>
		                            <c:choose>
		                                <c:when test="${order.order_req == 0}">
		                                    배송중
		                                </c:when>
		                                <c:when test="${order.order_req == 1}">
		                                    배송완료
		                                </c:when>
		                            </c:choose>
		                        </td>
			                    <td>${order.address}</td>
			                    </tr>
			                </c:forEach>
			            </tbody>
				</table>
			</div>

			<!-- 회원 정보 -->
			<div class="tab-pane fade" id="user-info">
				<h3>회원 정보</h3>
				<dl class="row">
					<dt class="col-sm-3">이름</dt>
					<dd class="col-sm-9">${user.username}</dd>

					<dt class="col-sm-3">이메일</dt>
					<dd class="col-sm-9">${user.email}</dd>

					<dt class="col-sm-3">전화번호</dt>
					<dd class="col-sm-9">${user.tel}</dd>

					<!-- RRN을 생년월일로 표시하려면 처리가 필요하며, 아래는 RRN 전체를 출력하는 예제입니다. -->
					<dt class="col-sm-3">생년월일</dt>
					<dd class="col-sm-9">${user.RRN}</dd>
				</dl>
				<!-- 수정 버튼 -->
				<a href="/changePwd">비밀번호 변경</a>
				<!-- <button class="btn btn-primary mb-4" id="editBtn" >정보 수정</button> -->

				<!-- 수정 양식 -->
				<form id="userInfoEditForm" style="display: none;">
					<div class="form-group">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" value="홍길동">
					</div>
					<div class="form-group">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" value="example@email.com">
					</div>
					<div class="form-group">
						<label for="phone">전화번호</label> <input type="text"
							class="form-control" id="phone" value="010-1234-5678">
					</div>
					<div class="form-group">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address" value="서울시 강남구 어딘가로 123번지">
					</div>
					<div class="form-group">
						<label for="birthdate">생년월일</label> <input type="date"
							class="form-control" id="birthdate" value="1990-01-01">
					</div>
					<button type="submit" class="btn btn-success">저장</button>
					<button type="button" class="btn btn-danger" id="cancelEditBtn">취소</button>
				</form>
			</div>

			<!-- 최근 본 상품 
			<div class="tab-pane fade" id="recent-products">
				<h3>최근 본 상품</h3>
				... 여기에 데이터를 추가 ...
				<ul class="list-group">
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						스니커즈 <span class="badge badge-primary badge-pill">2023-09-25</span>
					</li>
					... 추가 최근 본 상품 ...
				</ul>
			</div> -->


			<!-- 나의 리뷰 -->
			<div class="tab-pane fade" id="review-products">

				<div class="tabs-container">
					<div class="tab-item active" onclick="activateTab(this)">
					
						<span class="tab-text">리뷰 쓰기</span> <span class="tab-count"></span>
						<div class="tab-underline"></div>
					</div>
					<div class="tab-item" onclick="activateTab(this)">
						<span class="tab-text">작성한 리뷰</span> <span class="tab-count"></span>
						<div class="tab-underline"></div>
					</div>
				</div>

				<!-- 리뷰쓰기 탭의 내용 -->
				<div id="write-review-content">
				    <c:forEach var="productOrderDetails" items="${review}">
				        <div class="card-container">
				            <img src="${productOrderDetails.img1}" alt="Product Image" class="card-image">
				            <div class="card-content">
				                <div>
				                    <span class="highlight">${productOrderDetails.name}</span> 
				                </div>
				                <div>${productOrderDetails.size}/${productOrderDetails.quantity}개</div>
				            </div>
				            <form action="review" method="get">
				                <input type="hidden" name="productId" value="${productOrderDetails.product_id}"/>
				                <button type="submit" class="card-btn">리뷰쓰기</button>
				            </form>
				        </div>
				    </c:forEach>
				</div>

				<!-- 작성한 리뷰 탭의 내용 -->
				<div id="written-review-content">
				    <c:forEach var="reviewDetail" items="${clreview}" varStatus="status">
				    
				        <div class="written-card-container">
				            <!-- 이미지와 제목 -->
				            <div class="imgtext">    
				                <c:if test="${reviewDetail.review_img != null}">
				                    <img src="${reviewDetail.review_img}" alt="Reviewed Product Image" class="written-card-image" onclick="showFullImage(this.src)">
				                </c:if>
				                
				                <div class="written-card-content">
				                    <div class="written-card-title">${reviewDetail.name}</div>
				                </div>
				            </div>
				            <!-- 리뷰 상세 -->
				            <div class="review-detail">
				                <span class="review-date">작성일: ${reviewDetail.formattedReviewDate}</span>
				                <span class="review-points">
				                    <c:forEach begin="1" end="${reviewDetail.star_score}" var="i">
				                        ★
				                    </c:forEach>
				                </span>
				                <!-- 요약된 리뷰 텍스트 -->
				                <div class="review-text" id="summary-${status.index}">
				                    <c:choose>
				                        <c:when test="${fn:length(reviewDetail.content) > 40}">
				                            ${fn:substring(reviewDetail.content, 0, 40)}...
				                        </c:when>
				                        <c:otherwise>
				                            ${reviewDetail.content}
				                        </c:otherwise>
				                    </c:choose>
				                </div>
				                <!-- 전체 리뷰 텍스트, 초기에는 숨김 -->
				                <div class="review-text-full" id="full-${status.index}" style="display: none;">
				                    ${reviewDetail.content}
				                </div>
					                <!-- 자세히 버튼 (긴 리뷰일 경우에만 표시) -->
					                <div class="review-detail-actions" >
						                <c:if test="${fn:length(reviewDetail.content) > 40}">
						                	<a href="javascript:void(0);"onclick="toggleReview(${status.index})"><i class="card-btn">자세히</i></a>
						                </c:if>
						                
						                <a href="/ChangeReview?review_id=${reviewDetail.review_id}&product_id=${reviewDetail.product_id}
						                &content=${reviewDetail.content}&star_score=${reviewDetail.star_score}">
						                    <i class="card-btn">수정하기</i>
						                </a>
						                <br>
						                <a href="/product_detail?product_id=${reviewDetail.product_id}"><i class="card-btn">상품으로</i></a>
						             </div>
					            </div>
					        </div>
					    </c:forEach>
					</div>
				</div>
			</div>
		</div>
		

		<!-- AOS JS -->
		<script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
		<script>
		function showFullImage(src) {
			  var img = new Image();
			  img.onload = function() {
			    // 이미지가 로드되면 모달의 크기를 이미지 크기에 맞게 조정
			    var width = this.naturalWidth;
			    var height = this.naturalHeight;
			    var windowWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
			    var windowHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
			    
			    // 이미지가 화면보다 크면 화면 크기에 맞춰 조정
			    if (width > windowWidth || height > windowHeight) {
			      var aspectRatio = width / height;
			      if (width > windowWidth) {
			        width = windowWidth;
			        height = width / aspectRatio;
			      }
			      if (height > windowHeight) {
			        height = windowHeight;
			        width = height * aspectRatio;
			      }
			    }

			    // Bootstrap 모달의 .modal-dialog에 새로운 스타일을 적용
			    var modalDialog = document.querySelector('#imageModal .modal-dialog');
			    modalDialog.style.maxWidth = width + 'px';

			    // 모달 컨텐츠에 새로운 스타일을 적용
			    var modalContent = document.querySelector('#imageModal .modal-content');
			    modalContent.style.maxWidth = width + 'px';
			    modalContent.style.maxHeight = height + 'px';

			    // 이미지 태그에 새로운 소스와 스타일을 적용
			    var modalImage = document.getElementById('modalImage');
			    modalImage.src = src;
			    modalImage.style.width = width + 'px';
			    modalImage.style.height = height + 'px';

			    // 모달 표시
			    $('#imageModal').modal('show');
			  }
			  img.src = src; // 이미지 로드 시작
			}
		function toggleReview(index) {
		    var summary = document.getElementById('summary-' + index);
		    var full = document.getElementById('full-' + index);
		    var image = document.getElementById('image-' + index);

		    if (full.style.display === 'none' || full.style.display === '') {
		        // 리뷰 내용 확장
		        summary.style.display = 'none';
		        full.style.display = 'block';
		        if (image) {
		            image.style.width = '100px';
		            image.style.height = '100px';
		        }
		    } else {
		        // 리뷰 내용 축소
		        summary.style.display = 'block';
		        full.style.display = 'none';
		        if (image) {
		            image.style.width = '50px';
		            image.style.height = '50px';
		        }
		    }
		}
		</script>
		<script>
		AOS.init();

		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// 정보 수정 버튼 클릭
							document
									.getElementById("editBtn")
									.addEventListener(
											"click",
											function() {
												document
														.getElementById("userInfoDisplay").style.display = "none";
												document
														.getElementById("editBtn").style.display = "none";
												document
														.getElementById("userInfoEditForm").style.display = "block";
											});

							// 수정 취소 버튼 클릭
							document
									.getElementById("cancelEditBtn")
									.addEventListener(
											"click",
											function() {
												document
														.getElementById("userInfoEditForm").style.display = "none";
												document
														.getElementById("editBtn").style.display = "block";
												document
														.getElementById("userInfoDisplay").style.display = "block";
											});

							// 저장 버튼 클릭 (양식 제출)
							document.getElementById("userInfoEditForm")
									.addEventListener("submit",
											function(event) {
												event.preventDefault();

												// ... 서버로 데이터 전송 코드 ...

												// ... 성공 시, 기존 정보 업데이트 및 수정 양식 숨김 ...
											});
						});
		
		/* 나의 리뷰  */
		function activateTab(tabElement) {
			document.querySelectorAll('.tab-item').forEach(tab => {
			tab.classList.remove('active'); }); tabElement.classList.add('active');
			}
			
			function activateTab(tabElement) {
			    // 모든 탭을 비활성화
			    document.querySelectorAll('.tab-item').forEach(tab => {
			        tab.classList.remove('active');
			    });

			    // 클릭된 탭만 활성화
			    tabElement.classList.add('active');

			    // 클릭된 탭에 따라 해당 내용만 표시
			    if (tabElement.querySelector('.tab-text').textContent.trim() === "리뷰 쓰기") {
			        document.getElementById('write-review-content').style.display = 'block';
			        document.getElementById('written-review-content').style.display = 'none';
			    } else if (tabElement.querySelector('.tab-text').textContent.trim() === "작성한 리뷰") {
			        document.getElementById('write-review-content').style.display = 'none';
			        document.getElementById('written-review-content').style.display = 'block';
			    }
			}
	</script>
	<script>
    // 페이지 로드 시 초기화
    document.addEventListener("DOMContentLoaded", function() {
        // 모든 탭에 대한 클릭 이벤트 리스너 설정
	        var tabs = document.querySelectorAll('.nav-tabs .nav-link');
	        tabs.forEach(function(tab) {
	            tab.addEventListener('click', function(event) {
	                event.preventDefault();
	
	                // 모든 탭의 내용을 숨김
	                var tabContents = document.querySelectorAll('.tab-content .tab-pane');
	                tabContents.forEach(function(content) {
	                    content.classList.remove('show');
	                    content.classList.remove('active');
	                });
	
	                // 모든 탭의 활성화 상태 제거
	                tabs.forEach(function(tab) {
	                    tab.classList.remove('active');
	                });
	
	                // 클릭된 탭과 관련된 탭 내용을 활성화
	                var activeTabContent = document.querySelector(this.getAttribute('href'));
	                if (activeTabContent) {
	                    activeTabContent.classList.add('show');
	                    activeTabContent.classList.add('active');
	                }
	
	                // 클릭된 탭을 활성화 상태로 설정
	                this.classList.add('active');
	            });
	        });
	        var myReviewTab = document.getElementById('my-review-tab');
	        if (myReviewTab) {
	            myReviewTab.addEventListener('click', function() {
	                // 첫 번째 'tab-item'을 찾아 '리뷰 쓰기' 탭을 활성화
	                var reviewWriteTab = document.querySelector('.tabs-container .tab-item');
	                if (reviewWriteTab) {
	                    activateTab(reviewWriteTab);
	                }
	            });
	        }
	    });
	</script>
		<div id="imageModal" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
		    <div class="modal-content">
		      <div class="modal-body">
		        <img id="modalImage" src="" class="img-fluid" alt="Full Size Image">
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>