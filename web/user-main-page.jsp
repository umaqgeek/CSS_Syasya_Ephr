<%-- 
    Document   : user-main-page
    Created on : Jul 19, 2016, 5:46:58 PM
    Author     : SyasyaAzizanRejab
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>e-PHR User</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://cdn3.devexpress.com/jslib/16.1.5/js/dx.viz.js"></script>
        <%
            String username = (String) session.getAttribute("username");
            
        %>
        <style type="text/css">
            .footer 
            {
                clear: both;
                text-align: center;
                position: relative;
                right:0;
                /*bottom:0;*/
                left:0;
                padding:rem;
            }
            .table-design
            {
                margin: 20px;
                padding: 20px;
                padding-right: 20px;
            }
            
            #textCenter{ text-align: center; }
            #blockCenter
            {
                margin-left: auto;
                margin-right: auto;
                display: center;
            }
            
        </style>
        <script type="text/javascript">
            $(document).ready(function () 
            {
                // replace 0 dengan current year
                $("#cari1").load("search-by-year.jsp?year=0");
                $("#year").change(function () 
                {
                    var value_year = $(this).val();
                    $("#cari1").load("search-by-year.jsp?year=" + value_year);
                });
                
                $("#medical-info").load("medical-info.jsp");
            });

            function printMedicalHistory()
            {
                window.print();
            }

            function calc_bmi() {
                var hei = document.getElementById('height').value;
                var wei = document.getElementById('weight').value;
                if (hei == '' || wei == '') 
                {
                    alert('Please insert the height and weight data!!');
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
        </script>
        
    </head>
    
    <body>
        <div class="container-fluid">
        
        <!--Header-->
            <div id="header" class="row" align="center">
                <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
                     <img src="images/e-phr-banner.jpg" class="img-responsive center-block" alt="Electronic Personalized Health Records" />
                </div>
            </div>
            
            <!--User identity-->
            <div class="row" id="welcome" >
                <div class="col-sm-10 col-xs-10 col-md-10 col-lg-10">
                    <p align="right">Welcome <%=username%></p>
                </div>
                <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                    <a href='logout.jsp'>  Log out</a>
                </div>   
            </div>

            <!--Navigation-->
            <div class="row" id="navi" >
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#episode-date">Health Record History</a></li>
                    <li><a data-toggle="tab" href="#medical-info">Monitor and Analyze</a></li>
                    <li><a data-toggle="tab" href="#quick-info">Vital Sign Info</a></li>
                    <li><a data-toggle="tab" href="#faq">FAQ</a></li>
                    <li><a data-toggle="tab" href="#contact-us">Contact US</a></li>
                    <li><a data-toggle="tab" href="#link">Links</a></li>
                </ul>
            </div>
            
            <div class="row" id="content" >
                <div class="tab-content">
                    <!--Tab Episode Date / Health Record History-->
                    <div class="tab-pane fade in active" id="episode-date">
                        <br/><h3 style="text-align:center">Personalized Health Record</h3><br />
                        <div id="select-form">
                            <form role="form" action="search-by-year.jsp">
                                <div class="form-group">
                                    <label class="control-label col-sm-4 col-xs-4 col-md-4 col-lg-4" for="select-year">Select year to view records:</label>
                                    <div  class="col-sm-2 col-xs-2 col-md-2 col-lg-2" >
                                        <%
                                            // get the current year
                                            Calendar now = Calendar.getInstance();
                                            int current_year = now.get(Calendar.YEAR);

                                            String year = request.getParameter("year");

                                            if (!(year != null && !year.isEmpty())) 
                                            {
                                                year = "0";
                                            }

                                        %>
                                        <select class="form-control" id="year" name="year">
                                            <option value="0"
                                                    <% if (year.length() > 0 && year.equals("0")) {
                                                            out.print(" selected=\"selected\"");
                                                        } %>
                                                    >Select Year</option>
                                            <% for (int i = 2013; i <= current_year; i++) {%>
                                            <option value="<%=i%>"
                                                    <% if (year.length() > 0 && year.equals(i + "")) 
                                                    {
                                                            out.print(" selected=\"selected\"");
                                                    } %> 
                                                    ><%=i%></option>
                                            <% } %>
                                        </select>
                                        <br />
                                    </div>
                                    <div class="col-sm-6 col-xs-6 col-md-6 col-lg-6"></div>
                                </div>
                            </form>
                        </div>
                        <div id="cari1" name="cari1">
                            <!--division ni akan load page yang ada form dan history-->
                        </div>

                    </div>
                    <!--Tab Medical Info / Monitor and Analyze-->
                    <div class="tab-pane fade" id="medical-info"> </div>
                    <!--Tab FAQ-->
                    <div id="faq" class="tab-pane fade">
                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="blockCenter">
                        <br />
                        <h3 style="text-align:center">Frequently Asked Question</h3>
                        <br />
                        <p><b>1) How do I book, change or cancel my appointment?</b></p>
                        <p>You can <a href="https://www.ebs.ncrs.nhs.uk/app-cabpatient/prepareLogin.do">book online</a> 
                            using the information provided in your Appointment Request 
                            letter. You can also contact the Appointments Line on 
                            0345 6088888. They will be happy to book your appointment 
                            for you. Sometimes hospitals do not have their appointments 
                            linked to Choose and Book and when this happens, you 
                            need to contact the hospital directly to book your 
                            appointment. This will be indicated on your Appointment 
                            Request letter by a picture of a phone next to the relevant clinic.</p>
                        <br />
                        <p><b>2) Why do I get the message &quot; No appointment availables&quot; ?</b></p>
                        <p>This is because the hospital has not released any appointments 
                            into Choose and Book. Individual hospitals are responsible 
                            for making their appointments available through Choose 
                            and Book to make sure patients and GPs and other referrers 
                            can book electronically. You now have the option to contact 
                            the clinic where you wish to book your appointment and 
                            they will contact you once an appointment is available.</p>
                        <br />
                        <p><b>3) Do I have a choice of hospital for my treatment ?</b></p>
                        <p>All patients now have the right to choose which hospital 
                            provider they are referred to by their GP/referrer. Now 
                            patients can choose which hospital they are seen in according 
                            to what matters most to them, whether it's location, waiting 
                            times, reputation, clinical performance, visiting policies, 
                            parking facilities or patients' comments. Patients can also 
                            choose to go to independent sector providers who have a 
                            contract with the PHR. A choice of hospital is available 
                            for most patients and in most circumstances. Exceptions 
                            include emergency and urgent services, cancer, maternity 
                            and mental health services. If you need to be seen urgently 
                            by a specialist (for example, if you have severe chest pain),
                            your GP will send you where you'll be seen most quickly.</p>
                        <br />
                        <p><b>4) Can I choose which consultant I want to see?</b></p>
                        <p>Patients who are referred for a first outpatient consultant-led 
                            appointment are able to choose from any clinically appropriate
                            provider and  now, people are not only able to choose 
                            where they are treated but who provides their secondary 
                            care services. Providers are already listing named clinicians 
                            against their services on Choose and Book and since April 
                            2012 patients can choose which named consultant-led team 
                            they would like to be referred to, as long as it is a 
                            clinically appropriate option for their referral. A named 
                            consultant-led team is where a consultant retains overall 
                            clinical responsibility for the service, team or treatment. 
                            The consultant will not necessarily be physically present 
                            for each patient&rsquo;s appointment, but he/she takes 
                            overall clinical responsibility for patient care.</p>
                        <br />
                        <p><b>5) Why have I been sent reminder letters for my appointment?</b></p>
                        <p>For routine appointments, The Appointments Line automatically 
                            sends out two letters to remind patients to book their 
                            appointment. For routine appointments, the first letter 
                            is sent 14 days after the patient has been referred by 
                            their GP/referrer and, if the appointment is still not 
                            booked, the second letter is sent another 14 days after 
                            the referral. Letters are sent out sooner for more urgent 
                            referrals. Sometimes these letters are written and sent 
                            just before or as you make your booking.</p>
                        <br />
                        <p><b>6) Why have I been locked out</b></p>
                        <p>As a security measure, if somebody experiences a system 
                            error this lock remains in place.</p>
                        <br />
                        <p><b>Thank You...</b></p>
                        <br />
                    </div>
                    </div>
                    <!--Tab Quick Info / Vital Sign Info-->
                    <div id="quick-info" class="tab-pane fade">
                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="blockCenter">
                        <br />
                        <h3 style="text-align:center">Vital Sign Info</h3>
                        <br />

                        <p align="center"><b><font color="#00F">BMI Infomation</font></b></p>
                        <p>BMI stands for Body Mass Index. It is important to know what your 
                            BMI does and does not indicate about your weight, health and lifestyle choices.
                            Your BMI is calculated from your height and weight. It is a fairly reliable indicator 
                            of body fat for most adults, with athletes and the elderly being two exceptions. 
                            BMI is an inexpensive alternative to direct measurements of body fat, such as underwater weighing, 
                            but it is only one of many factors that you and your health-care provider should use in evaluating 
                            your health status</p> 

                        <p align="center"><b><font color="#00F">BMI Classification</font></b></p>
                        <div class="bmichart">
                                <img src="images/asian_bmi_range.JPG" class="img-responsive center-block" alt="BMI Range" width="441" height="772" align="middle" />
                        </div>
                            
                        <p align="center"><b><font color="#00F">BMI and Your Health</font></b>
                        <p>People with very low or very high BMIs tend to have the greatest health risks. Even so, BMI is only one factor in your overall health. For example, if your BMI falls into the normal weight category, you will still have a higher risk of health problems if you:</p>
                        <ul>
                            <li>Smoke cigarettes</li>
                            <li>Do not participate in regular physical activity</li>
                            <li>Eat lots of nutrient-poor foods with added fat and sugar.</li>
                        </ul>  
                        
                        <p>If your BMI is in the overweight category, you will have a lower overall health risk if you:</p>
                        <ul>
                            <li>Get regular physical activity</li>
                            <li>Have blood pressure, blood sugar and cholesterol levels that are within normal limits.</li>
                        </ul>
                        <p>This means BMI is one aspect of your health to discuss with your care provider. Together, you can decide if other assessments need to be done and whether lifestyle changes such as eating smarter and moving more will improve your health.</p>
                        <p align="center"><b><font color="#00F">BMI Measurements in Children and Teens</font></b></p>
                        <p>While BMI calculations for children and teens use the same formula as adults, 
                            criteria used to define obesity and overweight are different for young people because 
                            of factors like body fat differences between boys and girls and variations in body fat 
                            at different ages.</p>
                        <p class="bp"><center>
                            <p><b><font color="#00F">Blood Pressure Management </font></b></p>
                            <p class="titlebp"><strong><font color="#00F">Blood Pressure Range Chart</font></strong> : Systolic vs. Diastolic</p>
                            <div class="bpchart">
                                <img src="images/asian_bp_range.JPG" class="img-responsive center-block" alt="Blood Pressure Chart" width="441" height="772" align="middle" />
                            </div>
                        </center>
                        <p>&nbsp;</p>
                        <p class="np"><strong>Human Blood Pressure Range Diagram Textual Description</strong></p>
                        <p>The 1st Number: Systolic pressure is the blood pressure when the heart muscle contracts.<br />
                            The 2nd Number: Diastolic pressure is the blood pressure when the heart is relaxed.<br />
                            The BP numbers shown in the chart represent &quot;Typical&quot; systolic-diastolic pairs. There are many &quot;non-typical&quot; systolic/diastolic pairs.</p>
                        <p><br />
                            <strong>What is Normal Blood Pressure</strong>? Buy and use an automatic blood pressure monitor. Compare your BP reading with the numbers on the chart above.<br />
                            Draw a line from your systolic pressure to your diastolic pressure. Is the slope of the line about the same as shown on the chart? <br />
                            Where do YOU fit in? What are your risk factors?<br />
                            Are your blood pressure readings within the normal blood pressure range?<br />
                            Should you take anti-hypertension medication to lower your blood pressure?<br />
                            <br />
                            Normal human daily Blood Pressure Range can vary widely, so any single blood pressure monitor reading is not reliable. BP monitor readings must be taken at different times of day, to determine AVERAGE blood pressure levels over time.<br />
                            What is important is your AVERAGE BP, or MAP (Mean Arterial Pressure) over time.<br />
                            Or, where are those numbers sitting MOST of the time?<br />
                            Normal MAP is about 93 mm of mercury.</p>
                        <p>For the scientists among you: The pressure of 1 mm of mercury = 0.019337 P.S.I. A systolic blood pressure of 2 P.S.I. is good, a systolic blood pressure of 3 P.S.I. is not good.</p>
                        
                        </div>
                    </div>
                    <!--Tab Contact Us-->
                    <div id="contact-us" class="tab-pane fade" id="blockCenter">
                        <br />
                        <h3 style="text-align:center">Contact Us</h3>
                        <br />
                        <div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" id="textCenter">
                            <br />
                            Visit <a href="http://www.utem.edu.my/pusat_kesihatan/en/">Pusat Kesihatan UTeM</a>
                            <br /><br /><br />
                            <b>Our Address:</b>
                            <br />
                            Main Campus Health Centre
                            <br />
                            Universiti Teknikal Malaysia Melaka,
                            <br />
                            Hang Tuah Jaya, 76100 Durian Tunggal, Melaka, Malaysia.
                            <br />
                            Phone: +606-553 4439
                            <br />
                            Fax: +606-555 2077
                            <br /><br /><br />
                            <p><b>Emergency Call Line</b></p>
                            <br />
                            Main Campus Health Center: 06 555 2076<br />
                            Technology Campus Health Center: 06 234 6825<br />
                            City Campus Health Center: 06 283 3397<br /> 
                            <br />
                        </div>
                    </div>
                    <!--Tab Links-->
                    <div id="link" class="tab-pane fade" id="blockCenter">
                        <br />
                        <h3 style="text-align:center">Health Info Links</h3>
                        <br /><br />
                        <div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">

                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://www.moh.gov.my/">
                                    <img src="images/moh.png" class="img-responsive center-block" alt="Ministry of Health Malaysia" style="width:100px;height:60px;">
                                </a>
                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://www.myhealth.gov.my/">
                                    <img src="images/myHealth.jpg" class="img-responsive center-block" alt="myHealth" style="width:100px;height:60px;">
                                </a>
                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://www.infosihat.gov.my/infosihat/">
                                    <img src="images/infoSihat.jpg" class="img-responsive center-block" alt="Info Sihat" style="width:100px;height:60px;">
                                </a>
                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://mynutri.moh.gov.my/mynutri/index.php">
                                    <img src="images/myNutri.jpg" class="img-responsive center-block" alt="myNutri" style="width:100px;height:60px;">
                                </a>
                            </div>
                        </div>
                        <br /><br /><br /><br /><br />
                        <div id="blockCenter">
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">

                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://www.lppkn.gov.my/index.php/ms/">
                                    <img src="images/lppkn.jpg" class="img-responsive center-block" alt="LPPKN" style="width:100px;height:60px;">
                                </a>
                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://makna.org.my/">
                                    <img src="images/makna.jpg" class="img-responsive center-block" alt="MAKNA" style="width:100px;height:60px;">
                                </a>
                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://www.dermaorgan.gov.my/">
                                    <img src="images/dermaOrgan.jpg" class="img-responsive center-block" alt="Derma Organ" style="width:100px;height:60px;">
                                </a>
                            </div>
                            <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
                                <a href="http://www.pharmacy.gov.my/v2/ms">
                                    <img src="images/farmasi.jpg" class="img-responsive center-block" alt="Pharmacy" style="width:100px;height:60px;">
                                </a>
                            </div>
                        </div>
                        <br /><br /><br />
                        <div id="textCenter">
                            <br/><br/><br/>
                            <p>Reminder</p>
                            <p>You will visit the site outside of ecss.utem.edu.my/ephr 
                                This site is owned by third parties and outside of 
                                our control and we are not responsible for the 
                                information displayed.</p>
                            <br />
                        </div>
                    </div>
                    </div>
                </div>
            </div>
           

        <%
//            }
        %>

    </body>
</html>
