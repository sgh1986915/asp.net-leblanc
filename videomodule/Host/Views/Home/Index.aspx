<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>
 <%-- <%= Html.Telerik().DatePicker()
            .Name("DatePicker")
            .HtmlAttributes(new { id = "DatePicker_wrapper"})
            .Min(DateTime.Now.AddDays(-30))
                  .Max(DateTime.Now.AddDays(30))
            .ShowButton(true)
            .Value(DateTime.Now)
    %>--%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
