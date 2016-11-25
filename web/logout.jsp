<%-- 
    Document   : logout
    Created on : Jul 19, 2016, 10:36:50 PM
    Author     : SyasyaAzizanRejab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    session.invalidate();
    HttpSession newSession = request.getSession(false);
    response.sendRedirect("index.jsp");
%>
