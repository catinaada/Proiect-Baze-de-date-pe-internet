<%@ Page Title="Utilizatori" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Utilizatori.aspx.cs" Inherits="Proiect_BDI.Utilizatori" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <span style="font-size: medium"><%: Title %></span>
    <div style=" width: 1495px;" class="text-left">

        <br />
        <br />
        <p style="font-size: medium">
            Adauga utilizator</p>

        <br />

        <table >

                <tr>
                    <td class="auto-style4">Nume user:</td>
                    <td class="auto-style5" style="width: 236px">
                        <asp:TextBox ID="tb_nume" runat="server" CssClass="newStyle2" Width="219px"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style9">Email:</td>
                    <td class="auto-style1" style="width: 236px">
                        <asp:TextBox ID="tb_email" runat="server" CssClass="newStyle4" Width="220px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Parola:</td>
                    <td class="auto-style1" style="width: 236px">
                        <asp:TextBox ID="tb_parola" runat="server" CssClass="newStyle5" Width="219px"></asp:TextBox>
                    </td>
                </tr>
               
                <tr>
                    <td class="auto-style2" style="height: 112px">
                        <br />
                        <br />
                        
                        <br />
                        <br />
                       </td>
                    <td class="auto-style1" style="width: 236px; height: 112px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAdauga" runat="server" BackColor="White" BorderColor="#9900CC" BorderStyle="Solid" CssClass="auto-style7" ForeColor="#9900CC" Height="34px" Text="Adauga" Width="167px" OnClick="btnAdauga_Click"  />
                        <br />
                    </td>
                </tr>

            </table>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="mesaj" runat="server" style="font-size: medium"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
      
       


    </div>



</asp:Content>
