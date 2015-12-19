<%@ Page Title="Student Health Centre" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script type="text/javascript" src="js/googlemaps.js"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">

    <!-- Icon Section -->
    <div class="col-lg-12 icon-section background">

        <!-- Book/Cancel an appointment -->
        <div class="col-lg-4 icon-item">
            <img class="img-circle" src="http://s15.postimg.org/6x7znmn97/icon_calendar.png" width="110" height="110" /><br>
            <h3 style="margin-top: 30px">Book/Cancel an appointment</h3>
            <p><strong>Are you already registered?</strong> &nbsp You can book an apppointmnet now with your GP!</p>

            <!-- Login ImageButton -->
            <asp:ImageButton ID="LoginButton" runat="server" ImageUrl="./img/patient-panel.png" CssClass="btn-img btn-patient-panel img-btn" OnClick="MyPatientPanelBtnHandler" />
        </div>

        <!-- Opening hours -->
        <div class="col-lg-4 icon-item">
            <img class="img-circle" src="http://s17.postimg.org/53ydj06bj/icon_clock.jpg" width="110" height="110" /><br>
            <h3 style="margin-top: 30px">Opening hours</h3>
            <p>
                <strong>Monday to Friday:</strong> &nbsp 8:00 - 18:00<br>
                <strong>Weekend:</strong> &nbsp Closed all day
            </p>
        </div>

        <!-- Contact -->
        <div class="col-lg-4 icon-item">
            <img src="http://s28.postimg.org/wkk285nj1/icon_telephone.png" width="110" height="110" /><br>
            <h3 style="margin-top: 30px">Contact</h3>
            <p>
                <strong>Telephone:</strong> &nbsp +44 20 0000 0000<br>
                <strong>Email:</strong> &nbsp studenthealthcentre@webmail.co.uk
            </p>
        </div>
    </div>

    <!-- Services Section -->
    <div class="col-lg-12">
        <br>
        <div class="col-lg-6">
            <h3 class="page-header">Student Health Centre Services</h3>
            <p>The Student Health Centre offer many services, including:</p>
            <ul>
                <li><strong>General Medicine</strong></li>
                <li>Sports Medicine</li>
                <li>Prescription medications</li>
                <li>Routine vaccinations</li>
                <li>Phlebotomy (blood tests)</li>
                <li>Contraceptive advice</li>
                <li>Massage and Acupuncture</li>
                <li>Internship examinations</li>
                <li>Individual counselling if your studies are disrupted by illness</li>
            </ul>
            <br>
        </div>

        <!-- Location -->
        <div class="col-md-6">
            <h3 class="page-header">Location</h3>
            <div class="img-responsive">
                <div id="gmap_canvas" style="height: 320px"></div>
                <style>
                    #gmap_canvas img {
                        max-width: none !important;
                        background: none !important;
                    }
                </style>
            </div>
        </div>
    </div>

    <!-- Information for new patients -->
    <div class="col-lg-12">
        <br><br>
        <div class="col-lg-12">
            <h3 class="page-header">Information for new patients</h3>
            <p style="text-align: justify">
                To <b>register</b> with the <b>Student Health Centre</b>, you need to <b>download and complete our form</b> and then visit the Student Health Centre in person.
                You will be able to register only after enrolling on your programme of study at the University.
                You are required to have an NHS number in order to obtain treatment and if you need to be referred to a specialist clinician.
            </p><br style="margin-bottom: 40px">
        </div><p>
                    Copyright &copy;
                    <asp:Label runat="server" CssClass="glyphicon glyphicon-copyright-mark" ForeColor="White"></asp:Label>
                    Student Health Centre 2015  - María Díaz
                </p>
        <br style="margin-bottom: 260px"> <br style="margin-bottom: 500px">
    </div>
   
</asp:Content>