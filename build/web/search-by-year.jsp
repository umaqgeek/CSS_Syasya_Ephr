<%--   
    Document   : search-by-year
    Created on : Jul 20, 2016, 8:28:25 AM
    Author     : SyasyaAzizanRejab
--%>

<%@page import="java.util.Calendar"%>
<%@page import="beans.LHR_Weight_Height_bean"%>
<%@page import="beans.LHR_Blood_Pressure_bean"%>
<%@page import="beans.LHR_Blood_Glucose_bean"%>
<%@page import="beans.LHR_Family_History_bean"%>
<%@page import="beans.LHR_Past_Medical_bean"%>
<%@page import="beans.Patient_Biodata_bean"%>
<%@page import="beans.LHR_DTO_bean"%>
<%@page import="beans.LHR_Signs_bean"%>
<%@page import="controllers.GetLHR"%>
<%@page import="DBConn.SessionDB"%>
<%@page import="controllers.GetPMS"%>
<%@page import="DBConn.DBQuery_1"%>
<%@page import="Process.MainRetrieval"%>
<%@page import="Helper.Func"%>
<%@page import="DBConn.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<% 
    String username = (String)session.getAttribute("username");
    %>

<style>
    #displayhistory
    {
        text-align: center;
        align-content: center;
    }
    #vts { color: #d2143a; }
    #dto { color: #009900; }
    #ccn { color: #0000e6; }
    #past, #family { color: #993333; }
</style>

