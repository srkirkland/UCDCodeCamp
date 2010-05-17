<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.IEnumerable<UcdMvcBootCamp.Controllers.AttendeeListModel>>" %>

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
