<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 성공</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/form/findId.css">
    <link rel="icon" href="../../img/로고.png">    

</head>
<body>
    <div class="container">
        <h2>아이디를 찾기 성공했습니다</h2>
        <form action="${pageContext.servletContext.contextPath}/jsp/form/login.jsp">
           <c:choose>        
              <c:when test="${not empty findId}"> 
                  <div class="name-container">
                      <div class="name-text">
                         <h4>회원분류 : 일반회원</h4><br>이름
                      </div>                
                      <div class="name" id="name" >${findId.getUserName() }</div>                    
                  </div>
                  <div class="email-container">
                      <div class="email-text">이메일</div>
                      <div class="name" id="name" >${findId.getUserEmail() }</div>
                  </div>
            
                  <div class="email-container">
                      <div class="email-text">아이디</div>
                      <div class="name" id="name" >${findId.getUserId() }</div>
                  </div>
                  <input type="submit" class="find-id-btn" id="find-id-btn" value = "로그인 하러 가기">                  
             </c:when>
             
             <c:when test="${not empty buFindId}"> 
                  <div class="name-container">
                      <div class="name-text">
                         <h4>회원분류 : 시설등록자</h4><br>이름
                      </div>                
                      <div class="name" id="name" >${buFindId.getBusinessUserName() }</div>                    
                  </div>
                  <div class="email-container">
                      <div class="email-text">이메일</div>
                      <div class="name" id="name" >${buFindId.getBusinessUserEmail() }</div>
                  </div>
            
                  <div class="email-container">
                      <div class="email-text">아이디</div>
                      <div class="name" id="name" >${buFindId.getBusinessUserId() }</div>
                  </div>
                  <input type="submit" class="find-id-btn" id="find-id-btn" value = "로그인 하러 가기">                  
             </c:when>
             <c:otherwise>
           <script>
           alert('입력된 정보로 아이디를 찾을 수 없습니다. 다시 시도해주세요.'); 
           window.location.href= 'http://localhost:8888/bbagym/jsp/form/findId.jsp';
           </script>
   </c:otherwise>
             </c:choose> 
        </form>
    </div>        
    
     <%@include file="../../footer.jsp" %>
 <script src="${pageContext.request.contextPath }/js/form/findId.js"></script>   
</body>
</html>