<%@ Page Title="Recenzii" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recenzii.aspx.cs" Inherits="Proiect_BDI.Recenzii" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 ><%: Title %> </h2>
    <div>

    &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
      
        <br />
        <div class="text-center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" DataKeyNames="idReviews" DataSourceID="SqlDataSource1" Height="262px" Width="915px" AllowPaging="True" PageSize="5" AllowSorting="True">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField HeaderText="Id Reviews" SortExpression="idReviews">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idReviews") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idReviews") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="titlu" HeaderText="Titlu" SortExpression="titlu" />
                <asp:BoundField DataField="gen" HeaderText="Gen" SortExpression="gen" />
                <asp:BoundField DataField="numeUser" HeaderText="Nume User" SortExpression="numeUser" />
                <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                <asp:BoundField DataField="comentariu" HeaderText="Comentariu" SortExpression="comentariu" />
                <asp:CommandField DeleteText="Sterge" ShowDeleteButton="True" />
                <asp:CommandField EditText="Editeaza" ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        </div>
        <br />
        <br />
      



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_adaConnectionString %>" SelectCommand="SELECT Reviews.idReviews, Carti.titlu, Carti.gen, Utilizatori.numeUser, Reviews.rating, Reviews.comentariu
FROM Reviews
INNER JOIN  Carti ON Carti.idCarte = Reviews.idCarte
INNER JOIN Utilizatori ON Reviews.idUser=Utilizatori.idUser;
" DeleteCommand=" DELETE FROM Reviews WHERE idReviews = @idReviews;" UpdateCommand="UPDATE Reviews
SET rating = @rating, comentariu = @comentariu
WHERE idReviews = @idReviews ">
            <DeleteParameters>
                <asp:Parameter Name="idReviews" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="rating" />
                <asp:Parameter Name="comentariu" />
                <asp:Parameter Name="idReviews" />
            </UpdateParameters>
        </asp:SqlDataSource>
      



        <br style="font-size: medium" />
        <span style="font-size: medium">Afisare Reviews dupa rating:&nbsp;&nbsp;
        <asp:TextBox ID="tb_prag" runat="server" BorderColor="#660066" Height="25px" Width="188px"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="btnRating" runat="server" BackColor="White" BorderColor="#9900CC" BorderStyle="Groove" OnClick="btnRating_Click" Text="Afisare Reviews" Width="180px" />
        <br />
        <br />
        <asp:TextBox ID="tb_mesaj" runat="server" BackColor="#CCCCFF" BorderColor="#660066" BorderStyle="Groove" Height="200px"  TextMode="MultiLine" Width="635px"></asp:TextBox>
        

        <br />

        </span>

    </div>
    
</asp:Content>
