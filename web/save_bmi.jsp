<%-- 
    Document   : save_bmi
    Created on : Aug 9, 2016, 8:48:14 PM
    Author     : user
--%>

<%@page import="DBConn.Connection"%>
<%@page import="DBConn.SessionDB"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username = (String)session.getAttribute("username");
        String pmi_no = SessionDB.getPmino();
        
        int hostport = 1099;
        try {
            hostport = Integer.parseInt(Connection.getIpCall().getProperty(Connection.STR_PORT));
        } catch (Exception e) {
            hostport = 1099;
        }
        String host = Connection.getIpCall().getProperty(Connection.STR_HOST); //server hostname
        int port = hostport; //server rmi port number
        RMIConnector.setConfig(Connection.getIpCall().getProperty(Connection.STR_HOST), hostport);

        // get value from bmi form
        String wei = request.getParameter("wei");
        String hei = request.getParameter("hei");
        
        // send value to ehr_central
        boolean status = RMIConnector.addEhrCentral_vts(pmi_no, hei, wei, null, null, null, null);
        if(status)
        {
            %>
                <script>
                    window.alert("Successfully Saved.");
                    window.location='user-main-page.jsp';
                </script>
            <%
                
        } else
        {
            %>
                <script>
                    window.alert("Save Failed.");
                    window.location='user-main-page.jsp';
                </script>
            <%
                
        }
   //}
%>