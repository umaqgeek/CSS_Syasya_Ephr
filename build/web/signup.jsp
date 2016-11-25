<%-- 
    Document   : signup
    Created on : Jul 19, 2016, 11:07:49 PM
    Author     : SyasyaAzizanRejab
--%>

<%@page import="DBConn.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String ic = request.getParameter("reg-ic-no");
    String email = request.getParameter("reg-email");
    String uname = request.getParameter("reg-uname");
    String psswd = request.getParameter("reg-psswd");

    // search ic no, if not exist, alert error message
//       hanya patient yang nama nya terdapat dalam table pms_patient_biodata sahaja dapat gunakan e-PHR
    String searchICNo = "SELECT * FROM pms_patient_biodata WHERE new_ic_no = '"+ic+"'";
    ArrayList<ArrayList<String>> newuser = Connection.getData(searchICNo);
    
    if(newuser.size() <= 0)
    {
        %>
            <script>
                window.alert("Your IC Number is invalid.");
                window.location='index.jsp';
            </script>
        <%
    } else
    {
        // jika recordnya ada dalam pms_patient_biodata, continue with insert process
        String insertSignUp = "INSERT INTO adm_signup_tbl (ic_no, username, password, email) "
            + "VALUES ('"+ic+"', '"+uname+"', '"+psswd+"', '"+email+"')";
        boolean status = Connection.setData(insertSignUp);
        if(status)
        {
            %>
                <script>
                    window.alert("Successully register. Please login to continue.");
                    window.location='index.jsp';
                </script>
            <%
        } else
        {
            %>
                <script>
                    window.alert("Registration failed. Try again later.");
                    window.location='index.jsp';
                </script>
            <%
        }
    }
        
%>



