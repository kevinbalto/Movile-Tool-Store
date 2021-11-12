<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompraFinalizada.aspx.cs" Inherits="AppwebMTS.CompraFinalizada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-md-6 col-lg-6 col-xl-6 text-center div-radius loginContainer" >
        <div class="justify-content-center text-center">
            <%--Form content--%>
            <%--Title form holder--%>
            <div class="form-group mt-4">
				<div class="row">
                    <div class="col-md-12">
                       <h1 class="letraTitulos" >¡Gracias por su compra!</h1> 
                    </div>
				</div>
			</div>
            <div class="form-group ">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button id="btnInicio" CssClass="btn btn-outline-success" Text="Ir a página de inicio" runat="server" OnClick="btnInicio_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
