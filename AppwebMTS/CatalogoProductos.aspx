<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CatalogoProductos.aspx.cs" Inherits="AppwebMTS.CatalogoProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="form-group" style="margin-left:200px; margin-top:50px">
        <div class="row">
            <div class="col-lg-5">
               <div class="card text-center">
                <div class="card-header bg-primary bg-white">
                    <h4 class="card-title" style="color:forestgreen">Celulares</h4>
                </div>
                    <img src="www/css/img/Celulares.jpg" height="300" width="300" class="card-img-top" alt="Celulares"/>
                    <div class="card-footer bg-white">
                        <asp:Button Text="Ver Catalogo" runat="server" ID="btnCatologoMoviles" CssClass="btn btn-outline-success" OnClick="btnCatologoMoviles_Click" />
                    </div>
                </div>
            </div>
            <%--Computadoras--%>
             <div class="col-lg-5">
               <div class="card text-center">
                <div class="card-header bg-primary bg-white">
                    <h4 class="card-title" style="color:forestgreen">Computadoras</h4>
                </div>
                    <img src="www/css/img/PC.jpg" height="300" width="300" class="card-img-top" alt="Computadoras"/>
                    <div class="card-footer bg-white">
                        <asp:Button Text="Ver Catalogo" runat="server" ID="btnComputadoras" CssClass="btn btn-outline-success" OnClick="btnComputadoras_Click" />
                    </div>
                </div>
            </div>
            <%--Tablet--%>
            <div class="col-lg-5">
               <div class="card text-center">
                <div class="card-header bg-primary bg-white">
                    <h4 class="card-title" style="color:forestgreen">Tablets</h4>
                </div>
                    <img src="www/css/img/Tablet.jpg" height="300" width="300" class="card-img-top" alt="Tablet"/>
                    <div class="card-footer bg-white">
                        <asp:Button Text="Ver Catalogo" runat="server" ID="btnTablet" CssClass="btn btn-outline-success" OnClick="btnTablet_Click"/>
                    </div>
                </div>
            </div>
            <%--Componentes--%>
             <div class="col-lg-5">
               <div class="card text-center">
                <div class="card-header bg-primary bg-white">
                    <h4 class="card-title" style="color:forestgreen">Componentes</h4>
                </div>
                    <img src="www/css/img/Componentes.jpg" height="300" width="300" class="card-img-top" alt="Tablet"/>
                    <div class="card-footer bg-white">
                        <asp:Button Text="Ver Catalogo" runat="server" ID="btnComponentes" CssClass="btn btn-outline-success" OnClick="btnComponentes_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
