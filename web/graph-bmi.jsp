<%-- 
    Document   : graph-bmi
    Created on : Aug 17, 2016, 8:37:20 PM
    Author     : user
--%>

<%@page import="DBConn.Connection"%>
<%@page import="main.RMIConnector"%>
<%@page import="controllers.GetLHR"%>
<%@page import="DBConn.SessionDB"%>
<%@page import="beans.LHR_Weight_Height_bean"%>
<%@page import="beans.LHR_Weight_Height_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.0/knockout-min.js"></script>
<script type="text/javascript" src="http://cdn3.devexpress.com/jslib/16.1.5/js/dx.viz.js"></script>

<!DOCTYPE html>
<% 
    String pmi_no = SessionDB.getPmino();

    GetLHR g = new GetLHR();
    int hostport = 1099;
    try {
        hostport = Integer.parseInt(Connection.getIpCall().getProperty(Connection.STR_PORT));
    } catch (Exception e) {
        hostport = 1099;
    }
    RMIConnector.setConfig(Connection.getIpCall().getProperty(Connection.STR_HOST), hostport);
    String tahun = request.getParameter("year");
    String bulan = request.getParameter("month");
    String nak = tahun + "-" + bulan;
//String nak = request.getParameter("year");
    out.println("|"+nak+"|");
    ArrayList<LHR_Weight_Height_bean> graph_bmi = g.getWH_year(pmi_no, nak); 

%>
<script>
    var dataSourceBMI = [
        <% for(int i=0; i<graph_bmi.size(); i++){
            float a1 = Float.parseFloat(graph_bmi.get(i).getWeight());
            float a2 = Float.parseFloat(graph_bmi.get(i).getHeight());
            float m = a2 / 100;
            float bmi = a1 / (m * m);

        %>
            {hari: "<%=(i+1) + ": " + graph_bmi.get(i).getEpisode_date() %>", 
                bmi: <%=bmi %>,       
                wei: <%=graph_bmi.get(i).getWeight() %>,
                hei: <%=graph_bmi.get(i).getHeight() %>                   
            } <%
                if( i != i - 1)
                    out.print(",");
            }
                %>
    ];

    $("#bmiset").dxChart({
        dataSource: dataSourceBMI,
        commonSeriesSettings: {
            argumentField: "hari"
        },
        series: [
            {valueField: "bmi", name: "BMI"},
            {valueField: "wei", name: "Weight"},
            {valueField: "hei", name: "Height"}

        ],
        argumentAxis: {
            grid: {
                visible: true
            }
        },
        tooltip: {
            enabled: true
        },
        title: "Body Mass Index Monitoring",
        legend: {
            verticalAlignment: "bottom",
            horizontalAlignment: "center"
        },
        commonPaneSettings: {
            border: {
                visible: true
            }
        } 
    });
</script>
