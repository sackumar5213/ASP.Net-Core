<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="Employee_CRUD.employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>

        <style>

            #gridview{
                background-color:aquamarine;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <center>
                    <h1 style="text-align: center;">Employee Form</h1>
                    <table border="2">
                        <%--
                        <tr>

                            <td>Employee ID:</td>
                            <td><asp:TextBox ID="txtempid" runat="server"></asp:TextBox></td>
                        </tr>
                        --%>

                        <tr>
                            <td>Employee Name:</td>
                            <td><asp:TextBox ID="txtempname" runat="server"></asp:TextBox></td>
                           <%-- <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtempname" ErrorMessage="Name Should Be Entered" Display="None" ValidationGroup="EmployeeForm"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator
                                ID="revname"
                                runat="server"
                                ValidationGroup="EmployeeForm"
                                ControlToValidate="txtempname"
                                ErrorMessage="Name Should Be Only AlphaBet"
                                Display="None"
                                ValidationExpression="^[a-zA-Z]+$"
                            ></asp:RegularExpressionValidator>--%>
                        </tr>

                        <tr>
                            <td>Employee Age:</td>
                            <td><asp:TextBox ID="txtempage" runat="server"></asp:TextBox></td>
                          <%--  <asp:RequiredFieldValidator ID="rfvage" runat="server" ControlToValidate="txtempage" ErrorMessage="Age Should Be Entered" Display="None" ValidationGroup="EmployeeForm"></asp:RequiredFieldValidator>--%>

                            <%--
                            <asp:CompareValidator
                                ID="cvage"
                                runat="server"
                                ControlToValidate="txtempage"
                                ValidationGroup="EmployeeForm"
                                ErrorMessage="Age should be between 18 and 100"
                                Display="None"
                                ValueToCompare="100"
                                Type="Integer"
                                Operator="LessThan"
                            ></asp:CompareValidator>
                            --%>

                          <%--  <asp:RangeValidator
                                ID="rvage"
                                runat="server"
                                ControlToValidate="txtempage"
                                ValidationGroup="EmployeeForm"
                                Display="None"
                                ErrorMessage="Age should be between 18 and 100"
                                MinimumValue="18"
                                MaximumValue="100"
                                Type="Integer"
                            ></asp:RangeValidator>--%>
                        </tr>

                        <tr>
                            <td>Employee Email ID:</td>
                            <td><asp:TextBox ID="txtempmail" runat="server"></asp:TextBox></td>
                           <%-- <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtempmail" ErrorMessage="Email Should Be Entered" Display="None" ValidationGroup="EmployeeForm"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator
                                ID="revemail"
                                runat="server"
                                ValidationGroup="EmployeeForm"
                                ControlToValidate="txtempmail"
                                ErrorMessage="Mail Should Be in proper @ format"
                                Display="None"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                            ></asp:RegularExpressionValidator>--%>
                        </tr>

                        <tr>
                            <td>Employee Password:</td>
                            <td><asp:TextBox ID="txtemppass" runat="server" TextMode="Password"></asp:TextBox></td>
                            <%--<asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="txtemppass" ErrorMessage="Password should be entered" Display="None" ValidationGroup="EmployeeForm"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator
                                ID="revpass"
                                runat="server"
                                ValidationGroup="EmployeeForm"
                                ControlToValidate="txtemppass"
                                ErrorMessage="Password at least 8 to 20 characters  with 1 Upper case 1 lowercase 1 special character"
                                Display="None"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+=\-{}\[\]:;,.?]).{8,20}$"
                            ></asp:RegularExpressionValidator>--%>
                        </tr>

                        <tr>
                            <td>Employee Phone:</td>
                            <td><asp:TextBox ID="txtempphone" runat="server"></asp:TextBox></td>
                           <%-- <asp:RequiredFieldValidator ID="rfvphone" runat="server" ControlToValidate="txtempphone" ErrorMessage="Phone Should Be Entered" Display="None" ValidationGroup="EmployeeForm"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator
                                ID="revphone"
                                runat="server"
                                ValidationGroup="EmployeeForm"
                                ControlToValidate="txtempphone"
                                ErrorMessage="Phone Should be 10 digit number"
                                Display="None"
                                ValidationExpression="^\d{10}$"
                            ></asp:RegularExpressionValidator>--%>
                        </tr>

                        <%--for POPUP--%>

                      <%--  <asp:ValidationSummary ID="popup" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="EmployeeForm" />--%>

                        <tr>
                            <td>Submit:</td>
                           <%-- <td><asp:Button ID="btnsubmit" runat="server" Text="Save" OnClick="btnsubmit_Click" ValidationGroup="EmployeeForm" /></td> --%>
                            <td><asp:Button ID="btnsubmit" runat="server" Text="Save" OnClick="btnsubmit_Click"/></td>
                        </tr>

                        <tr>
                            <td>Search:</td>
                            <td><asp:TextBox ID="txtSearch" runat="server"></asp:TextBox></td>
                            <td><asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click1"/></td>
                        </tr>


                    </table>

                    <h1 style="text-align: center;">Employee Data Table</h1>

                    <div id="gridview">
                        <asp:GridView ID="GridViewEmp" runat="server" AutoGenerateColumns="false" OnRowCommand="GridViewEmp_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="ID_______">
                                    <ItemTemplate>
                                        <%#Eval("emp_id") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name_______">
                                    <ItemTemplate>
                                        <%#Eval("emp_name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Age_______  ">
                                    <ItemTemplate>
                                        <%#Eval("emp_age") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Email ID_______">
                                    <ItemTemplate>
                                        <%#Eval("emp_email") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Password_______">
                                    <ItemTemplate>
                                        <%#Eval("emp_pass") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Phone_______">
                                    <ItemTemplate>
                                        <%#Eval("emp_phone") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="DELETE_______">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lkDelete" runat="server" Text="Delete" CommandArgument='<%#Eval("emp_id") %>' CommandName="remove" OnClientClick="return confirm('Are you Sure ?')"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="EDIT_______">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lkEdit" runat="server" Text="Edit" CommandArgument='<%#Eval("emp_id") %>' CommandName="omit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </center>
            </div>
        </form>
    </body>
</html>
