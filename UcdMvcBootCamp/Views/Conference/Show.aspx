<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<UcdMvcBootCamp.Controllers.ConferenceShowModel>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent">Showing Conference</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    <h2>Conference <%= Html.Encode(Model.Name) %></h2>
    <p><%= Html.ActionLink("Register for this conference", "Register", new { Model.Name } ) %></p>

    <ul>
    <% foreach (var session in Model.Sessions) { %>

        <li>
            <%= Html.Encode(session.Title) %> by <strong><%= Html.Encode(string.Format("{0} {1}", session.SpeakerFirstName, session.SpeakerLastName)) %></strong>
        </li>

    <% } %>
    </ul>
</asp:Content>
