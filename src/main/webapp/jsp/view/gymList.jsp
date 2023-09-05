<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>운동시설 상세 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/view/gymList.css"/>
    <link rel="icon" href="../img/로고.png">
</head>

<body>
    <div class="container">
        <div class="gym-list-container"> <!-- 10개의 컨텐츠를 포괄하는 컨테이너 -->
            
            <%String imgLink = "/bbagym/src/uploadFile/"; %>
              <c:choose>
                 <c:when test = "${not empty getList}">
                    <c:forEach var= "board" items="${getList}">
                    <div class="list-content"> <!--가로로 한개의 컨텐츠를 묶음-->
                        <div class="list-content">
               
                        <div class="list-img-box"><!--게시판 사진 컨테이너-->
                            <a href="selBoardDetailOk.bo?boardNum=${board.getBoardNum()}">
                            
                            <img class="list-img" src="${pageContext.request.contextPath}/uploadFile/${board.getImageName()}"/><!-- } -->
                               
                            </a>
                        </div>
              
                    <div class="list-info"> <!--게시판의 정보(텍스트)-->
                        <p class="gym-title"><c:out value = "${board.getBoardName()}"/></p>
                        <p class="gym-address"><c:out value = "${board.getBoardAddress()}"/></p> 
                        <br>
                        
                      
                        <div class="gym-category-box-sort">
                            <div class="gym-category-box"> 
                                <div class="gym-category"><c:out value = "${board.getBoardCategory()}"/></div>
                            </div>
                   
                        </div>
                    </div>
                </div>
                </div>
                </c:forEach>
                </c:when>
               </c:choose>
                
        </div>
        
<%--          <div class="pagination">
        <ul>
          <!-- ========== 페이징 처리 예시 ============ -->
          
          <c:if test="${prev}">
          <li><a href="${pageContext.servletContext.contextPath}/jsp/view/gymList.bo?page=${startPage-1}" class="prev">&lt;</a></li>
          </c:if>
          <c:forEach begin="${startPage}" end="${endPage}" var="i">
             <li>
                <c:if test="${page == i}">
                   <a href="${pageContext.servletContext.contextPath}/jsp/view/gymList.bo?page=${i}" class="active">${i}</a>
                </c:if>
                <c:if test="${page != i}">
                   <a href="${pageContext.servletContext.contextPath}/jsp/view/gymList.bo?page=${i}">${i}</a>
                </c:if>
             </li>
          </c:forEach>
          <c:if test="${next}">
             <li><a href="${pageContext.servletContext.contextPath}/jsp/view/gymList.bo?page=${endPage+1}" class="next">&gt;</a></li>
          </c:if>
          <!-- ========== /페이징 처리 예시 ============ -->
        </ul>
      </div> --%>
      
        <div class="input-form">
        <form action ="boardWrite.bo"> <!-- gymWrite.bo?businessUserNum?=${board.getBusinessUserNum()} -->
           <input type="hidden" value="${businessUserNum}"/>
            <button class="write-button" type="submit">글작성</button>
         </form>   
        </div>
    </div>
    </div>
<%-- <%@include file="../../footer.jsp" %> --%>
</body>
</html>