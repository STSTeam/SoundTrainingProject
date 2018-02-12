<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="STS.WebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="~/Content/banners/banner-01.jpg" alt="Banner 1" style="width: 100%; height: 200px" runat="server">
            </div>

            <div class="item">
                <img src="~/Content/banners/banner-02.jpg" alt="Banner 2" style="width: 100%; height: 200px" runat="server">
            </div>

            <div class="item">
                <img src="~/Content/banners/banner-03.jpg" alt="Banner 3" style="width: 100%; height: 200px" runat="server">
            </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h2>النطق</h2>
            <img src="Images/speak.jpeg" style="width: 400px; height: 200px" />
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">تعلم المزيد  &raquo;</a>
            </p>
        </div>
        <div class="col-md-6">
            <h2>السمع</h2>
            <img src="Images/listen.jpg" style="width: 400px; height: 200px" />
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">تعلم المزيد  &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
