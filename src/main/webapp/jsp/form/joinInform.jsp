<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../../css/form/joinInform.css">
    <link rel="icon" href="../../img/로고.png">
</head>
<body>
    <div class="container">
        <a href="../../index.jsp">
            <img src="../../img/로고.png" class="logo" />
        </a>
        <form action="joinOk.us" method="post" id="joinForm">
        <div class="inform-container">
                <div class="inform-text">회원분류</div>
                <label for="" class="kind-label">
                    <input type="radio" name="kind" value="common" class="kind-check" id="common" onclick="show()" checked>
                    <div class="kind">일반회원</div>
                    <input type="radio" name="kind" value="registrant" class="kind-check" id="registrant" onclick="hide()">
                    <div class="kind">시설등록자</div>
                </label>
            </div>
            <div class="inform-container">
                <div class="inform-text">아이디</div>
                <input type="text" placeholder="아이디를 입력해주세요" class="inform" id="id" name="userId">
                <div class="checkId-result"></div>
            </div>
            <div class="inform-container">
                <div class="inform-text">비밀번호</div>
                <input type="password" placeholder="비밀번호를 입력해주세요." class="inform" id="pw" name="userPw">
            </div>
            <div class="infrom-container">
                <div class="inform-text">비밀번호 확인</div>
                <input type="password" placeholder="다시 한번 비밀번호를 입력해 주세요." class="inform" id="pw-check">
                <div class="check-text">비밀번호가 일치하지 않습니다</div>
            </div>
            <div class="inform-container">
                <div class="inform-text">이름</div>
                <input type="text" placeholder="이름을 입력해 주세요." class="inform" id="name" name="userName">
            </div>
            <div class="inform-container">
                <div class="inform-text">휴대폰 번호</div>
                <input type="text" placeholder="-없이 입력해 주세요." class="inform" id="phone" name="userPhone"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
            </div>
            <div class="inform-container">
                <div class="inform-text">이메일</div>
                <input type="email" placeholder="bbagym@bbagym.co.kr" class="inform" id="email" name="userEmail">
                <div class="checkEmail-result"></div>
            </div>
            
            <div class="business-container show" id="business-container">
                <div class="inform-text">사업자 번호</div>
                <input type="text" placeholder="-없이 입력해 주세요." class="inform" id="business" name="businessNum"onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
            </div>
            <input type="submit" value="가입완료" class="join-btn" id="join-btn" disabled>
        </form>
    </div>
    <script src="${pageContext.servletContext.contextPath }/js/form/joinInform.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<%@include file="../../footer.jsp" %>
   <script type="text/javascript">
   
      $('.inform-container input#id').on('change', function() {
          let id = $(this).val();

          console.log(this);
          console.log(id);

          $.ajax({
              url: "${pageContext.request.contextPath}/checkIdOk.us",
              type: "get",
              data: { "id": id },
              success: function (result) {
                  console.log(result);
                  $(".checkId-result").text(result);
              }
          });
      });
      

      
      $(document).ready(function() {
          $('.inform-container input#common').on('click', function() {
              // 체크 박스가 선택되면
              if ($(this).is(':checked')) {
                  $('.inform-container input#id').on('change', function() {
                      let id = $(this).val();
                      console.log(this);
                      console.log(id);

                      $.ajax({
                          url: "${pageContext.request.contextPath}/checkIdOk.us",
                          type: "get",
                          data: { "id": id },
                          success: function(result) {
                              console.log(result);
                              $(".checkId-result").text(result);
                          }
                      });
                  });
              } else {
                  // 체크 박스가 선택되지 않으면 기존 이벤트 핸들러 그대로 유지
              }
          });
      });
   
   

   
   $(document).ready(function() {
       $('.inform-container input#registrant').on('click', function() {
           // 체크 박스가 선택되면
           if ($(this).is(':checked')) {
               $('.inform-container input#id').on('change', function() {
                   let id = $(this).val();
                   console.log(this);
                   console.log(id);

                   $.ajax({
                       url: "${pageContext.request.contextPath}/checkBusinessIdOk.bu",
                       type: "get",
                       data: { "id": id },
                       success: function(result) {
                           console.log(result);
                           $(".checkId-result").text(result);
                       }
                   });
               });
           } else {
               // 체크 박스가 선택되지 않으면 기존 이벤트 핸들러 그대로 유지
           }
       });
   });
   
   
   </script>
</body>
</html>