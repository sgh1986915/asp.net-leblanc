<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<RobustHaven.Areas.ContentModule.Models.ContentPage>" %>
<%@ Import Namespace="RobustHaven.Areas.ContentModule.Common" %>
<%@ Import Namespace="RobustHaven.Web.Extensions" %>
<%@ Import Namespace="RobustHaven.Web.Extensions" %>

<div id="divWithContentPageForm" style="height: 700px; width: 900px; overflow: auto;">
    
<% using (Html.BeginForm("_AddAjax", Keys.Controllers.Admin, new { area = Keys.Areas.ContentModule }, FormMethod.Post, new { id = "AjaxForm" }))
       {%>
    <div class="hide progressDivCentered" align="center">
        <img src="<%: Url.AreaResource("Content.Images.ajax-loader.gif",Keys.Areas.ContentModule)%>" alt="loading" /><br />
        <span>Proccessing..</span>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.Title)%>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.Title, new { style ="width:80%" })%>
        <%: Html.ValidationMessageFor(model => model.Title)%>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.NavigationTitle)%>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.NavigationTitle, new { style = "width:80%" })%>
        <%: Html.ValidationMessageFor(model => model.NavigationTitle)%>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.ParentPageId)%>
    </div>
    <div class="editor-field">
        <%: Html.DropDownListFor(model => model.ParentPageId, ViewData[Keys.ViewData.ContentPagesSelectList] as IEnumerable<SelectListItem>, "Select parent page", new { @class = "width400" })%>
        <%: Html.ValidationMessageFor(model => model.ParentPageId)%>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.VirtualPath)%>
    </div>
    <div class="editor-field">
        <%: Html.TextBoxFor(model => model.VirtualPath, new { style = "width:80%" })%>
        <%: Html.ValidationMessageFor(model => model.VirtualPath)%>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.Description)%>
    </div>
    <div class="editor-field">
        <%: Html.TextAreaFor(model => model.Description, 3, 80, new { style="height:100px" })%>
        <%: Html.ValidationMessageFor(model => model.Description)%>
    </div>
    
    <div class="editor-label">
        <%: Html.LabelFor(model => model.Breadcrumb)%>
    </div>
    <div class="editor-field">
        <%: Html.TextAreaFor(model => model.Breadcrumb, 3, 80, new { style = "height:200px" })%>
        <%: Html.ValidationMessageFor(model => model.Breadcrumb)%>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.Body)%>
    </div>
    <div class="editor-field">
        <%: Html.TextAreaFor(model => model.Body)%>
        
        <%: Html.ValidationMessageFor(model => model.Body)%>
    </div>
    
    <div class="editor-label">
        <%: Html.LabelFor(model => model.IsPublished)%>
    </div>
    <div class="editor-field">
        <%: Html.CheckBoxFor(model => model.IsPublished)%>
        <%: Html.ValidationMessageFor(model => model.IsPublished)%>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.MetaDescription)%>
    </div>
    <div class="editor-field">
        <%: Html.TextAreaFor(model => model.MetaDescription, new { @class = "width400" })%>
        <%: Html.ValidationMessageFor(model => model.MetaDescription)%>
    </div>

    <div class="editor-label">
        <%: Html.LabelFor(model => model.MetaKeywords)%>
    </div>
    <div class="editor-field">
        <%: Html.TextAreaFor(model => model.MetaKeywords, new { @class = "width400" })%>
        <%: Html.ValidationMessageFor(model => model.MetaKeywords)%>
    </div>
<p>
        <input type="submit" value="Create" />
    </p>
    <%} %>
</div>

<script type="text/javascript">
    $(function () {
        $("#Body").markItUp(markdownSettings);
        $("#Breadcrumb").markItUp(markdownSettings);
    });
</script>