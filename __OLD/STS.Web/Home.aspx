<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <style type="text/css">
            .auto-style4 {
                width: 1182px;
                margin-right: 131px;
            }

            .auto-style5 {
                width: 594px;
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <table class="auto-style4">
            <tr style="width=1100px">
                <h2 style="font-size: 75px; font-weight: bold; text-align: center;">مرحبااهلا بكم</h2>
            </tr>
            <tr style="width=1100px;">
                <center>
            <img src ="Images/logo.png" />
                  </center>
            </tr>



            <tr style="width=1100px">



                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/hearing button.png" ImageAlign="Left" />




                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/hearingbutton.png" ImageAlign="Right" />



            </tr>
        </table>
    </asp:Content>
