<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCarti.aspx.cs" Inherits="Proiect_BDI.EditCarti" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 346px;
            text-align: left;
        }
        .auto-style2 {
            width: 246px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 246px;
            height: 29px;
            font-size: medium;
        }
        .auto-style5 {
            width: 346px;
            height: 29px;
            text-align: left;
        }
        .newStyle1 {
            font-family: georgia;
        }
        .auto-style6 {
            text-decoration: underline;
            font-size: medium;
        }
        .auto-style7 {
            font-family: georgia;
            font-size: medium;
            text-align: center;
        }
        .auto-style9 {
            width: 246px;
            font-size: medium;
        }
        .newStyle2 {
            font-family: Georgia;
            font-size: medium;
        }
        .newStyle3 {
            font-family: Georgia;
            font-size: medium;
        }
        .newStyle4 {
            font-family: georgia;
            font-size: medium;
        }
        .newStyle5 {
            font-family: georgia;
            font-size: medium;
        }
        .newStyle6 {
            font-size: medium;
            font-family: georgia;
        }
        .newStyle7 {
            font-family: georgia;
            font-size: medium;
        }
    </style>
</head>
<body style="font-family:Georgia">
    <form id="form1" runat="server">
        <div class="auto-style3" style="border:double; border-color:darkslateblue; margin-left:50px;margin-right:50px;">
            <h2 class="auto-style3">Editare Carti</h2>
            <p>&nbsp;</p>

            <table align="center">

                <tr>
                    <td class="auto-style4">Id carte:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tb_id" runat="server" CssClass="newStyle2" Width="290px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Titlu:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tb_titlu" runat="server" CssClass="newStyle3" Width="290px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Autor:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tb_autor" runat="server" CssClass="newStyle4" Width="290px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Gen:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tb_gen" runat="server" CssClass="newStyle5" Width="290px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Pret:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tb_pret" runat="server" CssClass="newStyle6" Width="290px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">An publicare:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tb_an" runat="server" CssClass="newStyle7" OnTextChanged="tb_an_TextChanged" Width="290px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <br />
                        <br />
                        <em>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style6" NavigateUrl="~/Default.aspx" ForeColor="Blue">Pagina Carti</asp:HyperLink>
                        </em></td>
                    <td class="auto-style1">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSalveaza" runat="server" BackColor="White" BorderColor="#9900CC" BorderStyle="Solid" CssClass="auto-style7" ForeColor="#9900CC" Height="34px" Text="Salveaza mofidicarile" Width="245px" OnClick="btnSalveaza_Click" />
                        <br />
                        <br />
                    </td>
                </tr>

            </table>
            <div class="auto-style3">
                <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:bd_adaConnectionString %>" DeleteCommand="DELETE FROM [Carti] WHERE [idCarte] = @idCarte" InsertCommand="INSERT INTO [Carti] ([idCarte], [titlu], [autor], [gen], [pret], [anPublicare]) VALUES (@idCarte, @titlu, @autor, @gen, @pret, @anPublicare)" SelectCommand="SELECT [idCarte], [titlu], [autor], [gen], [pret], [anPublicare] FROM [Carti]" UpdateCommand="UPDATE [Carti] SET [titlu] = @titlu, [autor] = @autor, [gen] = @gen, [pret] = @pret, [anPublicare] = @anPublicare WHERE [idCarte] = @idCarte">
                    <DeleteParameters>
                        <asp:Parameter Name="idCarte" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idCarte" Type="Int32" />
                        <asp:Parameter Name="titlu" Type="String" />
                        <asp:Parameter Name="autor" Type="String" />
                        <asp:Parameter Name="gen" Type="String" />
                        <asp:Parameter Name="pret" Type="Int32" />
                        <asp:Parameter Name="anPublicare" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                       <asp:ControlParameter ControlID="tb_id" DbType="Int32" Name="idCarte" PropertyName="Text" />
                       <asp:ControlParameter ControlID="tb_titlu" DbType="String" Name="titlu" PropertyName="Text" />
                       <asp:ControlParameter ControlID="tb_autor" DbType="String" Name="autor" PropertyName="Text" />
                       <asp:ControlParameter ControlID="tb_gen" DbType="String" Name="gen" PropertyName="Text" />
                       <asp:ControlParameter ControlID="tb_pret" DbType="Int32" Name="pret" PropertyName="Text" />
                       <asp:ControlParameter ControlID="tb_an" DbType="Int32" Name="anPublicare" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="mesaj" runat="server" ForeColor="#9900CC"></asp:Label>
                <br />
            <br />
            </div>
        </div>
    </form>
</body>
</html>
