﻿<%-- 
This file is part of Ingo Karstein's Conditional Lookup project

**Do not remove this comment**

Please see the project homepage at CodePlex:
  http://spcustomlistformdemo.codeplex.com/

Please see my blog:
  http://ikarstein.wordpress.com

Licence: GPLv2
    Ingo Karstein's SharePoint 2010 Custom Ribbon Demo
    Copyright (C) 2011  Ingo Karstein, ikarstein@hotmail.com

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--%>
<%@ Assembly Name="ik.SharePoint2010.SPCustomListFormDemo, Version=1.0.0.0, Culture=neutral, PublicKeyToken=e0d579168c969b0f" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new3.aspx.cs" Inherits="ik.SharePoint2010.SPCustomListFormDemo.Layouts.SPCustomListFormDemo.new3"
    MasterPageFile="~masterurl/default.master" %>

<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    <SharePoint:ListFormPageTitle runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    <span class="die">
        <SharePoint:ListProperty Property="LinkTitle" runat="server" ID="ID_LinkTitle" />
        : </span>
    <SharePoint:ListItemProperty ID="ID_ItemProperty" MaxLength="40" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
    <img src="/_layouts/images/blank.gif" width='1' height='1' alt="" />
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderLeftNavBar" runat="server">
    <SharePoint:UIVersionedContent UIVersion="4" runat="server">
        <contenttemplate>
                <div class="ms-quicklaunchouter">
                <div class="ms-quickLaunch">
                <SharePoint:UIVersionedContent UIVersion="3" runat="server">
                    <ContentTemplate>
                        <h3 class="ms-standardheader"><label class="ms-hidden"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,quiklnch_pagetitle%>" EncodeMethod="HtmlEncode"/></label>
                        <Sharepoint:SPSecurityTrimmedControl runat="server" PermissionsString="ViewFormPages">
                            <div class="ms-quicklaunchheader"><SharePoint:SPLinkButton id="idNavLinkViewAll" runat="server" NavigateUrl="~site/_layouts/viewlsts.aspx" Text="<%$Resources:wss,quiklnch_allcontent%>" accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>"/></div>
                        </SharePoint:SPSecurityTrimmedControl>
                        </h3>
                    </ContentTemplate>
                </SharePoint:UIVersionedContent>
                <Sharepoint:SPNavigationManager
                id="QuickLaunchNavigationManager"
                runat="server"
                QuickLaunchControlId="QuickLaunchMenu"
                ContainedControl="QuickLaunch"
                EnableViewState="false"
                CssClass="ms-quicklaunch-navmgr"
                >
                <div>
                    <SharePoint:DelegateControl runat="server" ControlId="QuickLaunchDataSource">
                        <Template_Controls>
                        <asp:SiteMapDataSource SiteMapProvider="SPNavigationProvider" ShowStartingNode="False" id="QuickLaunchSiteMap" StartingNodeUrl="sid:1025" runat="server" />
                     </Template_Controls>
                    </SharePoint:DelegateControl>
                    <SharePoint:UIVersionedContent UIVersion="3" runat="server">
                        <ContentTemplate>
                            <SharePoint:AspMenu id="QuickLaunchMenu" runat="server" DataSourceId="QuickLaunchSiteMap" Orientation="Vertical" StaticDisplayLevels="2" ItemWrap="true" MaximumDynamicDisplayLevels="0" StaticSubMenuIndent="0" SkipLinkText="" CssClass="s4-die">
                                <LevelMenuItemStyles>
                                    <asp:menuitemstyle CssClass="ms-navheader" />
                                    <asp:menuitemstyle CssClass="ms-navitem" />
                                </LevelMenuItemStyles>
                                <LevelSubMenuStyles>
                                    <asp:submenustyle CssClass="ms-navSubMenu1" />
                                    <asp:submenustyle CssClass="ms-navSubMenu2" />
                                </LevelSubMenuStyles>
                                <LevelSelectedStyles>
                                    <asp:menuitemstyle CssClass="ms-selectednavheader" />
                                    <asp:menuitemstyle CssClass="ms-selectednav" />
                                </LevelSelectedStyles>
                            </SharePoint:AspMenu>
                        </ContentTemplate>
                    </SharePoint:UIVersionedContent>
                    <SharePoint:UIVersionedContent UIVersion="4" runat="server">
                        <ContentTemplate>
                            <SharePoint:AspMenu id="V4QuickLaunchMenu" runat="server" EnableViewState="false" DataSourceId="QuickLaunchSiteMap" UseSimpleRendering="true" Orientation="Vertical" StaticDisplayLevels="2" MaximumDynamicDisplayLevels="0" SkipLinkText="" CssClass="s4-ql" />
                        </ContentTemplate>
                    </SharePoint:UIVersionedContent>
                </div>
                </Sharepoint:SPNavigationManager>
            <Sharepoint:UIVersionedContent runat="server" UIVersion="3">
                <ContentTemplate>
                    <Sharepoint:SPNavigationManager
                    id="TreeViewNavigationManager"
                    runat="server"
                    ContainedControl="TreeView"
                    >
                      <table class="ms-navSubMenu1" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                          <td>
                            <table class="ms-navheader" width="100%" cellpadding="0" cellspacing="0" border="0">
                              <tr>
                                <td nowrap="nowrap" id="idSiteHierarchy">
                                  <SharePoint:SPLinkButton runat="server" NavigateUrl="~site/_layouts/viewlsts.aspx" id="idNavLinkSiteHierarchy" Text="<%$Resources:wss,treeview_header%>" accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>"/>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                      <div class="ms-treeviewouter">
                        <SharePoint:DelegateControl runat="server" ControlId="TreeViewAndDataSource">
                          <Template_Controls>
                            <SharePoint:SPHierarchyDataSourceControl
                             runat="server"
                             id="TreeViewDataSource"
                             RootContextObject="Web"
                             IncludeDiscussionFolders="true"
                            />
                            <SharePoint:SPRememberScroll runat="server" id="TreeViewRememberScroll" onscroll="javascript:_spRecordScrollPositions(this);" style="overflow: auto;height: 400px;width: 150px; ">
                              <Sharepoint:SPTreeView
                                id="WebTreeView"
                                runat="server"
                                ShowLines="false"
                                DataSourceId="TreeViewDataSource"
                                ExpandDepth="0"
                                SelectedNodeStyle-CssClass="ms-tvselected"
                                NodeStyle-CssClass="ms-navitem"
                                NodeStyle-HorizontalPadding="2"
                                SkipLinkText=""
                                NodeIndent="12"
                                ExpandImageUrl="/_layouts/images/tvplus.gif"
                                CollapseImageUrl="/_layouts/images/tvminus.gif"
                                NoExpandImageUrl="/_layouts/images/tvblank.gif"
                              >
                              </Sharepoint:SPTreeView>
                            </Sharepoint:SPRememberScroll>
                          </Template_Controls>
                        </SharePoint:DelegateControl>
                      </div>
                    </Sharepoint:SPNavigationManager>
                </ContentTemplate>
            </SharePoint:UIVersionedContent>
            <Sharepoint:UIVersionedContent runat="server" UIVersion="4">
                <ContentTemplate>
                    <Sharepoint:SPNavigationManager
                    id="TreeViewNavigationManagerV4"
                    runat="server"
                    ContainedControl="TreeView"
                    CssClass="s4-treeView"
                    >
                      <SharePoint:SPLinkButton runat="server" NavigateUrl="~site/_layouts/viewlsts.aspx" id="idNavLinkSiteHierarchyV4" Text="<%$Resources:wss,treeview_header%>" accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>" CssClass="s4-qlheader" />
                          <div class="ms-treeviewouter">
                            <SharePoint:DelegateControl runat="server" ControlId="TreeViewAndDataSource">
                              <Template_Controls>
                                <SharePoint:SPHierarchyDataSourceControl
                                 runat="server"
                                 id="TreeViewDataSourceV4"
                                 RootContextObject="Web"
                                 IncludeDiscussionFolders="true"
                                />
                                <SharePoint:SPRememberScroll runat="server" id="TreeViewRememberScrollV4" onscroll="javascript:_spRecordScrollPositions(this);" style="overflow: auto;height: 400px;width: 155px; ">
                                  <Sharepoint:SPTreeView
                                    id="WebTreeViewV4"
                                    runat="server"
                                    ShowLines="false"
                                    DataSourceId="TreeViewDataSourceV4"
                                    ExpandDepth="0"
                                    SelectedNodeStyle-CssClass="ms-tvselected"
                                    NodeStyle-CssClass="ms-navitem"
                                    SkipLinkText=""
                                    NodeIndent="12"
                                    ExpandImageUrl="/_layouts/images/tvclosed.png"
                                    ExpandImageUrlRtl="/_layouts/images/tvclosedrtl.png"
                                    CollapseImageUrl="/_layouts/images/tvopen.png"
                                    CollapseImageUrlRtl="/_layouts/images/tvopenrtl.png"
                                    NoExpandImageUrl="/_layouts/images/tvblank.gif"
                                  >
                                  </Sharepoint:SPTreeView>
                                </Sharepoint:SPRememberScroll>
                              </Template_Controls>
                            </SharePoint:DelegateControl>
                          </div>
                    </Sharepoint:SPNavigationManager>
                </ContentTemplate>
            </SharePoint:UIVersionedContent>
                <SharePoint:UIVersionedContent UIVersion="3" runat="server" id="PlaceHolderQuickLaunchBottomV3">
                    <ContentTemplate>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" class="s4-die">
                        <tbody>
                        <tr><td>
                        <table class="ms-recyclebin" width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                        <tr><td nowrap="nowrap">
                        <SharePoint:SPLinkButton runat="server" NavigateUrl="~site/_layouts/recyclebin.aspx" id="v3idNavLinkRecycleBin" ImageUrl="/_layouts/images/recycbin.gif" Text="<%$Resources:wss,StsDefault_RecycleBin%>" PermissionsString="DeleteListItems" />
                        </td></tr>
                        </table>
                        </td></tr>
                        </table>
                    </ContentTemplate>
                </SharePoint:UIVersionedContent>
                <SharePoint:UIVersionedContent UIVersion="4" runat="server" id="PlaceHolderQuickLaunchBottomV4">
                    <ContentTemplate>
                        <ul class="s4-specialNavLinkList">
                            <li>
                                <SharePoint:ClusteredSPLinkButton
                                    runat="server"
                                    NavigateUrl="~site/_layouts/recyclebin.aspx"
                                    ImageClass="s4-specialNavIcon"
                                    ImageUrl="/_layouts/images/fgimg.png"
                                    ImageWidth=16
                                    ImageHeight=16
                                    OffsetX=0
                                    OffsetY=428
                                    id="idNavLinkRecycleBin"
                                    Text="<%$Resources:wss,StsDefault_RecycleBin%>"
                                    CssClass="s4-rcycl"
                                    PermissionsString="DeleteListItems" />
                            </li>
                            <li>
                                <SharePoint:ClusteredSPLinkButton
                                    id="idNavLinkViewAllV4"
                                    runat="server"
                                    PermissionsString="ViewFormPages"
                                    NavigateUrl="~site/_layouts/viewlsts.aspx"
                                    ImageClass="s4-specialNavIcon"
                                    ImageUrl="/_layouts/images/fgimg.png"
                                    ImageWidth=16
                                    ImageHeight=16
                                    OffsetX=0
                                    OffsetY=0
                                    Text="<%$Resources:wss,quiklnch_allcontent_short%>"
                                    accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>"/>
                            </li>
                        </ul>
                    </ContentTemplate>
                </SharePoint:UIVersionedContent>
                </div>
                </div>
    </contenttemplate>
    </SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <h1>
        Hello World!</h1>
    <SharePoint:UIVersionedContent UIVersion="4" runat="server">
        <contenttemplate>
    <div style="padding-left:5px">
    </contenttemplate>
    </SharePoint:UIVersionedContent>
    <table cellpadding="0" cellspacing="0" id="onetIDListForm" style="width: 100%">
        <tr>
            <td>
                <WebPartPages:WebPartZone runat="server" FrameType="None" ID="Main" Title="loc:Main"
                    Visible="true">
                    <ZoneTemplate>
                    </ZoneTemplate>
                </WebPartPages:WebPartZone>

                <!-- ikarstein: Insert such a structure for each field you want to show on you page -->
                <table border="0" width="100%">
                    <tr>
                        <td class="ms-toolbar" nowrap="nowrap">
                            <SharePoint:FormToolBar runat="server" ControlMode="New" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span id="part1"> <!-- ikarstein: This line is important for "Attachments" -->
                                <table border="0" cellspacing="0" width="100%">
                                    <!-- ikarstein: Insert such a table row for each field / BEGIN-->
                                    <tr>
                                        <td width="190px" valign="top" class="ms-formlabel">
                                            <h3 class="ms-standardheader">
                                                <nobr>Title<span class="ms-formvalidation"> *</span></nobr>
                                            </h3>
                                        </td>
                                        <td width="400px" valign="top" class="ms-formbody">
                                            <SharePoint:FormField runat="server" ID="field_Title" ControlMode="New" FieldName="Title" />
                                            <SharePoint:FieldDescription runat="server" ID="field_Title_Description" FieldName="Title"
                                                ControlMode="New" />
                                        </td>
                                    </tr>
                                    <!-- karstein: END -->
                                    <tr>
                                        <td width="190px" valign="top" class="ms-formlabel">
                                            <h3 class="ms-standardheader">
                                                <nobr>Body</nobr>
                                            </h3>
                                        </td>
                                        <td width="400px" valign="top" class="ms-formbody">
                                            <SharePoint:FormField runat="server" ID="field_Body" ControlMode="New" FieldName="Body" />
                                            <SharePoint:FieldDescription runat="server" ID="field_Body_Description" FieldName="Body"
                                                ControlMode="New" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="190px" valign="top" class="ms-formlabel">
                                            <h3 class="ms-standardheader">
                                                <nobr>Expires</nobr>
                                            </h3>
                                        </td>
                                        <td width="400px" valign="top" class="ms-formbody">
                                            <SharePoint:FormField runat="server" ID="field_Expires" ControlMode="New" FieldName="Expires" />
                                            <SharePoint:FieldDescription runat="server" ID="field_Expires_Description" FieldName="Expires"
                                                ControlMode="New" />
                                        </td>
                                    </tr>
                                    <!-- ikarstein: optionally add this table row / BEGIN -->
                                    <tr id="idAttachmentsRow">
                                        <td nowrap="true" valign="top" class="ms-formlabel" width="20%">
                                            <SharePoint:FieldLabel ControlMode="New" FieldName="Attachments" runat="server" />
                                        </td>
                                        <td valign="top" class="ms-formbody" width="80%">
                                            <SharePoint:FormField runat="server" ID="AttachmentsField" ControlMode="New" FieldName="Attachments" />
                                            <script language="javascript" type="text/javascript">
                                              var elm = document.getElementById("idAttachmentsTable");
                                              if (elm == null || elm.rows.length == 0)
                                                document.getElementById("idAttachmentsRow").style.display='none';
                                            </script>
                                        </td>
                                    </tr>
                                    <!-- ikarstein: END -->

                                    <!-- ikarstein: Add this table for "Save" and "Cancel" buttons / BEGIN -->
                                    <table width="100%" border="0" cellspacing="0">
                                        <tr>
                                            <td width="99%" class="ms-toolbar" nowrap="nowrap">
                                                <img src="/_layouts/images/blank.gif" width="1" height="18" />
                                            </td>
                                            <td class="ms-toolbar" nowrap="nowrap">
                                                <SharePoint:SaveButton runat="server" ControlMode="New" ID="savebutton" />
                                            </td>
                                            <td class="ms-separator">
                                            </td>
                                            <td class="ms-toolbar" nowrap="nowrap" align="right">
                                                <SharePoint:GoBackButton runat="server" ControlMode="New" ID="gobackbutton" />
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- ikarstein: END -->
                            </span>
                            <SharePoint:AttachmentUpload runat="server" ControlMode="New" />
                            <SharePoint:ItemHiddenVersion runat="server" ControlMode="New" />
                        </td>
                    </tr>
                </table>
                <img src="/_layouts/images/blank.gif" width='590' height='1' alt="" />
            </td>
        </tr>
    </table>
    <SharePoint:UIVersionedContent UIVersion="4" runat="server">
        <contenttemplate> </div>
    </contenttemplate>
    </SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <SharePoint:UIVersionedContent UIVersion="4" runat="server">
        <contenttemplate>
        <SharePoint:CssRegistration Name="forms.css" runat="server"/>
    </contenttemplate>
    </SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderTitleLeftBorder" runat="server">
    <table cellpadding="0" height="100%" width="100%" cellspacing="0">
        <tr>
            <td class="ms-areaseparatorleft">
                <img src="/_layouts/images/blank.gif" width='1' height='1' alt="" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderTitleAreaClass" runat="server">
    <script type="text/javascript" id="onetidPageTitleAreaFrameScript">
        if (document.getElementById("onetidPageTitleAreaFrame") != null) {
            document.getElementById("onetidPageTitleAreaFrame").className = "ms-areaseparator";
        }
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderBodyAreaClass" runat="server">
    <style type="text/css">
        .ms-bodyareaframe
        {
            padding: 8px;
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderBodyLeftBorder" runat="server">
    <div class='ms-areaseparatorleft'>
        <img src="/_layouts/images/blank.gif" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderTitleRightMargin" runat="server">
    <div class='ms-areaseparatorright'>
        <img src="/_layouts/images/blank.gif" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderBodyRightMargin" runat="server">
    <div class='ms-areaseparatorright'>
        <img src="/_layouts/images/blank.gif" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderTitleAreaSeparator" runat="server" />
