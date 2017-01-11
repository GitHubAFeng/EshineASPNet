﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs"  Theme="Default" Inherits="Admin_CustomersAdmin_CustomerInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <script>
         function ShowHidden(sid, ev) {
             ev = ev || window.event;
             var target = ev.target || ev.srcElement;
             var oDiv = document.getElementById("div" + sid);
             oDiv.style.display = oDiv.style.display == "none" ? "block" : "none";
             target.src = oDiv.style.display == "none" ? "../../Images/plus.png" : "../../Images/minus.png";
         }
 </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td class="title" colspan="5">
                    员工信息</td>
            </tr>
        </table>
        <br>
        <table border="0" cellpadding="0" cellspacing="0" class="adminContent" style="width: 100%">
                    <tr>
                        <td align="center" style="width: 100px; height: 24px; text-align:right;">
                            <asp:FileUpload ID="FileUpload1" runat="server" ToolTip="选择.xls文件" Width="200px" /></td>
                        <td style="width: 22px; height: 24px; text-align:left;">
                            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="上传Excel文件" ToolTip="" /> </td>
                        <td align="center" style="width: 50px; height: 24px;">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" style="margin-left:5px;"
                                onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
                            </asp:DropDownList>

                            </td>
                        <td style="width: 100px; height: 24px; text-align:right;">
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Width="175px" style="margin-left:5px;"></asp:TextBox></td>
                        
                        <td style="width: 100px; height: 24px; text-align:left;">
                            <asp:Button ID="Button2" runat="server" CssClass="button" Text="搜　索" OnClick="Button2_Click" /></td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Visible="false">
                                <asp:ListItem>--搜索任意状态的公司员工--</asp:ListItem>
                                <asp:ListItem>待付款</asp:ListItem>
                                <asp:ListItem>待确认</asp:ListItem>
                                <asp:ListItem>待转账</asp:ListItem>
                                <asp:ListItem>付款完成</asp:ListItem>
                                <asp:ListItem>已取消</asp:ListItem>
                                <asp:ListItem>已完成</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td  >
                            <asp:Button ID="ButtonEE" runat="server" Text="导出excel" 
                                onclick="ButtonEE_Click"  />
                            <asp:Button ID="Button1" runat="server" Text="批量操作" OnClick="Button1_Click" />
                            <asp:Label ID="Label1" runat="server" Text="错误信息" Visible="false"></asp:Label>
                            </td>
                    </tr>
                    
                </table>
                <table border="0" cellpadding="0" cellspacing="0" class="adminContent" style="width: 100%">
                <tr>
                <td align="center">
                    &nbsp;<asp:SqlDataSource 
                        ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ConnectionString %>"
                        
                        SelectCommand="SELECT * FROM [tab_customers]" 
                        ConflictDetection="CompareAllValues" 
                        DeleteCommand="DELETE FROM [tab_customers] WHERE [customerID] = @original_customerID " 
                        InsertCommand="INSERT INTO [tab_customers] ([customerCode], [customerName], [customerEmail], [customerPrivateEmail], [customerMobile], [customerTel], [customerProvince], [customerCity], [customerAddress], [customerGender], [customerMarriageStatus], [customerDOB], [customerNation], [customerIDcard], [customerCompany], [customerClass], [customerCompanyTel], [customerCompanyProvince], [customerCompanyCity], [customerCompanyAddress], [customerVIP], [customerBalance], [customerLastLogin], [customerLastPWChanged]) VALUES (@customerCode, @customerName, @customerEmail, @customerPrivateEmail, @customerMobile, @customerTel, @customerProvince, @customerCity, @customerAddress, @customerGender, @customerMarriageStatus, @customerDOB, @customerNation, @customerIDcard, @customerCompany, @customerClass, @customerCompanyTel, @customerCompanyProvince, @customerCompanyCity, @customerCompanyAddress, @customerVIP, @customerBalance, @customerLastLogin, @customerLastPWChanged)" 
                        OldValuesParameterFormatString="original_{0}" 
                        UpdateCommand="UPDATE [tab_customers] SET [customerCode] = @customerCode, [customerName] = @customerName, [customerEmail] = @customerEmail, [customerPrivateEmail] = @customerPrivateEmail, [customerMobile] = @customerMobile, [customerTel] = @customerTel, [customerProvince] = @customerProvince, [customerCity] = @customerCity, [customerAddress] = @customerAddress, [customerGender] = @customerGender, [customerMarriageStatus] = @customerMarriageStatus, [customerDOB] = @customerDOB, [customerNation] = @customerNation, [customerIDcard] = @customerIDcard, [customerCompany] = @customerCompany, [customerClass] = @customerClass, [customerCompanyTel] = @customerCompanyTel, [customerCompanyProvince] = @customerCompanyProvince, [customerCompanyCity] = @customerCompanyCity, [customerCompanyAddress] = @customerCompanyAddress, [customerVIP] = @customerVIP, [customerBalance] = @customerBalance, [customerLastLogin] = @customerLastLogin, [customerLastPWChanged] = @customerLastPWChanged WHERE [customerID] = @original_customerID AND [customerCode] = @original_customerCode AND (([customerName] = @original_customerName) OR ([customerName] IS NULL AND @original_customerName IS NULL)) AND (([customerEmail] = @original_customerEmail) OR ([customerEmail] IS NULL AND @original_customerEmail IS NULL)) AND (([customerPrivateEmail] = @original_customerPrivateEmail) OR ([customerPrivateEmail] IS NULL AND @original_customerPrivateEmail IS NULL)) AND (([customerMobile] = @original_customerMobile) OR ([customerMobile] IS NULL AND @original_customerMobile IS NULL)) AND (([customerTel] = @original_customerTel) OR ([customerTel] IS NULL AND @original_customerTel IS NULL)) AND (([customerProvince] = @original_customerProvince) OR ([customerProvince] IS NULL AND @original_customerProvince IS NULL)) AND (([customerCity] = @original_customerCity) OR ([customerCity] IS NULL AND @original_customerCity IS NULL)) AND (([customerAddress] = @original_customerAddress) OR ([customerAddress] IS NULL AND @original_customerAddress IS NULL)) AND (([customerGender] = @original_customerGender) OR ([customerGender] IS NULL AND @original_customerGender IS NULL)) AND (([customerMarriageStatus] = @original_customerMarriageStatus) OR ([customerMarriageStatus] IS NULL AND @original_customerMarriageStatus IS NULL)) AND (([customerDOB] = @original_customerDOB) OR ([customerDOB] IS NULL AND @original_customerDOB IS NULL)) AND (([customerNation] = @original_customerNation) OR ([customerNation] IS NULL AND @original_customerNation IS NULL)) AND (([customerIDcard] = @original_customerIDcard) OR ([customerIDcard] IS NULL AND @original_customerIDcard IS NULL)) AND [customerCompany] = @original_customerCompany AND (([customerClass] = @original_customerClass) OR ([customerClass] IS NULL AND @original_customerClass IS NULL)) AND (([customerCompanyTel] = @original_customerCompanyTel) OR ([customerCompanyTel] IS NULL AND @original_customerCompanyTel IS NULL)) AND (([customerCompanyProvince] = @original_customerCompanyProvince) OR ([customerCompanyProvince] IS NULL AND @original_customerCompanyProvince IS NULL)) AND (([customerCompanyCity] = @original_customerCompanyCity) OR ([customerCompanyCity] IS NULL AND @original_customerCompanyCity IS NULL)) AND (([customerCompanyAddress] = @original_customerCompanyAddress) OR ([customerCompanyAddress] IS NULL AND @original_customerCompanyAddress IS NULL)) AND (([customerVIP] = @original_customerVIP) OR ([customerVIP] IS NULL AND @original_customerVIP IS NULL)) AND (([customerBalance] = @original_customerBalance) OR ([customerBalance] IS NULL AND @original_customerBalance IS NULL)) AND (([customerLastLogin] = @original_customerLastLogin) OR ([customerLastLogin] IS NULL AND @original_customerLastLogin IS NULL)) AND (([customerLastPWChanged] = @original_customerLastPWChanged) OR ([customerLastPWChanged] IS NULL AND @original_customerLastPWChanged IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_customerID" Type="Int32" />
                           
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="customerCode" Type="String" />
                            <asp:Parameter Name="customerName" Type="String" />
                            <asp:Parameter Name="customerEmail" Type="String" />
                            <asp:Parameter Name="customerPrivateEmail" Type="String" />
                            <asp:Parameter Name="customerMobile" Type="String" />
                            <asp:Parameter Name="customerTel" Type="String" />
                            <asp:Parameter Name="customerProvince" Type="String" />
                            <asp:Parameter Name="customerCity" Type="String" />
                            <asp:Parameter Name="customerAddress" Type="String" />
                            <asp:Parameter Name="customerGender" Type="String" />
                            <asp:Parameter Name="customerMarriageStatus" Type="String" />
                            <asp:Parameter DbType="Date" Name="customerDOB" />
                            <asp:Parameter Name="customerNation" Type="String" />
                            <asp:Parameter Name="customerIDcard" Type="String" />
                            <asp:Parameter Name="customerCompany" Type="String" />
                            <asp:Parameter Name="customerClass" Type="String" />
                            <asp:Parameter Name="customerCompanyTel" Type="String" />
                            <asp:Parameter Name="customerCompanyProvince" Type="String" />
                            <asp:Parameter Name="customerCompanyCity" Type="String" />
                            <asp:Parameter Name="customerCompanyAddress" Type="String" />
                            <asp:Parameter Name="customerVIP" Type="String" />
                            <asp:Parameter Name="customerBalance" Type="Decimal" />
                            <asp:Parameter Name="customerLastLogin" Type="DateTime" />
                            <asp:Parameter DbType="Date" Name="customerLastPWChanged" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="customerCode" Type="String" />
                            <asp:Parameter Name="customerName" Type="String" />
                            <asp:Parameter Name="customerEmail" Type="String" />
                            <asp:Parameter Name="customerPrivateEmail" Type="String" />
                            <asp:Parameter Name="customerMobile" Type="String" />
                            <asp:Parameter Name="customerTel" Type="String" />
                            <asp:Parameter Name="customerProvince" Type="String" />
                            <asp:Parameter Name="customerCity" Type="String" />
                            <asp:Parameter Name="customerAddress" Type="String" />
                            <asp:Parameter Name="customerGender" Type="String" />
                            <asp:Parameter Name="customerMarriageStatus" Type="String" />
                            <asp:Parameter DbType="Date" Name="customerDOB" />
                            <asp:Parameter Name="customerNation" Type="String" />
                            <asp:Parameter Name="customerIDcard" Type="String" />
                            <asp:Parameter Name="customerCompany" Type="String" />
                            <asp:Parameter Name="customerClass" Type="String" />
                            <asp:Parameter Name="customerCompanyTel" Type="String" />
                            <asp:Parameter Name="customerCompanyProvince" Type="String" />
                            <asp:Parameter Name="customerCompanyCity" Type="String" />
                            <asp:Parameter Name="customerCompanyAddress" Type="String" />
                            <asp:Parameter Name="customerVIP" Type="String" />
                            <asp:Parameter Name="customerBalance" Type="Decimal" />
                            <asp:Parameter Name="customerLastLogin" Type="DateTime" />
                            <asp:Parameter DbType="Date" Name="customerLastPWChanged" />
                            <asp:Parameter Name="original_customerID" Type="Int32" />
                            <asp:Parameter Name="original_customerCode" Type="String" />
                            <asp:Parameter Name="original_customerName" Type="String" />
                            <asp:Parameter Name="original_customerEmail" Type="String" />
                            <asp:Parameter Name="original_customerPrivateEmail" Type="String" />
                            <asp:Parameter Name="original_customerMobile" Type="String" />
                            <asp:Parameter Name="original_customerTel" Type="String" />
                            <asp:Parameter Name="original_customerProvince" Type="String" />
                            <asp:Parameter Name="original_customerCity" Type="String" />
                            <asp:Parameter Name="original_customerAddress" Type="String" />
                            <asp:Parameter Name="original_customerGender" Type="String" />
                            <asp:Parameter Name="original_customerMarriageStatus" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_customerDOB" />
                            <asp:Parameter Name="original_customerNation" Type="String" />
                            <asp:Parameter Name="original_customerIDcard" Type="String" />
                            <asp:Parameter Name="original_customerCompany" Type="String" />
                            <asp:Parameter Name="original_customerClass" Type="String" />
                            <asp:Parameter Name="original_customerCompanyTel" Type="String" />
                            <asp:Parameter Name="original_customerCompanyProvince" Type="String" />
                            <asp:Parameter Name="original_customerCompanyCity" Type="String" />
                            <asp:Parameter Name="original_customerCompanyAddress" Type="String" />
                            <asp:Parameter Name="original_customerVIP" Type="String" />
                            <asp:Parameter Name="original_customerBalance" Type="Decimal" />
                            <asp:Parameter Name="original_customerLastLogin" Type="DateTime" />
                            <asp:Parameter DbType="Date" Name="original_customerLastPWChanged" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                
                </td>
                </tr>
                </table>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  PageSize="20"  PagerSettings-Mode="NumericFirstLast" PagerSettings-PageButtonCount="50"
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%"  OnRowDataBound="GridView1_RowCommand"
            AllowSorting="True" DataKeyNames="customerID">
                        <Columns>
                            <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                         <asp:TemplateField>
                                    <ItemTemplate>
                                        <div id="btnShowHidden<%#Eval("customerID") %>" style="cursor: pointer;" onclick="ShowHidden('<%#Eval("customerID") %>',event)">
                                            <img src="../../Images/plus.png" />
                                        </div> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:HyperLinkField DataTextField="customerCode" HeaderText="客户号"  SortExpression="customerCode" 
                            DataNavigateUrlFields="customerID" DataNavigateUrlFormatString="customersUpdate.aspx?Cid={0}"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerName" HeaderText="姓名" 
                                SortExpression="customerName"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerEmail" HeaderText="公司邮箱" 
                                SortExpression="customerEmail"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerPrivateEmail" HeaderText="私人邮箱" 
                                SortExpression="customerPrivateEmail"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerMobile" HeaderText="手机" 
                                SortExpression="customerMobile"  ItemStyle-Wrap="False" />
                            <%--<asp:BoundField DataField="customerTel" HeaderText="电话" 
                                SortExpression="customerTel"  ItemStyle-Wrap="False" />--%>
                            <asp:BoundField DataField="customerProvince" HeaderText="省份" 
                                SortExpression="customerProvince"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerCity" HeaderText="城市" 
                                SortExpression="customerCity"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerAddress" HeaderText="详细地址" 
                                SortExpression="customerAddress"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerGender" HeaderText="性别" 
                                SortExpression="customerGender"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerMarriageStatus"  HeaderText="婚姻状况" 
                                SortExpression="customerMarriageStatus"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerDOB" HeaderText="出生日期" 
                                SortExpression="customerDOB"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerNation" HeaderText="国籍" 
                                SortExpression="customerNation"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerIDcard" HeaderText="身份证号码" 
                                SortExpression="customerIDcard"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerCompany" HeaderText="公司名称" 
                                SortExpression="customerCompany"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerClass" HeaderText="员工类型" 
                                SortExpression="customerClass"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerCompanyTel" HeaderText="公司电话" 
                                SortExpression="customerCompanyTel"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerCompanyProvince" HeaderText="公司省份"
                                SortExpression="customerCompanyProvince"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerCompanyCity" HeaderText="公司城市"
                                SortExpression="customerCompanyCity"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerCompanyAddress" HeaderText="公司地址"
                                SortExpression="customerCompanyAddress"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerVIP" HeaderText="VIP属性" 
                                SortExpression="customerVIP"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerBudget" HeaderText="预算" 
                                SortExpression="customerBudget"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerLastLogin" HeaderText="最后登录" 
                                SortExpression="customerLastLogin"  ItemStyle-Wrap="False" />
                            <asp:BoundField DataField="customerLastPWChanged" HeaderText="最后修改密码"
                                SortExpression="customerLastPWChanged"  ItemStyle-Wrap="False" />
                    <asp:BoundField DataField="customerID" HeaderText="ID" 
                                SortExpression="customerID"  ItemStyle-Wrap="False" />

                             <asp:TemplateField HeaderText="  " ItemStyle-Wrap="false">
                                <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="D" OnClientClick="return confirm('确定要删除吗？');"></asp:LinkButton>
                                </ItemTemplate>

