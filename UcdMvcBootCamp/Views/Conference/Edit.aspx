<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<UcdMvcBootCamp.Core.Domain.Conference>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent"></asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    <% using (Html.BeginForm()) { %>
        <%= Html.AntiForgeryToken() %>

<fieldset>
    <legend>Edit Conference</legend>

    <%= Html.LabelFor(x=>x.Name) %>
    <%= Html.EditorFor(x=>x.Name) %>

    <input type="submit" name="submit" value="Update!" />

</fieldset>

    <% } %>

</asp:Content>
