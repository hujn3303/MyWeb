<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String accountNumber = request.getParameter("accountNumber");
		String password = request.getParameter("password");
		String userName = "";
	
		boolean flage = false;
		try {
			Scanner sc = new Scanner(new File("C:\\Users\\liang\\Desktop\\userlist.txt"));
			while (sc.hasNextLine()) {
				String line = sc.nextLine();
				String[] ss = line.split("\\s+");
				String oldPassword = ss[2];
				
				if (ss[0].equals(accountNumber) && MD5.checkpassword(password,oldPassword)) {
					flage = true;
					userName = ss[1];
					break;
				}
				
			}
			sc.close();
		} catch (Exception e) {

		}

		if (flage) {
			session.setAttribute("accountNumber", accountNumber);
			response.sendRedirect("loginSuccessfully.html");
		} else {
			response.sendRedirect("login.html");
		}
	%>
</body>
</html>