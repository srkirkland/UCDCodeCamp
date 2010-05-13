<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<List<UcdMvcBootCamp.Controllers.ConferenceListModel>>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent"></asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">


<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>#Sessions</th>
            <th>#Attendees</th>
        </tr>
    </thead>
    <tbody>
       <% foreach (var conference in Model) { %>
        <tr>
            <td><%= Html.Encode(conference.Name) %></td>
            <td><%= Html.Encode(conference.SessionCount) %></td>
            <td><%= Html.Encode(conference.AttendeeCount) %></td>
        </tr>
       <% } %>
    </tbody>
</table>

</asp:Content>
