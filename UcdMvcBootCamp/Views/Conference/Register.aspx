<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<UcdMvcBootCamp.Controllers.RegistrationEditModel>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent">Reister for conference</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    <% using (Html.BeginForm()) { %>
        <%= Html.AntiForgeryToken() %>

        <%= Html.EditorForModel() %>

        <input type="submit" value = "Register!" />
    <% } %>

</asp:Content>