<ItemStyle Wrap="False"></ItemStyle>
                            </asp:TemplateField>

                    <asp:TemplateField>  
                                    <ItemTemplate>
                                        <tr>
                                            <td colspan="100%" align="left" style="border: none;">
                                            <div id="div<%#Eval("customerID") %>" style="display: none;" position: relative;
                                                    left: 15px; overflow: auto; width: 100%">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td  width="20" height="150" rowspan="2">
                                                        </td>
                                                        <td align="left" valign="top">
                                                            <asp:Panel ID="Panel1" runat="server" Height="150" ScrollBars="Vertical" HorizontalAlign="Left">
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID">
     <Columns>
         <asp:HyperLinkField DataNavigateUrlFields="orderID" DataNavigateUrlFormatString="~\Admin\ordersAdmin\orderDet.aspx?Cid={0}"  SortExpression="orderID" HeaderStyle-Wrap="false"
                   ItemStyle-Wrap="False" InsertVisible="False"  DataTextField="orderID" HeaderText="订单号" />
         <asp:BoundField DataField="orderDate" HeaderText="下单日期" SortExpression="orderDate"  ItemStyle-Wrap="False" />
         <asp:BoundField DataField="examDate" HeaderText="体检日期" SortExpression="orderStatus"  ItemStyle-Wrap="False" />
         <asp:BoundField DataField="orderStatus" HeaderText="订单状态" ItemStyle-Wrap="False" />
         <asp:BoundField DataField="examCity" HeaderText="体检城市" ItemStyle-Wrap="False" />
