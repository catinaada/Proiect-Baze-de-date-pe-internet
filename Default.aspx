<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Proiect_BDI._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div >
        <h2 style="font-family: Georgia, serif;  font-style: oblique;">Carti online</h2>
    </div>

    <div >
        <div>
            <br />
       <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CssClass="myGridStyle" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="4" DataKeyNames="idCarte" DataSourceID="ds"  AllowSorting="True" style=" font-size: medium; left: -38px; top: 0px; margin-bottom: 0px; margin-right: 0px; text-align: center;" AllowPaging="True" PageSize="5" ShowFooter="True" Height="355px" Width="16px"  OnRowCommand="GridView1_RowCommand" CaptionAlign="Left"  >
            <AlternatingRowStyle BackColor="#F7F7F7" BorderStyle="Double" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" HeaderText="Editare" ShowDeleteButton="True" />
                <asp:TemplateField HeaderText="IdCarte" SortExpression="idCarte">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idCarte") %>'></asp:Label>
                    </EditItemTemplate>
                   
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("idCarte") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle CssClass="center-text" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Titlu" SortExpression="titlu">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("titlu") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbf_titlu" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("titlu") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Autor" SortExpression="autor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("autor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbf_autor" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("autor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gen" SortExpression="gen">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("gen") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbf_gen" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("gen") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pret" SortExpression="pret">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("pret") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbf_pret" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("pret") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AnPublicare" SortExpression="anPublicare">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("anPublicare") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbf_an" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("anPublicare") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btn_add" runat="server" BorderStyle="Solid" Text="Salveaza" CommandName="add" BackColor="White" />
                    </FooterTemplate>
                    <ItemTemplate>
                     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("idCarte","EditCarti.aspx?idCarte={0}") %>'>Editeaza</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7"  />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
             
            <br />
             
        </div>
             
        <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:bd_adaConnectionString %>" DeleteCommand="DELETE FROM [Carti] WHERE [idCarte] = @idCarte" InsertCommand="INSERT INTO [Carti] ( [titlu], [autor], [gen], [pret], [anPublicare]) VALUES ( @titlu, @autor, @gen, @pret, @anPublicare)" SelectCommand="SELECT [idCarte], [titlu], [autor], [gen], [pret], [anPublicare] FROM [Carti]" UpdateCommand="UPDATE [Carti] SET [titlu] = @titlu, [autor] = @autor, [gen] = @gen, [pret] = @pret, [anPublicare] = @anPublicare WHERE [idCarte] = @idCarte" >
            <DeleteParameters>
                <asp:Parameter Name="idCarte" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="titlu" Type="String" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="gen" Type="String" />
                <asp:Parameter Name="pret" Type="Int32" />
                <asp:Parameter Name="anPublicare" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="titlu" Type="String" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="gen" Type="String" />
                <asp:Parameter Name="pret" Type="Int32" />
                <asp:Parameter Name="anPublicare" Type="Int32" />
                <asp:Parameter Name="idCarte" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div style="font-size: medium">

              <span style="font-size: large">Adauga o recenzie:<br />
              </span>
                    <br />

            <table style="width: 649px">
                 <tr>
                    <td style="width: 167px" class="text-center">Carte:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsCarti" DataTextField="titlu" DataValueField="idCarte" Width="412px">
                        </asp:DropDownList>
                     </td>

                </tr>
                <tr>
                    <td style="width: 167px" class="text-center">Nume User:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsUser" DataTextField="numeUser" DataValueField="idUser" Width="412px">
                        </asp:DropDownList>
                    </td>

                </tr>
                <tr>
                    <td style="width: 167px" class="text-center">Rating:</td>
                    <td>
                        <asp:TextBox ID="tbRating" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td style="width: 167px" class="text-center">Comentariu:</td>
                    <td>
                        <asp:TextBox ID="tbCom" runat="server" Height="83px" TextMode="MultiLine" Width="407px"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td style="width: 167px" class="text-center"></td>
                    <td>
                        <br />
                        <asp:Button ID="btnAdd" runat="server" BackColor="White" BorderColor="#660066" BorderStyle="Solid" OnClick="btnAdd_Click" Text="Adauga" Width="185px" />
                    </td>

                </tr>
            </table>
            <br />

        </div>

        <asp:SqlDataSource ID="dsCarti" runat="server" ConnectionString="<%$ ConnectionStrings:bd_adaConnectionString %>" DeleteCommand="DELETE FROM [Carti] WHERE [idCarte] = @idCarte" InsertCommand="INSERT INTO [Carti] ([titlu], [autor], [gen], [pret], [anPublicare]) VALUES (@titlu, @autor, @gen, @pret, @anPublicare)" SelectCommand="SELECT * FROM [Carti]" UpdateCommand="UPDATE [Carti] SET [titlu] = @titlu, [autor] = @autor, [gen] = @gen, [pret] = @pret, [anPublicare] = @anPublicare WHERE [idCarte] = @idCarte">
            <DeleteParameters>
                <asp:Parameter Name="idCarte" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="titlu" Type="String" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="gen" Type="String" />
                <asp:Parameter Name="pret" Type="Int32" />
                <asp:Parameter Name="anPublicare" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="titlu" Type="String" />
                <asp:Parameter Name="autor" Type="String" />
                <asp:Parameter Name="gen" Type="String" />
                <asp:Parameter Name="pret" Type="Int32" />
                <asp:Parameter Name="anPublicare" Type="Int32" />
                <asp:Parameter Name="idCarte" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsUser" runat="server" ConnectionString="<%$ ConnectionStrings:bd_adaConnectionString %>" DeleteCommand="DELETE FROM [Utilizatori] WHERE [idUser] = @idUser" InsertCommand="INSERT INTO [Utilizatori] ([numeUser], [email], [parola]) VALUES (@numeUser, @email, @parola)" SelectCommand="SELECT * FROM [Utilizatori]" UpdateCommand="UPDATE [Utilizatori] SET [numeUser] = @numeUser, [email] = @email, [parola] = @parola WHERE [idUser] = @idUser">
            <DeleteParameters>
                <asp:Parameter Name="idUser" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="numeUser" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="parola" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="numeUser" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="parola" Type="String" />
                <asp:Parameter Name="idUser" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <br />
        <asp:Label ID="msj" runat="server" style="font-size: medium"></asp:Label>
        <br />
        <br />
        <br />
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
