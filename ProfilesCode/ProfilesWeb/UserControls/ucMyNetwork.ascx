﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMyNetwork.ascx.cs" Inherits="UserControls_ucMyNetwork" %>
 <asp:UpdatePanel ID="upnlNetwork" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Panel ID="pnlNetwork" runat="server" Visible="true">
            <div class="menuWidgetTitle">My Network</div>
            <asp:GridView ID="grdNetwork" runat="server" Width="100%" AutoGenerateColumns="False" GridLines="None" DataKeyNames="PersonId"
                OnRowCreated="grdNetwork_OnRowCreated" OnRowDeleting="grdNetwork_OnRowDeleting" ShowHeader="false" EmptyDataText="<div style='font-style:italic;'>None</div>">
                <Columns>
                    <asp:BoundField DataField="PersonId" ReadOnly="true" Visible="false" />
                    <asp:TemplateField HeaderText="My Network" HeaderStyle-HorizontalAlign="Left" ControlStyle-CssClass="SearchListLink">
                        <ItemTemplate>
                            <asp:HyperLink ID="hypLnkNetwork" runat="server" Text='<%#Eval("MyNetwork") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Delete.png" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <div>
            </div>
            <div style="height: 16px">
            </div>
            <asp:HyperLink ID="LnkNetwork" runat="server" Text="Details" NavigateUrl="~/MyNetwork.aspx" />
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
