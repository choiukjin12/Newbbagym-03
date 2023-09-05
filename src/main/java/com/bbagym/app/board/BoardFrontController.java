package com.bbagym.app.board;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbagym.app.Result;

/**
 * Servlet implementation class AdminFrontController
 */
//@WebServlet("/AdminFrontController")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	// jsp프로젝트에서는 get과 post를 구분하지 않고 사용
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("board 서블릿이 실행");

		// request.getContextPath()는 URL루트 경로를 의미한다
		System.out.println(request.getContextPath());

		// request.getRequestURI는 현재 요청의 URI를 보여준다
		System.out.println(request.getRequestURI());

		// 전체 URI에서 ContextPath를 제외시킨 부분이 필요하다
		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(target);
		Result result = null;
		// 단순한 값비교는 if문보다 switch문이 효율성이 좋고 가독성도 좋다
		// break문을 꼭 써야된다!
		switch (target) {
		case "/jsp/form/boardWriteOk.bo":
			System.out.println("boardWriteOk.me 실행");
			// new BoardWriteOkController()
			response.sendRedirect("/bbagym/jsp/view/boardList.bo");

		case "/jsp/view/boardList.bo":
			System.out.println("boardList.me 실행");
			request.getRequestDispatcher("gymList.jsp").forward(request, response);
		case "/jsp/view/commentWriteOk.bo":
			System.out.println("댓글 FrontController 실행");
			new CommentWriteOkController().execute(request, response);
			request.getRequestDispatcher("/jsp/view/boardDetail.bo").forward(request, response);
		case "/jsp/view/boardDetail.bo":
			new CommentListController().execute(request, response);
			request.getRequestDispatcher("gymDetaile.jsp").forward(request, response);
			break;
		case "/jsp/view/commentDelete.bo": 
			new CommentDeleteController().execute(request,response);
			response.sendRedirect("/bbagym/jsp/view/boardDetail.bo");
			break; 
			case "/view/gymWrite.bo":
	              System.out.println("글쓰기준비작업!");
//	              if(request.getParameter("businessUserNum") == null ||request.getParameter("businessUserNum") == "") {
//	                 response.sendRedirect("gymList.bo");
//	              }else {
//	                 request.getRequestDispatcher("/jsp/form/gymWrite.jsp").forward(request, response);
//	              }
	              
	              break;
	              
	          case "/gymWriteOk.bo":
	             System.out.println("글쓰기 완료!!");
	             
	             ServletContext context = getServletContext();
	             String relativePath = "src/uploadFile";             
	             String realPath ="C:\\Users\\com\\Desktop\\finalBbagym\\bbagym\\src\\main\\webapp\\uploadFile";
	             result = new GymWriteOkController(realPath).execute(request, response);
	             request.getRequestDispatcher("gymList.bo").forward(request, response);
	             break;
	              
	           case "/jsp/view/gymDetail.bo" :
	              System.out.println("글상세페이지 진입");
	              break;
	              
	           case "/gymList.bo":
	               System.out.println("Calling /board/gymlist.bo");
	               System.out.println("컨트롤러 이동합니다.");
	               new GymListOkController().execute(request, response);
	               request.getRequestDispatcher("/jsp/view/gymList.jsp").forward(request, response);
	               break;
	               
	           case "/selBoardDetailOk.bo":
	               System.out.println("selBoardDetailOk!!");
	               result = new SelBoardDetailOkController().execute(request, response);
	               request.getRequestDispatcher("/jsp/view/gymDetaile.jsp").forward(request, response);
	               break;
	               
	            case "/jsp/view/delBoardDetailOk.bo":
	               System.out.println("delBoardDetailOk!!");
	               result = new DelBoardDetailOkController().execute(request, response);
	               break;
	               
	            case "/boardWrite.bo":
	            	request.getRequestDispatcher("/jsp/form/gymWrite.jsp").forward(request, response);
	            	
	            case "/gymDelete.bo":
	            	new GymDeleteController().execute(request,response);
	            	request.getRequestDispatcher("gymList.bo").forward(request, response);
	            	break;
	            	
	            case "/gymUpdate.bo":
	            	System.out.println("gymUpdate 실행");
	            	request.getRequestDispatcher("/jsp/form/gymUpdate.jsp").forward(request, response);
	            	break;
	            	
	            case "/gymUpdateOk.bo":
	            	System.out.println("글 수정 시작");
	            	new GymUpdateController().execute(request,response);
	            	break;
	           }  
	
		}

	}