<asp:BoundField DataField="examSupplier" HeaderText="体检中心" ItemStyle-Wrap="False" />
<asp:BoundField DataField="examBranch" HeaderText="分店" ItemStyle-Wrap="False" />
<asp:BoundField DataField="examPackage" HeaderText="套餐" ItemStyle-Wrap="False" />
<asp:BoundField DataField="examUpPkg" HeaderText="加项包" ItemStyle-Wrap="False" />
<asp:BoundField DataField="examBill" HeaderText="自付费金额" ItemStyle-Wrap="False" />
<asp:BoundField DataField="examInfo" HeaderText="备注" ItemStyle-Wrap="False" />
     </Columns>
     <HeaderStyle Wrap="False"  />
                                                </asp:GridView>
<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID">
     <Columns>
         <asp:BoundField DataField="orderID" HeaderText="订单号" InsertVisible="False" ReadOnly="True" SortExpression="orderID"  ItemStyle-Wrap="False" />
         <asp:BoundField DataField="orderDate" HeaderText="下单日期" SortExpression="orderDate"  ItemStyle-Wrap="False" />
         <asp:BoundField DataField="ReportContent" HeaderText="购买商品" SortExpression="ReportContent"  ItemStyle-Wrap="False" />
         <asp:BoundField DataField="examBill" HeaderText="金额" ItemStyle-Wrap="False" />
         <asp:BoundField DataField="orderStatus" HeaderText="订单状态" ItemStyle-Wrap="False" />
     </Columns>
     <HeaderStyle Wrap="False"  />
                                                </asp:GridView>
                                                            </asp:Panel>
                    
                                                        </td>
                                                    </tr>
                                                </table>
                                                    
       
                                               
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Wrap="False"  />
                    </asp:GridView>

    </div>
    
    
    </form>
</body>
</html>
