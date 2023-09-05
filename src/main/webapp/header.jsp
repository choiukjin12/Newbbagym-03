<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main-header</title>
   <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/css/header.css">
    <link rel="icon" href="img/로고.png">
</head>
<body>
                <div class="header_full_box">
            <div class="header_nav"><a href="index.jsp"><img src="${pageContext.servletContext.contextPath}/img/로고.png" width="100px" height="40px"></a></div>
           <div class="header_nav"><a href="gymList.bo">운동시설</a></div>
                       <c:choose>
               <c:when test="${not empty sessionScope.userNum }">
                  <div class="header_nav"><a href="jsp/view/myPage.jsp">마이페이지</a></div>
               </c:when>
               <c:when test="${not empty sessionScope.BusinessUserNum }">
                  <div class="header_nav"><a href="jsp/view/myPage.jsp">마이페이지</a></div>
               </c:when>
               <c:otherwise>
                  <div class="header_nav"><a href="#" onclick="alert('로그인을 해주세요');">마이페이지</a></div>
               </c:otherwise>
            </c:choose>
           
            <div class="header_nav"><a href="jsp/view/announcement.jsp">공지사항</a></div>
            <div class="header_nav"><a href="jsp/view/faq.jsp">FAQ</a></div>
            <div class="header_nav"><a href="jsp/form/search.jsp"><input type="text" placeholder=" 운동시설 검색" id="serch"></a></div>
             <c:choose>
      <c:when test = "${not empty sessionScope.userNum }">
         <div class="header_nav" id="new-div"><a href="${pageContext.request.contextPath}/jsp/view/myInformation.jsp">${sessionScope.userName}님</a></div>
         <form action="${pageContext.request.contextPath}/logoutOk.us">
            <div class="header_nav"><button id="new-btn">로그아웃</button></div>
         </form>
      </c:when>
      <c:when test = "${not empty sessionScope.BusinessUserNum }">
         <div class="header_nav" id="new-div"><a href="${pageContext.request.contextPath}/jsp/view/myInformation.jsp">${sessionScope.BusinessUserName}님</a></div>
         <form action="${pageContext.request.contextPath}/logoutOk.us">
            <div class="header_nav"><button id="new-btn">로그아웃</button></div>
         </form>
      </c:when>
      <c:otherwise>
         <div class="header_nav"><a href="jsp/form/login.jsp">로그인</a></div>
            <div class="header_nav"><a href="jsp/form/joinAgree.jsp">회원가입</a></div>
      </c:otherwise>   
</c:choose>       
           
        </div>
</body>
</html>