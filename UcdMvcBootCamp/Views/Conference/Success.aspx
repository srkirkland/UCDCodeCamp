<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<UcdMvcBootCamp.Controllers.RegistrationEditModel>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent">Registration Success</asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    Congratulations <%= Html.Encode(string.Format("{0} {1}", Model.FirstName, Model.LastName)) %>!  You have successfully registered for <%= Html.Encode(Model.ConferenceName) %>

    <br />
    <%= Html.ActionLink("Back to List", "Index") %>

</asp:Content>
