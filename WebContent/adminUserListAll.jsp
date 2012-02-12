<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<%@ page import="edu.unlv.cs673.echoteam.UserDAO,
				edu.unlv.cs673.echoteam.helpers.UserHelper,
				java.util.List,
				java.util.ArrayList,
				java.io.PrintWriter,
				java.sql.ResultSet,
				java.sql.SQLException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyAdminLogin.jsp"></jsp:include>


<center>
	<form method="GET" action='UserController' name="listall">
	<table border="1">
	<%
		UserDAO userDao = new UserDAO();
		List<UserHelper> results = userDao.selectAllComputers();
	%>
		<tr>
			<th>&nbsp; &nbsp; &nbsp; Select Record &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; userId &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; userName &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; userPassword &nbsp; &nbsp; &nbsp; </th>
		</tr>
		<%					
		for(UserHelper ch: results){
			out.println("<tr>");
				// Check box for Primary Key (ComputerId)
				out.println("<td><input type=\"checkbox\" name=\"" + ch.getUserId() + "\" />");
				out.println("</td><td>");
				out.println(ch.getUserId());
				out.println("</td><td>");
				out.println(ch.getUserName());
				out.println("</td><td>");
				out.println(ch.getUserPassword());
				out.println("</td>");
			out.println("</tr>");
		}
	%>
	</table>
	<p>
		<input type="submit" value="Add New User" /> &nbsp;
		<input type="submit" name="delete" value="delete" /> &nbsp; 
		<input type="submit" name="edit" value="edit" /> 
	</p>
	</form>
</center>

<jsp:include page="footer.inc"></jsp:include>