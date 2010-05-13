<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="TitleContent"></asp:Content>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    <h2><%= ViewData["text"] %></h2>

    Hello!
    
    <% using(Html.BeginForm("GoTo", "Dynamic")) { %>
    
        Goto: <%= Html.TextBox("gotoUrl") %>
       
       <input type="submit" value="Go!" />
    
    <% } %>
    
</asp:Content>
