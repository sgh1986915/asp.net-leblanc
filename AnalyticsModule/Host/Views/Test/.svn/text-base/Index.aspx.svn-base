<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<input type="hidden" id="uid" value="<%=Guid.NewGuid() %>" />

<script type="text/javascript" src="http://www.google.com/jsapi?key=ABQIAAAA-O3c-Om9OcvXMOJXreXHAxQGj0PqsCtxKvarsoS-iqLdqZSKfxS27kJqGZajBjvuzOBLizi931BUow"></script>

<img id="trackimg" width=1 height=1 />
<h2>Test Tracking Page</h2>
 This webpage is tracked...

 <script type="text/javascript">
    if (google.loader.ClientLocation) {
        var loc = "";
        var latlng = "37.4419, -100.1419";

        if (google.loader.ClientLocation.address.country_code == "US" &&
            google.loader.ClientLocation.address.region) {
            loc = google.loader.ClientLocation.address.city + ", " + google.loader.ClientLocation.address.region.toUpperCase();
        } else {
            loc = google.loader.ClientLocation.address.city + ", " 
            + google.loader.ClientLocation.address.region + ", " 
            + google.loader.ClientLocation.address.country;
        }

        latlng = google.loader.ClientLocation.latitude + "," + google.loader.ClientLocation.longitude;

        var uid = document.getElementById("uid").value;

        document.getElementById("trackimg").src = "<%=Url.Content("~/analytics/SaveLog?route="+Request.UrlReferrer+"&location=") %>"+loc+"&latlng="+latlng+"&uid="+uid;
    }

    window.onbeforeunload = function() {
        var uid = document.getElementById("uid").value;
        
        document.getElementById("trackimg").src = "<%=Url.Content("~/analytics/UpdateLog?uid=") %>" + uid;
    }
</script>

</asp:Content>
