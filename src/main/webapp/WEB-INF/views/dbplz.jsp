<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 센터</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0px 2px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-header, .card-footer {
            background: none;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center mb-5">고객 센터</h2>

    <div class="row">
        <!-- FAQ Section -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-header bg-primary text-white">자주 묻는 질문</div>
                <div class="card-body">
                    <!-- Individual FAQ item -->
                    <h5>Q: 주문 취소는 어떻게 하나요?</h5>
                    <p>A: 주문 취소는 고객 센터로 문의해 주세요.</p>
                </div>
            </div>
        </div>

        <!-- QnA Section -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-header bg-success text-white">QnA</div>
                <div class="card-body">
                    <!-- Individual QnA item -->
                    <h5>Q: 제품 A의 배송 일정은 언제인가요?</h5>
                    <p>A: 제품 A의 배송 일정은 고객 센터로 문의해 주세요.</p>
                </div>
                <div class="card-footer">
                    <a href="write_inquiry.jsp" class="btn btn-info">1:1 문의 작성하기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
