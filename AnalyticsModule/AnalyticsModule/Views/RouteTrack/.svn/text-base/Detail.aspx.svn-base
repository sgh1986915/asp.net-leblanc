<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="RobustHaven.Areas.AnalyticsModule.Models" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <script type="text/javascript" src="http://www.google.com/jsapi?key=ABQIAAAA-O3c-Om9OcvXMOJXreXHAxQGj0PqsCtxKvarsoS-iqLdqZSKfxS27kJqGZajBjvuzOBLizi931BUow"></script>

    <style type="text/css">
        .editing-section
        {
            width: 700px;
            margin: 0 auto;
        }
        
        .section-title
        {
            font: 24px Arial,Helvetica,sans-serif;
            border-bottom: 1px solid #989898;
        }
        
        #field-list
        {
            border-top: 1px solid #d1d1d1;
            list-style-type: none;
            margin-top: 0;
            padding: 40px 0 0;
        }
        
        #field-list .field
        {
            list-style-type: none;
            overflow: hidden;
        }
        
        #field-list label, .txtclass
        {
            float: left;
            width: 120px; text-align: right; padding-right: 5px;
            vertical-align: top;
            padding-top: 2px;
        }
        
        .txtclass
        {
            color: #000;
            text-align: left;
            width: 700px;
            font-size: 13px;
            font-weight: normal;
            line-height: 18px;
        }
        
        #map
        {
            width: 100%;
            height: 400px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <a style="color:Black; margin-bottom: 10px;" href="<%: Url.Action("Get", "RouteTrack", new { area = "AnalyticsModule" })%>">« Back to main page</a>

    <h2>Route Tracking Detail</h2>

    <%
        RouteTrack model = (RouteTrack)ViewData["data"];
    %>

    <div id="map">Google Map loading...</div>
    <input type="hidden" id="latlng" value="<%:model.LatLng %>" />

    <div>
        <ul id="field-list">
            <li class="field">
                 <%= Html.Label("Route:") %>
                 <div class="txtclass"><%:model.Route %></div>
            </li>
            <li class="field">
                 <%= Html.Label("Referrer:") %>
                 <div class="txtclass"><%:model.Referrer %></div>
            </li>
            <li class="field">
                 <%= Html.Label("User IP:") %>
                 <div class="txtclass"><%:model.UserIP %></div>
            </li>
            <li class="field">
                 <%= Html.Label("User Host:") %>
                 <div class="txtclass"><%:model.UserHost %></div>
            </li>
            <li class="field">
                 <%= Html.Label("Created On:") %>
                 <div class="txtclass"><%:model.CreatedOn %></div>
            </li>
            <li class="field">
                 <%= Html.Label("User-Agent:") %>
                 <div class="txtclass"><%:model.UserAgent %></div>
            </li>
            <li class="field">
                 <%= Html.Label("Location:") %>
                 <div class="txtclass"><%:model.Location %></div>
            </li>
            <li class="field">
                 <%= Html.Label("Browser:") %>
                 <div class="txtclass"><%:model.Browser %></div>
            </li>
            <li class="field">
                 <%= Html.Label("Language:") %>
                 <div class="txtclass"><%:model.Language %></div>
            </li>
        </ul>
    </div>

    <script>
        google.load("maps", "2", { callback: initialize });

        function initialize() {
            var zoom = 13;
            var latlng = document.getElementById("latlng").value;

            if (latlng == "")
                latlng = new google.maps.LatLng(37.4419, -100.1419);
            else
                latlng = new google.maps.LatLng(latlng.split(",")[0], latlng.split(",")[1]);

            var map = new google.maps.Map2(document.getElementById('map'));
            map.setCenter(latlng, zoom);
            map.addControl(new GLargeMapControl());
            map.addControl(new GMapTypeControl());
        }
    </script>

</asp:Content>
