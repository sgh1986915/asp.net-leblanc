<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="RobustHaven.Areas.VideoModule.Models" %>
<%
	var model = (List<Store>) Model;
%>
<script src="<%=ResolveUrl("~/Scripts/jquery-1.4.4.js") %>" type="text/javascript"></script>
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
			<div style="width:300px; height: 200px; overflow-y:scroll;">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
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
<script language="javascript" type="text/javascript">
	function OnCancelClick() {
		
	}

	function OnSaveClick() {
		$('input:checked').each(function (index, item) {
			$('#hdnCamera').val($('#hdnCamera').val() + ',' + item.id);
		});
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