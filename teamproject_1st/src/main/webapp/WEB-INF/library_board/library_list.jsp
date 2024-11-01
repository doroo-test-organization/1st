<%@page import="FrontController.vo.libraryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ include file="../../include/header.jsp" %>

<%
	List<libraryVO> list = (List<libraryVO>)request.getAttribute("list");
	String searchValue = (String)request.getAttribute("searchValue");
	String searchType = (String)request.getAttribute("searchType");
	int currentPage = (Integer) request.getAttribute("currentPage");
    int totalPages = (Integer) request.getAttribute("totalPages");
%>

<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>library_board_list</title>
    <style>
    	        /* 내용 부분 시작*/
        section{
          flex-grow: 1;
          padding-bottom: 80px;
        }
        form{
            margin-left: 450px;
        }
        form select{
            position: absolute;
            margin-top: 30px;
            height: 62px;
            width: 100px;
            text-align: center;
        }
        .library_board_input{
            margin-left: 549px;
            margin-top: 10px;
        }
        .library_board_input input{
            width: 900px;
            height: 50px;
        }
        .library_board_img{/*돋보기*/
            position: absolute;
            margin-left: 947px;
            margin-top: -62px;
        }
        .library_title{
          position: absolute;
          left: 50%;
          margin: 47px 0 0 -600px;
          padding: 0;
        }
        .table{
          position: absolute;
          left: 50%;
          margin: 140px 0 0 -600px;
          border: 0;
          border-collapse: collapse;
          text-align: center;
        }
        .table tbody td{
          height: 40px;
          border-left: none;
          border-right: none;
        }
        tbody td>a{
          text-decoration: none;
          color: black;
        }
        .table thead th{
          border-left: none;
          border-right: none;
        }
        .button{
          width: 80px;
          height: 30px;
          font-size: 15px;
          border: none;
          border-radius:20px;
          margin-top: 670px;
          margin-left: 1480px;
          cursor: pointer;
        }
        .search_button{
          width: 61px;
          height: 62px;
        }
        .search_input{
          width: 1000px;
          height: 56px;
          margin-top: 30px;          
          text-align: center;
        }
        /* 내용 부분 끝 */
        .paging{
        	width:50px;
        	margin: auto;
        }
        .paging a{
        	color: black;
        	text-decoration: none;
        }
    </style>
</head>
<body>
      <section>
        <form action="<%=request.getContextPath() %>/library/library_list.do" method="get" >
            <select name="searchType">
                <option value="title" <%=searchType != null && searchType.equals("title")?"seleced":"" %>>제목</option>
                <option value="content" <%=searchType != null && searchType.equals("content' ")?"seleced":"" %>>내용</option>
            </select>
            <input type="text" class="search_input" placeholder="검색어를 입력해주세요." name="searchValue" >
            <div class="library_board_img">
                <button class="search_button" type="submit" >검색</button>
            </div>
        </form>
        <div class="library_board_input">
        </div>
        <h2 class="library_title">자료실</h2>
        <table frame="void" border="1" class="table">
          <thead style="background-color: #f7f7f7;" height="45px">
            <tr>
              <th width="100">NO</th>
              <th width="850">제목</th>
              <th width="150">등록일</th>
              <th width="100">조회수</th>
            </tr>
          </thead>
          <tbody>
          <%for(libraryVO vo : list){%>
           <tr>
				<td><%=vo.getLno() %></td>
				<td>
              		<a href="<%=request.getContextPath() %>/library/library_view.do?lno=<%=vo.getLno() %>">
              		<%=vo.getTitle() %>
              		</a>
				</td>
              <td><%=vo.getRdate() %></td>
              <td><%=vo.getHit() %></td>
            </tr>
          <%} %>
          </tbody>
        </table>
            <button class="button" onclick="location.href='<%=request.getContextPath()%>/library/library_write.do'">등록</button>
            <!-- 페이지 네비게이션 추가 -->
        <div class="paging">
        	<%
        		for(int i = 1; i <= totalPages; i++){
        			if(i == currentPage){
        				out.print("<strong>" + i + "</strong> ");
        			}else{
        				out.print("<a href='" + request.getContextPath() + "/library/library_list.do?page=" + i + "'>" + i + "</a> ");
        			}
        		}
        	%>
        </div>
      </section>
</body>
</html>
<%@ include file="../../include/footer.jsp" %>