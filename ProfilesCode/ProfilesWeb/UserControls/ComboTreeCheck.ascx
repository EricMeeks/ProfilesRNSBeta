﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ComboTreeCheck.ascx.cs" Inherits="ComboTreeCheck" %>
<div id='<%= "divCTC_" + ClientID %>' class="comboTreeCheck" onmouseover="overCTC(this)" onmouseout="outCTC(this);">
    <div class="comboTreeCheckBox">
        <asp:Label ID="lSelectText" style="cursor:pointer" runat="server" Text="--Select--" />
        <asp:HiddenField ID="hdnSelectedText" runat="server" />
        <asp:ImageButton ID="ibExpand" runat="server" ImageUrl="~/Images/blank.gif" />
    </div>
    <div id="divMasterContent">
        <asp:Repeater runat="server" ID="rMaster" 
            onitemdatabound="rMaster_ItemDataBound">
            <ItemTemplate>
                <div ID='<%# "divMaster_CTC" + DataBinder.Eval(Container.DataItem, DataMasterIDField)%>'>
                    <img runat="server" id="imgExpand" alt="click to expand" src="~/Images/blank.gif" /> <asp:Label ID="lMasterText" runat="server" />
                    <asp:HiddenField ID="hdnIsExpand" Value="0" runat="server" />
                    <asp:HiddenField ID="hdnMasterID" runat="server" />
                    <div id="divDetail" runat="server">
                        <asp:Repeater runat="server" ID="rDetail" onitemdatabound="rDetail_ItemDataBound">
                            <ItemTemplate>
                                <div id="divDetailCheck">
                                    <asp:HiddenField ID="hdnDetailID" runat="server" />
                                    <asp:HiddenField ID="hdnDetailText" runat="server" />
                                    <asp:CheckBox ID="checkDetailText" runat="server" />
                                </div>                                            
                            </ItemTemplate>
                        </asp:Repeater>                                    
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>                                 
    </div>        
</div>