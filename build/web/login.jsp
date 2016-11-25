<%-- 
    Document   : login
    Created on : Jul 19, 2016, 4:38:49 PM
    Author     : SyasyaAzizanRejab
--%>

<%@page import="DBConn.Connection"%>
<%@page import = "main.RMIConnector"%>
<%@page import="DBConn.SessionDB"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="bb-alert-callback.js"></script>

<%
    Connection conn = new Connection(); 
    
    // get username and password from login form
    String username = request.getParameter("username");
    String password = request.getParameter("psswd");
    String fullname = "", pmi_no = "";

    // search for record with the same username and password
    // and the ic number juga terdapat dalam table pms_patient_biodata
    String sql = "SELECT st.username, st.password, ppb.`PATIENT_NAME`, ppb.`PMI_NO` "
            + "FROM adm_signup_tbl st, pms_patient_biodata ppb "
            + "WHERE st.username = '" + username + "' "
            + "AND st.password = '" + password + "' "
            + "AND st.ic_no = ppb.new_ic_no ";

    ArrayList<ArrayList<String>> data = Connection.getData(sql);

    if (data.size() <= 0) {
        %>
        <script>
            window.alert("Account does not exist. Please Sign Up.");
            window.location='index.jsp';
        </script>
        <%
    } else {
        session.setAttribute("username", username);
        fullname = data.get(0).get(2);
        pmi_no = data.get(0).get(3);
        SessionDB.setUsername(username);
        SessionDB.setPassword(password);
        SessionDB.setFullname(fullname);
        SessionDB.setPmino(pmi_no);
        response.sendRedirect("user-main-page.jsp");
    }
%>

