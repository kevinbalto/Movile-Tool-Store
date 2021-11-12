<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaCompra.aspx.cs" Inherits="AppwebMTS.ListaCompra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container text-center">
            <h1 class="letraTitulos mt-3" style="font-size: 9vh">Lista de compras</h1>
        </div>
        <div class="text-center">
            <asp:GridView ID="dtsListaCompra" runat="server" AutoGenerateColumns="False" DataKeyNames="id" HeaderStyle-BackColor="#40b01c" HeaderStyle-ForeColor="White"
                CssClass="table table-responsive-lg GridView" AllowPaging="True" PageSize="5" OnRowDeleting="dtsListaCompra_RowDeleting" OnRowEditing="dtsListaCompra_RowEditing"
                OnRowCancelingEdit="dtsListaCompra_RowCancelingEdit" OnRowUpdating="dtsListaCompra_RowUpdating" OnPageIndexChanging="dtsListaCompra_PageIndexChanging" 
                enableEventValidation="true">
                <Columns>
                    <asp:BoundField DataField="codigoBarra" HeaderText="Código de Barras"
                        HeaderStyle-CssClass="ContenidoTexto">
                        <HeaderStyle CssClass="ContenidoTexto"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre de producto"
                        HeaderStyle-CssClass="ContenidoTexto">
                        <HeaderStyle CssClass="ContenidoTexto"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" 
                        HeaderStyle-CssClass="ContenidoTexto">
                        <HeaderStyle CssClass="ContenidoTexto"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="precio" HeaderText="Precio"
                        HeaderStyle-CssClass="ContenidoTexto">
                        <HeaderStyle CssClass="ContenidoTexto"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="subtotal" HeaderText="Subtotal"
                        HeaderStyle-CssClass="ContenidoTexto">
                        <HeaderStyle CssClass="ContenidoTexto"></HeaderStyle>
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" 
                        ControlStyle-CssClass="btn btn-danger" HeaderStyle-CssClass="ContenidoTexto"/>
                    <asp:CommandField ShowEditButton="true" 
                        ControlStyle-CssClass="btn btn-info" HeaderStyle-CssClass="ContenidoTexto"/>
                </Columns>
            </asp:GridView>
        </div>
        <div class="text-center">
            <div class="form-group text-center">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label Text="Total:₡ " runat="server" Style="color: black" />
                        <asp:Label id="lblTotal" class="text-right" runat="server"/>
                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <asp:Button ID="btnGenerarCarrito" Text="Generar lista" CssClass="btn btn-info" runat="server" OnClick="btnGenerarCarrito_Click"/>
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="btnContinuar" Text="Continuar" CssClass="btn btn-info" runat="server" OnClick="btnContinuar_Click" Visible="false"/>
                    </div>
                    <div class="col-md-4    ">
                        <asp:Button ID="btnCancelar" Text="Cancelar" CssClass="btn btn-danger" runat="server" OnClick="btnCancelar_Click" Visible="false"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
