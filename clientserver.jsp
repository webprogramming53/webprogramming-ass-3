<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>survey_ques3</title>
</head>
<body>
session.setAttribute("q3",q);
%>
<h2>question 1?</h2>
<h3>Answer - a1</h3>
<h2>question 2?</h2>
<h3>Answer - b2</h3>
<h2>question 3?</h2>
<h3>Answer - d3</h3>
<%
int i=0;
String q1=(String)session.getAttribute("q1");
out.println("question 1 selected option "+q1);
if(q1.equals("a1"))
{
out.println("question 1 correct ");
i=i+1;
}
else
{
out.println("question 1 wrong ");
}
%>
<br>
<%
String q2=(String)session.getAttribute("q2");
out.println("question 2 selected option"+q2);
if(q2.equals("b2"))
{
out.println("question 2 correct ");
i=i+1;
}
else
{
out.println("question 2 wrong ");
}
%>
<br>
<%
String q3=(String)session.getAttribute("q3");
out.println("question 3 selected option "+q3);
if(q.equals("d3"))
{
out.println("question 3 correct ");
i=i+1;
}
else
{
out.println("question 3 wrong ");
}
out.println("Score = "+i+"/3");
%>
<br>
<a href="storedb.jsp"><button>OK</button></a>
<a href="index.jsp"><button>Cancel</button></a>
</body>
</html>
storedb.jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank you</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost/test"
user="root" password=""/>
<%
String q1=(String)session.getAttribute("q1");
String q2=(String)session.getAttribute("q2");
String q3=(String)session.getAttribute("q3");
String name=(String)session.getAttribute("name");
%>
<sql:update dataSource="${db}" var="count">
INSERT INTO wpsa3q1 VALUES ('${name}','${q1}','${q2}','${q3}');
</sql:update>
<sql:query dataSource="${db}" var="rs">
SELECT * from wpsa3q1;
</sql:query>
<table border="2" width="100%">
<tr>
<th>S.no</th>
<th>q1</th>
<th>q2</th>
<th>q3</th>
</tr>
<c:forEach var="table" items="${rs.rows}">
<tr>
<td><c:out value="${table.name}"/></td>
<td><c:out value="${table.q1}"/></td>
<td><c:out value="${table.q2}"/></td>
<td><c:out value="${table.q3}"/></td>
</tr>
</c:forEach>
</table>
<h1 style="text-align:centre"><c:out value="${'Thanks for taking survey'}"/> </h1>
<a href="index.jsp"><button>Submit another entry</button></a>
</body>
</html>
