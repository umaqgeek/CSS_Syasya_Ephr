<%-- 
    Document   : medical-info.jsp
    Created on : Jul 24, 2016, 12:56:04 PM
    Author     : SyasyaAzizanRejab
--%>

<%@page import="beans.LHR_Weight_Height_bean"%>
<%@page import="java.util.Calendar"%>
<%@page import="DBConn.DBQuery_1"%>
<%@page import="beans.LHR_Blood_Glucose_bean"%>
<%@page import="beans.LHR_Blood_Pressure_bean"%>
<%@page import="controllers.GetLHR"%>
<%@page import="DBConn.SessionDB"%>
<%@page import="java.sql.Date"%>
<%@page import="Helper.Func"%>
<%@page import="Process.MainRetrieval"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DBConn.Connection"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.0/knockout-min.js"></script>


<%
    String username = (String)session.getAttribute("username");
    out.print(username);
    String pmi_no = SessionDB.getPmino();

    GetLHR g = new GetLHR();
    int hostport = 1099;
    try {
        hostport = Integer.parseInt(Connection.getIpCall().getProperty(Connection.STR_PORT));
    } catch (Exception e) {
        hostport = 1099;
    }
    RMIConnector.setConfig(Connection.getIpCall().getProperty(Connection.STR_HOST), hostport);
    // for graph
    ArrayList<LHR_Blood_Pressure_bean> graph_bp = g.getBP_graf(pmi_no);
    ArrayList<LHR_Blood_Glucose_bean> graph_bg = g.getBG_graf(pmi_no);
    ArrayList<LHR_Weight_Height_bean> graph_bmi = g.getWH_graf(pmi_no);
%>

