<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SelectList>" %>
<%@ Import Namespace="RobustHaven.Areas.VideoModule.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ManagePreset
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table border="0" cellpadding="0" cellspacing="0" style="width:800px;">
	<tr>
		<td>
			<%=Html.Telerik().DropDownList().Name("PresetComboBox").BindTo(Model).ClientEvents(events => events.OnChange("OnPresetChange")) %>
		</td>
		<td>
			<button id="btnAssign" onclick="btnAssign_Click()">Assign Selected Cameras</button>
			<button id="btnUnAssign" onclick="btnUnAssign_Click()">UnAssign Selected Cameras</button>
		</td>
	</tr>
	<tr>
		<td style="width:400px" valign="top">
			<%= Html.Telerik().Grid<VideoModuleCamera>().Name("AssignedVideoCameraGrid")
								.DataKeys(keys => keys.Add(x => x.ID))
								.Selectable()
								.Footer(false)
								.Columns(columns =>
                 							{
                 								columns.Bound(o => o.ID).Title("").Width(50).ClientTemplate("<input type='checkbox' id='<#= ID #>' />");
                 								columns.Bound(o => o.Name);
                 							})
						%>
		</td>
		<td valign="top">
			<%= Html.Telerik().Grid<VideoModuleCamera>().Name("UnAssignedVideoCameraGrid")
								.DataKeys(keys => keys.Add(x => x.ID))
								.Selectable()
								.Footer(false)
								.Columns(columns =>
                 							{
                 								columns.Bound(o => o.ID).Title("").Width(50).ClientTemplate("<input type='checkbox' id='<#= ID #>' />");
                 								columns.Bound(o => o.Name);
                 							})
						%>
		</td>
	</tr>
</table>


<form id="managePresetForm" method="post" action="ManagePreset">
	
</form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
	<script language="javascript" type="text/javascript">
		
		
		function OnPresetChange(e) {
			var assignedVideoCameraGrid = $('#AssignedVideoCameraGrid').data('tGrid');
			var unAssignedVideoCameraGrid = $('#UnAssignedVideoCameraGrid').data('tGrid');

			if (e.value == "00000000-0000-0000-0000-000000000000") {
				assignedVideoCameraGrid.dataBind([]);
				unAssignedVideoCameraGrid.dataBind([]);
				return;
			}			

			$.ajax({
				url: '<%=ResolveUrl("~/VideoModule/Home/GetPresetAssignedVideoCameras?presetId=") %>' + e.value,
				type: 'GET',
				success: function (result) {
					assignedVideoCameraGrid.dataBind(result.Data);
				}
			});

			$.ajax({
				url: '<%=ResolveUrl("~/VideoModule/Home/GetPresetNotAssignedVideoCameras?presetId=") %>' + e.value,
				type: 'GET',
				success: function (result) {
					unAssignedVideoCameraGrid.dataBind(result.Data);
				}
			});
		}

		function btnAssign_Click() {
			var assignedVideoCameraGrid = $('#AssignedVideoCameraGrid').data('tGrid');
			var unAssignedVideoCameraGrid = $('#UnAssignedVideoCameraGrid').data('tGrid');
			var cmb = $('#PresetComboBox').data('tDropDownList');
			var assigned = $.Enumerable.From($('#UnAssignedVideoCameraGrid :checked')).Select(function (x) { return x.id }).ToString(',');

			if (cmb.value() == "00000000-0000-0000-0000-000000000000") {
				return;
			}

			if (assigned.length == 0) {
				alert('please select camera(s) to assign!');
				return;
			}
			
			$.ajax({
				url: '<%=ResolveUrl("~/VideoModule/Home/AssignVideoCamerasToPreset") %>',
				data: 'pid=' + cmb.value() + '&cameraids=' + assigned,
				type: 'POST',
				success: function (result) {
					unAssignedVideoCameraGrid.dataBind(result.unassigned_data);
					assignedVideoCameraGrid.dataBind(result.assigned_data);
				}
			});
		}

		function btnUnAssign_Click() {
			var assignedVideoCameraGrid = $('#AssignedVideoCameraGrid').data('tGrid');
			var unAssignedVideoCameraGrid = $('#UnAssignedVideoCameraGrid').data('tGrid');
			var cmb = $('#PresetComboBox').data('tDropDownList');
			var unassigned = $.Enumerable.From($('#AssignedVideoCameraGrid :checked')).Select(function (x) { return x.id }).ToString(',');

			if (cmb.value() == "00000000-0000-0000-0000-000000000000") {
				return;
			}

			if (unassigned.length == 0) {
				alert('please select camera(s) to unassign!');
				return;
			}
			
			$.ajax({
				url: '<%=ResolveUrl("~/VideoModule/Home/UnAssignVideoCamerasFromPreset") %>',
				data: 'pid=' + cmb.value() + '&cameraids=' + unassigned,
				type: 'POST',
				success: function (result) {
					unAssignedVideoCameraGrid.dataBind(result.unassigned_data);
					assignedVideoCameraGrid.dataBind(result.assigned_data);
				}
			});
		}
	</script>
</asp:Content>
