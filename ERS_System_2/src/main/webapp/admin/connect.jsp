<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String host = "jdbc:mysql://localhost:3306/ers_2";
Connection conn = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(host,"root","Beyond22");
%>