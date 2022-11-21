<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePayroll.Master" AutoEventWireup="true" CodeBehind="EmployeeDetailPage.aspx.cs" Inherits="EmployeePayrollWebforms.WebForms.EmployeeDetailPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/EmployeeDetailPage.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="heading">
        <p>Employee Details</p>
    </div>
        <br /> 
    
    <div class="table1">
        <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" HorizontalAlign="Center" Width="1155px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>
    
    <div class="table1">
     <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
         BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="2px" CellPadding="3" GridLines="Vertical" 
         HorizontalAlign="Center" Width="1100px">
         <AlternatingRowStyle BackColor="#FFFFFF" />
         <Columns>

             <asp:TemplateField HeaderText="IMG" SortExpression="IMG">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IMG") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IMG") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

             <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
<%--             <asp:BoundField DataField="IMG" HeaderText="IMG" SortExpression="IMG" />--%>
             <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
             <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
             <asp:BoundField DataField="DEPARTMENT" HeaderText="DEPARTMENT" SortExpression="DEPARTMENT" />
             <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
             <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
             <asp:BoundField DataField="NOTES" HeaderText="NOTES" SortExpression="NOTES" />
             <asp:CommandField ButtonType="Image" CancelImageUrl="~/Assets/Image/cancel.png" DeleteImageUrl="../Assets/Image/delete-black-18dp.svg" EditImageUrl="../Assets/Image/update-black-18dp.svg" HeaderText="ACTIONS" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/Assets/Image/create-black-18dp.svg" />


         </Columns>

         <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#999999" Font-Bold="True" ForeColor="White" Height="62px" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFFFF" ForeColor="Black" Height="58px" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />

     </asp:GridView>
        </div>
     <br />

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EmpPayrollWebformConnectionString %>
         " SelectCommand="SELECT [ID], [IMG], [NAME], [GENDER], [DEPARTMENT], [SALARY], [START_DATE], [NOTES] FROM [EmpPayrollDetails]" 
         ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [EmpPayrollDetails] WHERE [ID] = @original_ID AND 
         [IMG] = @original_IMG AND [NAME] = @original_NAME AND [GENDER] = @original_GENDER AND [DEPARTMENT] = @original_DEPARTMENT AND 
         [SALARY] = @original_SALARY AND [START_DATE] = @original_START_DATE AND 
         [NOTES] = @Original_NOTES"  InsertCommand="INSERT INTO [EmpPayrollDetails] ([IMG], [NAME], [GENDER], [DEPARTMENT], [SALARY], [START_DATE], [Notes])
         VALUES (@IMG, @NAME, @GENDER, @DEPARTMENT, @SALARY, @START_DATE, @NOTES)" OldValuesParameterFormatString="original_{0}" 
         UpdateCommand="UPDATE [EmpPayrollDetails] SET [IMG] = @IMG, [NAME] = @NAME, [GENDER] = @GENDER, [DEPARTMENT] = @DEPARTMENT, 
         [SALARY] = @SALARY, [START_DATE] = @START_DATE, [NOTES] = @NOTES WHERE [ID] = @original_ID AND [IMG] = @original_IMG AND [NAME] = @original_NAME AND 
         [GENDER] = @original_GENDER AND [DEPARTMENT] = @original_DEPARTMENT AND [SALARY] = @original_SALARY AND [START_DATE] = @original_START_DATE AND 
         [NOTES] = @Original_NOTES" >

         <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_IMG" Type="String" />
                    <asp:Parameter Name="original_NAME" Type="String" />
                    <asp:Parameter Name="original_GENDER" Type="String" />
                    <asp:Parameter Name="original_DEPARTMENT" Type="String" />
                    <asp:Parameter Name="original_SALARY" Type="String" />
                    <asp:Parameter Name="original_START_DATE" Type="String" />
                  <asp:Parameter Name="original_NOTES" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IMG" Type="String" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="GENDER" Type="String" />
                    <asp:Parameter Name="DEPARTMENT" Type="String" />
                    <asp:Parameter Name="SALARY" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="String" />
                     <asp:Parameter Name="NOTES" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IMG" Type="String" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="GENDER" Type="String" />
                    <asp:Parameter Name="DEPARTMENT" Type="String" />
                    <asp:Parameter Name="SALARY" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="String" />
                    <asp:Parameter Name="NOTES" Type="String" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                    <asp:Parameter Name="original_IMG" Type="String" />
                    <asp:Parameter Name="original_NAME" Type="String" />
                    <asp:Parameter Name="original_GENDER" Type="String" />
                    <asp:Parameter Name="original_DEPARTMENT" Type="String" />
                    <asp:Parameter Name="original_SALARY" Type="String" />
                    <asp:Parameter Name="original_START_DATE" Type="String" />
                    <asp:Parameter Name="original_NOTES" Type="String" />
                </UpdateParameters>

     </asp:SqlDataSource>
    
     <br />
    <div>
         <asp:Button ID="Button1" class="btn addUser" runat="server" OnClick="Button1_Click" Text="Add User" />
    </div>
    

</asp:Content>
