<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<RobustHaven.Areas.AnalyticsModule.Models.RouteTrack>>" %>
<%@ Import Namespace="RobustHaven.Web.Extensions" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAALcd_q6UiGxcHp3eooJ2W-RQRS5-lso5HIopdvnzabVM14up_SRS1IkL_D0yPIgc-xdkCgecfiLNdfw" type="text/javascript"></script>
    
    <style type="text/css">
        .t-grid-toolbar
        {
            padding: 20px;
        }
        
        .t-grid-toolbar .t-button
        {
            margin-left: 20px;
        }
        
        .t-slider
        {
            float: left;
        }
        
        #map
        {
            width: 100%;
            height: 360px;
        }
        
        .t-grid fieldset
        {
            border: 1px solid #000;
            padding: 2px 5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <a style="color:Black; margin-bottom: 10px;" href="<%: Url.Action("Index", "Admin", new { area = "AnalyticsModule" })%>">« Back to main page</a>

    <h2>Route Tracking</h2>

    <%
        Html.Telerik().Splitter().Name("Splitter")
            .Orientation(SplitterOrientation.Vertical)
            .HtmlAttributes(new { style = "height: 800px;" })
            .Panes(vPanes =>
                {
                    vPanes.Add()
                        .Size("430px")
                        .Content(() =>
                            {
                                Html.Telerik().Grid(Model).HtmlAttributes(new { style = "font-size:12px" })
                                    .DataKeys(keys => { keys.Add(x => x.Id); })
                                    .Name("grid")
                                    .ToolBar(toolBar => toolBar.Template(() =>
                                    {%>
                                        <label style="margin-top:5px;">Interval: </label>
                                        <input type="text" id="txtInterval" value="50" />
                                        <%-- Html.Telerik().Slider<int>()
                                            .Name("Slider")
                                            .Min(0)
                                            .Max(60)
                                            .SmallStep(5)
                                            .LargeStep(20)
                                            .TickPlacement(SliderTickPlacement.Both)
                                            .Value(5)
	                                    --%>&nbsp;sec&nbsp;
                                        <button onclick="SetTime()" class="t-button">Set Value</button>
                                    <%}))
                                    .Columns(c =>
                                    {
                                        c.Bound(x => x.Id).Title("Id").Filterable(false).Sortable(false);
                                        c.Bound(x => x.Route).Title("Route");
                                        c.Bound(x => x.UserIP).Title("User IP");
                                        c.Bound(x => x.Location).Title("Location");
                                        c.Bound(x => x.Browser).Title("Browser");
                                        c.Bound(x => x.CreatedOn).Title("Created Date");
                                        c.Bound(x => x.Id).Title("Actions")
                                            .Width(100)
                                            .Template
                                            (k =>
                                                {
                                                    %>
                                                    <a class='t-grid-action t-button t-state-default btnDelete' href='<%: Url.Action("_DeleteAjax", "RouteTrack", new{id=k.Id })%>'>Delete</a>
                                                    <%
                                                }
                                            )
                                            .ClientTemplate(
                                                "<a class='t-grid-action t-button t-state-default btnDelete' href='" + Url.Action("_DeleteAjax", "RouteTrack") + "?id=<#= Id #>'>Delete</a>"
                                                )
                                            .Filterable(false)
                                            .Sortable(false);
                                        c.Bound(x => x.LatLng).Hidden();
                                        c.Bound(x => x.UserHost).Hidden();
                                    })
                                    .DetailView(detailView => detailView.ClientTemplate(
                                        "<fieldset>" +
                                          "<legend>Details for <#= UserIP #></legend>" +
                                            "<ul style='padding:0;margin:0;list-style:none'>" +
                                                "<li>UserHost: <#= UserHost #></li>" +
                                                "<li>User-Agent: <#= UserAgent #></li>" +
                                                "<li>Referrer: <#= Referrer #></li>" +
                                                "<li>Language: <#= Language #></li>" +
                                                "<li>Lasted Date: <#= LastedOn #></li>" +
                                            "</ul>" +
                                        "</fieldset>"
                                    ))
                                    .DataBinding(dataBinding =>
                                    {
                                        dataBinding.Ajax()
                                            .Select("AjaxGet", "RouteTrack");
                                    })
                                    .ClientEvents(evnets => evnets
                                        .OnRowSelect("onRowSelected")
                                        .OnRowDataBound("onRowDataBound")
                                        .OnDataBound("onDataBound")
                                        .OnDataBinding("OnDataBinding"))
                                    .Selectable()
                                    .Pageable()
                                    .Render();
                            }
                        );
                    vPanes.Add()
                        .Content(() =>
                            {%>
                                <div id="map">Google Map loading...</div>
                            <%}
                        );
                }
            )
            .Render();
        
    %>

    <% Html.Telerik().ScriptRegistrar().Scripts(script => 
           script.AddGroup("GenericCrud", group => group
           .Add(Url.AreaResourceRelative("Content.Scripts.AnalyticsModule.js", "AnalyticsModule"))
           ));
    %>

    <script type="text/javascript">

        function createMarker(point, name, html, ind) {
            var marker = new GMarker(point);

            GEvent.addListener(marker, "click", function () {
                marker.openInfoWindowHtml(html);
            });

            gmarkers[ind] = marker;

            return marker;
        }

        function onRowSelected(e) {
            var trackGrid = $('#grid').data('tGrid');

            GEvent.trigger(gmarkers[e.row.rowIndex - 1], "click");
        }

        function onRowDataBound(e) {
            var latlng = e.row.cells[8].innerHTML;
            var userhost = e.row.cells[9].innerHTML;
            var location = e.row.cells[4].innerHTML;

            var content = "User Host: " + userhost + "<br/>Location: " + location;

            var point = new GLatLng(latlng.split(",")[0], latlng.split(",")[1]);
            var marker = createMarker(point, "That place", content, e.row.rowIndex - 1);
        }

        function onDataBound(e) {
            mm.addMarkers(gmarkers, 0, 17);
            mm.refresh();
        }

        function OnDataBinding(e) {
            map.clearOverlays();
            mm = new GMarkerManager(map);
            gmarkers = [];
        }

        if (GBrowserIsCompatible()) {
            var gmarkers = [];

            var map = new GMap2(document.getElementById("map"));
            map.addControl(new GLargeMapControl());
            map.addControl(new GMapTypeControl());
            map.setCenter(new GLatLng(43.907787, -79.359741), 3);
            var mm = new GMarkerManager(map);

            mm.addMarkers(gmarkers, 0, 17);
            mm.refresh();
        } else {
            alert("Sorry, the Google Maps API is not compatible with this browser");
        }

    </script>

</asp:Content>