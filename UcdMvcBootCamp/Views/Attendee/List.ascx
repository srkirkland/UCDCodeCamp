<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<UcdMvcBootCamp.Controllers.AttendeeListModel>>" %>

<h3>Attendees</h3>
<table>
<% foreach (var attendee in Model) { %>

    <tr>
        <td>
            <%= Html.Encode(attendee.FirstName) %>
        </td>
        <td>
            <%= Html.Encode(attendee.LastName) %>
        </td>
    </tr>

<% } %>

</table>
