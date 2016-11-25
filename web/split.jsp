<%-- 
    Document   : split
    Created on : Aug 18, 2016, 4:18:18 PM
    Author     : user
--%>

<%@page import="java.util.Scanner"%>
<%@page import="controllers.GetLHR"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Helper.Func"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
             String data = "2016-08-16 16:17:52.0";
             GetLHR pisah = new GetLHR();
             Scanner scanner = new Scanner("");
             out.println(pisah.getTime(data) + scanner.nextLine() + pisah.getDate(data));
            %>
    </body>
</html>
