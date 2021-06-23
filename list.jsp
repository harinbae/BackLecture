<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@	page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Diary List</title>
<style>
	#board{
		width  		: 710px;
		height 		: 100px;
		border 		: 1px solid #ddd;
		border-width: 1px 0px 0px 0px;
	}
	
	#boardBtn {
		display					: block;
		width					: 110px;
		height					: 30px;
		border					: 1px solid #ddd;
		background-color		: #FF80AB;
		text-align				: center;
		border-radius			: 10px;
		padding-left			: 600px;
	}
	
	#board span{
		display			: block;
		width			: 100px;
		border			: 1px solid #ddd;
		height			: 20px;
		float			: left;
		text-align		: center;
		color			: #FF80AB;
	}
</style>
</head>
<body>
	<%
		// db 연동
		
		Connection con 	= null;	 
		Statement  stmt = null;
		ResultSet  rs	= null;
		
		 String userId = "travel";
	 	 String userPass = "1";
	 	 String url = "jdbc:oracle:thin:@localhost:1521:xe";
	 	 
	 	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 	 
	 	 String strSql = "SELECT CNUM, IDX, TITLE, CONTENTS, HID, TO_CHAR(HDATE,'YYYY-MM-DD') AS HDATE FROM DIARY ORDER BY IDX DESC";
	 	 
	 	 con  = DriverManager.getConnection(url, userId, userPass);
	 	 stmt = con.createStatement();
	 	 rs   = stmt.executeQuery(strSql);
		 
	
	%>
	<div>
	<div id = "boardBtn">
		<a href = "./practice.jsp"><span>일기쓰기</span></a>
		<a href = "./logout.jsp"><span>퇴장</span></a>
	</div>
	<div id="board">
		<%
			while(rs.next()){
		%>
		<div>
			<span style = "width: 50px"><%=rs.getString("CNUM") %></span>
			<a href="./contents.jsp?idx=<%=rs.getString("IDX") %>"><span><%=rs.getString("TITLE") %></span></a>
			<span style = "width: 350px"><%=rs.getString("CONTENTS") %></span>
			<span><%=rs.getString("HID") %></span>
			<span><%=rs.getString("HDATE") %></span>
		</div>
		<% 
			}
		
		%>
	</div>
		<%
			rs.close();
	 		con.close(); 
	 	%>
	</div>
</body>
</html>
