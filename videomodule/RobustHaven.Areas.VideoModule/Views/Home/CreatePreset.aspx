<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="RobustHaven.Areas.VideoModule.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreatePreset
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%
	var model = (List<Store>) Model;
%>

<form method="post" action="CreatePreset" id="presetForm">
<input type="hidden" id="hdnCamera" name="hdnCamera" />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td>
			<label for="txtPresetName">Name:</label>
			<input id="txtPresetName" name="txtPresetName" style="width:200px;" />
		</td>
	</tr>
	<tr>
		<td>
			<div style="width:400px; height: 200px; overflow-y:scroll;">
				<table border="0" cellpadding="0" cellspacing="0" width="370px;">
					<%foreach (var store in model)
					{%>
					<tr>
						<td>
							<%=store.storename %>
							<div style="width:100%; padding-left:15px;">
								<%foreach (var camera in store.VideoModuleCameras)
								{%>
									<input type="checkbox" id="<%=camera.ID.ToString() %>" />&nbsp;<%=camera.Name %><br />
								<%}%>
							</div>
						</td>
					</tr>	
					<%} %>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<button type="submit" onclick="OnSaveClick();">Save</button>
			<button onclick="OnCancelClick();">Cancel</button>
		</td>
	</tr>
</table>
</form>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
	<script language="javascript" type="text/javascript">
		function OnCancelClick() {

		}

		$('#presetForm').submit(function () {
			var txtPresetName = $('#txtPresetName');
			if (txtPresetName.val() == '') {
				alert('Please enter preset name!');
				return false;
			}
		});

		function OnSaveClick() {
			var ids = $.Enumerable.From($('input :checked')).Select(function (x) { return x.id }).ToString(',');
			$('#hdnCamera').val(ids);
		}
		/*
		$(document).ready(function () {
		$('#presetForm').submit(function () {
		var f = $('#presetForm');
		var action = f.attr('action');
		var data = "name=" + $('#txtPresetName').val() + "&t1=1&t2=2&t3=3";
		$.post(action, data);

		return false;
		});
		
		jQuery().ajaxStart(function () {
		$('#presetForm').fadeOut('slow');
		});

		jQuery().ajaxStop(function () {
		$('#presetForm').fadeIn('fast');
		});
		});*/
</script>
</asp:Content>