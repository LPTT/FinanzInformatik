<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PnPCoreJS.aspx.cs" Inherits="SP_PnP_Core_JavaScript.Layouts.SP_PnP_Core_JavaScript.PnPCoreJS" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script src="lib/jquery.min.js"></script>
    <script src="lib/pnp.min.js"></script>
    <script src="pnpsamples.js"></script>
</asp:Content>


<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div>API documentations @ https://sharepoint.github.io/PnP-JS-Core/</div>
    <div>
        <a href="#" onclick="getWebTitle()">Get Web Title</a><br/>
        <a href="#" onclick="getListForWeb()">Get Lists for Web</a><br/>
        <a href="#" onclick="getListItems()">Get List items</a><br/>
        <a href="#" onclick="addListItem()">Add List Item</a><br/>
        <a href="#" onclick="updateListItem()">Update List item</a><br/>        
        <a href="#" onclick="deleteListItem()">Delete List Item</a><br/>
    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    PnP Core JS
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
    PnP Core JS
</asp:Content>
