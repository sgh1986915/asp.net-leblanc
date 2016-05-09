<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    VideoModule
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td style="vertical-align:top;">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td>
							<% Html.RenderAction("TabStrip_StoreTabContent"); %>
						</td>
					</tr>
					<tr>
						<td>
							<% Html.RenderAction("TabStrip_UserDefinedTabContent"); %>
						</td>
					</tr>
					<tr>
						<td align="right">
							<%=Html.ActionLink("Create Preset", "CreatePreset") %>
							<%=Html.ActionLink("Manage Preset", "ManagePreset") %>
						</td>
					</tr>
				</table>
			</td>
			<td style="vertical-align:top;">
				<div style="width:100%" id="divContents"></div>
				<div style="clear:both;">&nbsp;</div>
			</td>
		</tr>
	</table>
	
	<%
		Html.Telerik().ScriptRegistrar().OnDocumentReady(() =>
		{
		%>
			var cameras = [];
			var selectedCameras = [];

			$.ajax({
				url: '/videomodule/Home/GetCameras',
				success: function (response) {
					$.each(response, function (index, item) {
						cameras.push(item);
					});
				}
			});

			function render(data) {
				cameras = data;
			}

			function OnCameraChecked(e) {			
				var treeview = $(this).data('tTreeView');
			
				var nodeElement = e.item;
				//var firstNodeElement = $("li:first", treeview.element)[0];
				var value = treeview.getItemValue(nodeElement);
				var valueParts = value.split("_");
			
				if (e.checked) {
					$(cameras).each(function (index, item) {
						if (item.ID == valueParts[0] && valueParts[1]=='camera') {
							selectedCameras.push(item);
						}
					});
				} else {
					$(selectedCameras).each(function (index, item) {
						if (item.ID == value && valueParts[1]=='camera') {
							selectedCameras.splice(index, 1);
						}
					});
				}
			
				$('#divContents').html('');
				$("#cameraTemplate").render(selectedCameras).appendTo("#divContents");
			}
		<%
		}); %>
	
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
	<script id="cameraTemplate" type="text/html"> 
		<iframe src="/videomodule/home/CameraDisplay?id={{= ID }}" width="450" height="450" scrolling="no" style="float:left;" />
	</script>
</asp:Content>
