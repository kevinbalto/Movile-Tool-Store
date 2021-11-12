<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppwebMTS.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <h1 class="letraTitulos mt-3">Ofertas especiales</h1>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title text-center" style="color:forestgreen">Tablets</h5>
                    <img src="www/css/img/Oferta.jpg" class="card-img-top"  height="300" width="300">
                    <div class="card-body">
                        <h5 class="card-title text-center">Obtenga hasta un 20% de descuento</h5>
                        <p class="card-text"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title text-center" style="color:forestgreen">Procesador</h5>
                    <img src="www/css/img/Oferta2.jpg" class="card-img-top " alt="..." height="300" width="300">
                    <div class="card-body">
                        <h5 class="card-title">Obtenga hasta un 15% de descuento</h5>
                        <p class="card-text"></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title text-center" style="color:forestgreen">Celulares</h5>
                    <img src="www/css/img/Oferta3.jpg" class="card-img-top" alt="..." height="300" width="300">
                    <div class="card-body">
                       <h5 class="card-title">Obtenga hasta un 25% de descuento</h5>
                        <p class="card-text"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container p-5 text-center">
        <div class="row align-items-center">
            <div class="col-md-6">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="www/css/img/acer.png" class="d-block w-100" alt="..." height="300" width="300">
                        </div>
                        <div class="carousel-item">
                            <img src="www/css/img/Amazon.jpg" class="d-block w-100" alt="..." height="300" width="300">
                        </div>
                        <div class="carousel-item">
                            <img src="www/css/img/hp.jpg" class="d-block w-100" alt="..." height="300" width="300" >
                        </div>
                        <div class="carousel-item">
                            <img src="www/css/img/nvidia.png" class="d-block w-100" alt="..." height="300" width="300">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <h3 style="color:forestgreen">Nuestras Marcas</h3>
            </div>
        </div>
    </div>
</asp:Content>
