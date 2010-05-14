<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<List<UcdMvcBootCamp.Controllers.ConferenceListModel>>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent"></asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    <% using (Html.BeginForm("Index", "Conference", FormMethod.Get)) { %>

    Min Sessions: <%= Html.TextBox("minSessions") %> <input type="submit" value="Filter!" />

    <% } %>

<table>
    <thead>
        <tr>
            <th></th>
            <th>Name</th>
            <th>#Sessions</th>
            <th>#Attendees</th>
        </tr>
    </thead>
    <tbody>
       <% foreach (var conference in Model) { %>
        <tr>
            <td><%= Html.ActionLink("Edit", "Edit", new { name = conference.Name }) %>
                | <%= Html.ActionLink("Show", "Show", new {name=conference.Name}) %>
            </td>
            <td><%= Html.Encode(conference.Name) %></td>
            <td><%= Html.Encode(conference.SessionCount) %></td>
            <td><%= Html.Encode(conference.AttendeeCount) %></td>
        </tr>
       <% } %>
    </tbody>
</table>

</asp:Content>