<script type="text/javascript">
    $(function () 
    {
        var dataSource = [
            <% for(int i=0; i<graph_bp.size(); i++){
                
            %>
                {hari: "<%=g.getDate(graph_bp.get(i).getEpisode_date()) + "<br>" + g.getTime(graph_bp.get(i).getEpisode_date()) %>", 
                    sys: <%=graph_bp.get(i).getSystolic_sitting() %>,
                    dis: <%=graph_bp.get(i).getDiastolic_sitting() %>,
                    pul: <%=graph_bp.get(i).getSitting_pulse() %>
                } <%
                    if( i != i - 1)
                        out.print(",");
                }
                    %>
        ];

        var chartDataSource = [
        <% for(int i=0; i<graph_bg.size(); i++){
        %>
                {hari: "<%=g.getDate(graph_bg.get(i).getEpisode_date()) + "<br>" + g.getTime(graph_bg.get(i).getEpisode_date()) %>", 
                    bg: <%=graph_bg.get(i).getBg_level() %>
                } <%
                    if( i != i - 1)
                        out.print(",");
                }
                    %>
        ];
        
        var dataSourceBMI = [
            <% for(int i=0; i<graph_bmi.size(); i++){
                float a1 = Float.parseFloat(graph_bmi.get(i).getWeight());
                float a2 = Float.parseFloat(graph_bmi.get(i).getHeight());
                float m = a2 / 100;
                float bmi = a1 / (m * m);
                float result = Math.round(bmi*100)/100;
                //float num = new Number(bmi);
                //document.getElementById('bmi').value = num.toPrecision(4);
            %>
                {hari: "<%=g.getDate(graph_bmi.get(i).getEpisode_date()) + "<br>" + g.getTime(graph_bmi.get(i).getEpisode_date()) %>", 
                    bmi: <%=result %>,       
                    wei: <%=graph_bmi.get(i).getWeight() %>,
                    hei: <%=graph_bmi.get(i).getHeight() %>                   
                } <%
                    if( i != i - 1)
                        out.print(",");
                }
                    %>
        ];

        $("#bpset").dxChart({
            dataSource: dataSource,
                commonSeriesSettings: {
                    argumentField: "hari"
                },
                series: [
                    {valueField: "sys", name: "Systolic"},
                    {valueField: "dis", name: "Diatolic"},
                    {valueField: "pul", name: "Pulse"}
                ],
                argumentAxis: {
                    grid: {
                        visible: true
                    }
                },
                tooltip: {
                    enabled: true
                },
                title: "Blood Pressure Monitoring",
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

        $("#bgset").dxChart({
            dataSource: chartDataSource,
            commonSeriesSettings: {
                argumentField: "hari"
            },
            series: [
                {valueField: "bg", name: "Blood Glucose Level"}
            ],
            argumentAxis: {
                grid: {
                    visible: true
                }
            },
            tooltip: {
                enabled: true
            },
            title: "Blood Glucose Monitoring",
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

    });

    function calc_bmi()
    {       
        var hei = $("#height").val();
        var wei = $("#weight").val();
        if (hei == '' || wei == '')
        {
            alert('Please fill in the BMI form.');
        } else
        {
            var a1 = parseFloat(wei);
            var a2 = parseFloat(hei);
            var m = a2 / 100;
            var bmi = a1 / (m * m);
            var num = new Number(bmi);
            document.getElementById('bmi').value = num.toPrecision(4);
        }
    }

    function savebmi()
    {
        var savestatus = false;
        var hei = $("#height").val();
        var wei = $("#weight").val();

        if(hei == "" || wei == "")
        {
            alert("Please fill in the BMI form.");
        } else
        {
            window.location = 'save_bmi.jsp?hei='+hei+'&wei='+wei;
        }  
    }

    function savebp()
    {
        var savestatus = false;
        var sys = $("#systolic").val();
        var dis = $("#diastolic").val();
        var pul = $("#pulse").val();
        if(sys == "" || dis == "" || pul == "")
        {
            alert("Please fill in the Blood Pressure form.");
        } else
        {
            window.location = 'save_bp.jsp?sys='+sys+'&dis='+dis+'&pul='+pul;
        }

    }


    function savebg()
    {
        var blg = $("#bg-level").val();
        var savestatus = false;
        if(blg == "")
        {
            alert("Please fill in the Blood Glucose form.");
        } else
        {
            window.location = 'save_bg.jsp?blg='+blg;
        }
    }

</script>

<div class="container-fluid">
    <div id="navi-medical-info">
        <ul class="nav nav-tabs" id="myTab">
            <li class="active"><a data-toggle="tab" href="#tab-bmi">Body Mass Index</a></li>
            <li><a data-toggle="tab" href="#tab-blood-pressure">Blood Pressure</a></li>
            <li><a data-toggle="tab" href="#tab-blood-glucose">Blood Glucose</a></li>
        </ul>
    </div>

    <div class="tab-content">
        <!--BMI-->
        <div class="tab-pane fade in active" id="tab-bmi" align="middle">
            <br />
            <h4 style="text-align:center">Body Mass Index</h4>
            <br />
            <form class="form-horizontal" role="form" id="form-bmi" action="#!" method="POST" onsubmit="return false;">
                <div class="form-group">
                    <label class="control-label col-sm-2 col-xs-2 col-md-2 col-lg-2" for="height">Height (cm):</label>
                    <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4">
                        <input type="number" onkeypress="if(this.value.length==3) return false;" class="form-control" id="height" name="height" placeholder="Enter your height">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2 col-xs-2 col-md-2 col-lg-2" for="weight">Weight (kg):</label>
                    <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4">
                        <input type="number" onkeypress="if(this.value.length==3) return false;" class="form-control" id="weight" name="weight" placeholder="Enter your weight">
                    </div>
                </div>
                <div class="form-group" align="right">
                    <div class="col-sm-offset-2 col-sm-2 col-xs-2 col-md-2 col-lg-2">
                        <button type="button" class="btn btn-default" onclick="calc_bmi();">Calculate</button>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2 col-xs-2 col-md-2 col-lg-2" for="bmi">BMI:</label>
                    <div class="col-sm-4" col-xs-4 col-md-4 col-lg-4>
                        <input type="number" class="form-control" id="bmi" readonly>
                    </div>
                </div>
                <div class="form-group" align="right">
                    <div class="col-sm-offset-2 col-sm-2 col-xs-2 col-md-2 col-lg-2">
                        <button type="button" class="btn btn-default" onclick="savebmi();">Save BMI</button>
                    </div>
                </div>
            </form>
            <div>  
                <br /><br />
                <div id="bmiset" style="height:500px; max-width:700px; margin: 0 auto" data-bind="dxChart: chartConfiguration"></div>
            </div>
        </div>
        <!--Blood Pressure-->
        <div class="tab-pane fade" id="tab-blood-pressure" align="middle">
            <br />
            <h4 style="text-align:center">Blood Pressure</h4>
            <br />
            <form class="form-horizontal" role="form" id="bp" action="#!" method="POST">
                <div class="form-group">
                    <label class="control-label col-sm-2 col-xs-2 col-md-2 col-lg-2" for="systolic">Systolic:</label>
                    <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4">
                        <input type="number"onkeypress="if(this.value.length==3) return false;" class="form-control" id="systolic" name="systolic" placeholder="Enter your systolic">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2 col-xs-2 col-md-2 col-lg-2" for="diastolic">Diastolic:</label>
                    <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4">
                        <input type="number" onkeypress="if(this.value.length==3) return false;" class="form-control" id="diastolic" name="diastolic" placeholder="Enter your diastolic">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2 col-xs-2 col-md-2 col-lg-2" for="pulse">Pulse:</label>
                    <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4">
                        <input type="number" onkeypress="if(this.value.length==3) return false;" class="form-control" id="pulse" name="pulse" placeholder="Enter your pulse">
                    </div>
                </div>
                <div class="form-group" align="right">
                    <div class="col-sm-offset-2 col-sm-2 col-xs-2 col-md-2 col-lg-2">
                        <button type="button" class="btn btn-default" onclick="savebp();">Save BP</button>
                    </div>
                </div>
            </form>
            <div>  
                <br /><br />
                <div id="bpset" style="height:500px; max-width:700px; margin: 0 auto" data-bind="dxChart: chartConfiguration"></div>
            </div>
        </div>
        <!--Blood Glucose-->
        <div class="tab-pane fade" id="tab-blood-glucose" align="middle">
            <br />
            <h4 style="text-align:center">Blood Glucose</h4>
            <br />
            <form class="form-horizontal" role="form" id="bg" action="#!" method="POST">
                <div class="form-group">
                    <label class="control-label col-sm-2 col-xs-2 col-md-2 col-lg-2" for="bg-level">Blood Glucose Level:</label>
                    <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4">
                        <input type="number" onkeypress="if(this.value.length==3) return false;" class="form-control" id="bg-level" name="bg-level" placeholder="Enter your blood glucose level" >
                    </div>
                </div>
                <div class="form-group" align="right">
                    <div class="col-sm-offset-2 col-sm-2 col-xs-2 col-md-2 col-lg-2">
                        <button type="button" class="btn btn-default" onclick="savebg();">Save BG</button>
                    </div>
                </div>
            </form>
            <div>  
                <br /><br />
                <div id="bgset" style="height:500px; max-width:700px; margin: 0 auto" data-bind="dxChart: chartConfiguration"></div> 
            </div>
        </div> 
    </div>   
<!--    
    <script>
        $('a[data-toggle="tab"]').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });

        $('a[data-toggle="tab"]').on("shown.bs.tab", function (e) {
            var id = $(e.target).attr("href");
            localStorage.setItem('selectedTab', id)
        });

        var selectedTab = localStorage.getItem('selectedTab');
        if (selectedTab != null) {
            $('a[data-toggle="tab"][href="' + selectedTab + '"]').tab('show');
        }
    </script>
    
    -->
</div>
<% //}%>
