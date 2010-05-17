<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<UcdMvcBootCamp.Controllers.ConferenceShowModel>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent">Showing Conference</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="additionalScripts">

<% if (false) { %>
    <script src="../../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
<% } %>

<script language="javascript" type="text/javascript">

    $(function () {
        $('#show-attendees').click(function () {

            var url = '<%= Url.Action("List", "Attendee", new { conferenceName = Model.Name }) %>';

            // Keep a reference to the show attendees button for later
            var button = $(this);

            $.get(
                url,
                null,
                function (data) {
                    // Place HTML returned from AJAX inside special p tag below
                    $('#attendees').html(data);

                    // Hide the show attendees button
                    button.hide();
                },
                'html'
            );
        });
    });

</script>

</asp:Content>
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

    <br />
    <input type="submit" id="show-attendees" value="Show Attendees" />

    <p id="attendees">
    
    </p>
</asp:Content>