<%
    
    String pmi_no = SessionDB.getPmino();

        
    // get current year
    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR); 

    // get year to view historical record
    String selected_year = request.getParameter("year");
    if (!(selected_year != null && !selected_year.isEmpty())) 
    {
        // set default year
        selected_year = String.valueOf(year);
    }
    
    try 
    {
        if (username.equals("")) 
        {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) 
    {
        response.sendRedirect("index.jsp?stat_user=" + e.getMessage());
    }

    String ic_no = "-", name = "-", gender = "-", blood_group = "-", allergy = "-", dob = "-";

    // get patient information
    GetPMS gpms = new GetPMS();
    ArrayList<Patient_Biodata_bean> user_beans = gpms.getPatientdata(pmi_no);

    if (user_beans.size() <= 0) 
    {
        response.sendRedirect("index.jsp?stat_user=1");
    } else 
    {
        for (int i = 0; i < user_beans.size(); i++) 
        {
            pmi_no = user_beans.get(i).getPmi_no();
            name = user_beans.get(i).getName();
            ic_no = user_beans.get(i).getIc_no();
            gender = user_beans.get(i).getGender();
            blood_group = user_beans.get(i).getBlood_group();
            allergy = user_beans.get(i).getAllergy();
            dob = user_beans.get(i).getDob();
        }
    }

    // for historical record, use getlhr
    GetLHR getlhr = new GetLHR();

    // LHR Sign : Chief Complaints
    ArrayList<LHR_Signs_bean> getccn = getlhr.getCCN(pmi_no);

    // LHR Medication : Drug Treatment Order
    ArrayList<LHR_DTO_bean> getdto = getlhr.getDTO(pmi_no);

    // LHR Past Medical History
    ArrayList<LHR_Past_Medical_bean> getpmh = getlhr.getPM(pmi_no);

    // LHR Family History
    ArrayList<LHR_Family_History_bean> getfmh = getlhr.getFH(pmi_no);

    // LHR Vital Sign
    ArrayList<LHR_Weight_Height_bean> getwh = getlhr.getWH(pmi_no);
    ArrayList<LHR_Blood_Glucose_bean> getbg = getlhr.getBG(pmi_no);
    ArrayList<LHR_Blood_Pressure_bean> getbp = getlhr.getBP(pmi_no);
%>
<div class="container-fluid">
<div class="row">
    <br />
    <br />
    <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8" id="user-info" >
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label class="control-label col-sm-4 col-xs-4 col-md-4 col-lg-4" for="ic">IC NO:</label>
                <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8">
                    <input type="text" class="form-control" id="ic" readonly="readonly" value="<%=ic_no%>">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4 col-xs-4 col-md-4 col-lg-4" for="name">Name:</label>
                <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8">
                    <input type="text" class="form-control" id="name" readonly="readonly" value="<%=name%>">
                </div>
            </div>                   
            <div class="form-group">
                <label class="control-label col-sm-4 col-xs-4 col-md-4 col-lg-4" for="ic">Birth Date:</label>
                <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8">
                    <input type="text" class="form-control" id="dob" readonly="readonly" value="<%=dob%>">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4 col-xs-4 col-md-4 col-lg-4" for="gender">Gender:</label>
                <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8">
                    <input type="text" class="form-control" id="gender" readonly="readonly" value="<%=gender%>">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4 col-xs-4 col-md-4 col-lg-4" for="blood-group">Blood Group:</label>
                <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8">
                    <input type="text" class="form-control" id="blood-group" readonly="readonly" value="<%=blood_group%>">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4 col-xs-4 col-md-4 col-lg-4" for="allergic">Allergy:</label>
                <div class="col-sm-8 col-xs-8 col-md-8 col-lg-8">
                    <input type="text" class="form-control" id="allergic" readonly="readonly" value="<%=allergy%>">
                </div>
            </div>                               
        </form>
    </div>
                <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="dchief">
    <br />
    <p id="ccn"><b>Chief Complaint Information</b></p>
    <br />
    <%
        for (int c = 0; c < getccn.size(); c++) {
            String tarikh = getccn.get(c).getEpisode_date();
            if(DBQuery_1.isDateMatch(tarikh, selected_year)) {
    %>

    <p id="ccn"><%=getccn.get(c).getEpisode_date()%> - 
        <%=getccn.get(c).getSymptom_name()%> - 
        <%=getccn.get(c).getSeverity_desc()%> </p>

    <%
        if (c == 9)
            break;
        } }
    %>
</div>
<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="drugorder">
    <br />
    <p id="dto"><b>Drug Treatment Order Information</b></p>
    <br />
    <%
        for (int i = 0; i < getdto.size(); i++) {
            String tarikh = getdto.get(i).getEpisode_date();
            if(DBQuery_1.isDateMatch(tarikh, selected_year)) {
    %>

    <p id="dto">
        <%=getdto.get(i).getEpisode_date() %> - 
        <%=getdto.get(i).getDrug_name() %> - 
        <%=getdto.get(i).getDrug_freq_desc() %>
    </p>

    <% if (i == 9)
            break;
        } }
    %>
</div>

<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="pasthistory">
    <br />
    <p id="past"><b>Past Medical History Information</b></p>
    <br />

    <%
        for (int i = 0; i < getpmh.size(); i++) {
            String tarikh = getpmh.get(i).getDiagnosis_date();
            if(DBQuery_1.isDateMatch(tarikh, selected_year)) {
    %>

    <p id="past">
        <%=getpmh.get(i).getIcd10_desc() %> -
        <%=getpmh.get(i).getStatus() %>
    </p>

    <% if (i == 9)
            break;
        } } %>
</div>
<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="familyhistory">
    <br />
    <p id="family"><b>Family Medical History Information</b></p>
    <br />
    <%
        for (int i = 0; i < getfmh.size(); i++) {
            String tarikh = getfmh.get(i).getEpisode_date();
            if(DBQuery_1.isDateMatch(tarikh, selected_year)) {
    %>

    <p id="family">
        <%=getfmh.get(i).getIcd10_desc() %> -
        <%=getfmh.get(i).getStatus() %>
    </p>

    <% if (i == 9)
            break;
        } } %>
</div>
<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="vitalsign">
    <br />
    <p id="vts"><b>Vital Sign</b></p>
    <br />
    <p id="vts">Body Mass Index</p>
    <%
        for (int i = 0; i < getwh.size(); i++) {  
            String tarikh = getwh.get(i).getEpisode_date();
            if(DBQuery_1.isDateMatch(tarikh, selected_year)) {
    %>

    <p id="vts">
        <%=getwh.get(i).getEpisode_date() %> -
        Height: <%=getwh.get(i).getWeight() %> -
        Weight: <%=getwh.get(i).getHeight() %>
    </p>

    <% if (i == 9)
           break;
       } }
    %>

    <br /><br />
    <p id="vts">Blood Pressure</p>
    <%
        for (int j = 0; j < getbp.size(); j++) {
            String tarikh = getbp.get(j).getEpisode_date();
            if(DBQuery_1.isDateMatch(tarikh, selected_year)) {  
    %>

    <p id="vts">
        <%=getbp.get(j).getEpisode_date() %> -
        Systolic: <%=getbp.get(j).getSystolic_sitting() %> -
        Diastolic: <%=getbp.get(j).getDiastolic_sitting() %> -       
        Pulse: <%=getbp.get(j).getSitting_pulse() %>        
    </p>

    <% 
       if (j == 9)
           break;
       } }
    %>

    <br /><br />
    <p id="vts">Blood Glucose</p>
        <%
            for (int k = 0; k < getbg.size(); k++) {
                String tarikh = getbg.get(k).getEpisode_date();
                if(DBQuery_1.isDateMatch(tarikh, selected_year)) {       
        %>

        <p id="vts">
            <%=getbg.get(k).getEpisode_date() %> -
            Glucose Level: <%=getbg.get(k).getBg_level() %>
        </p>

         <% if (k == 9)
                break;
            } }
         %>

</div>
</div>



</div>
         <% // } %>
}