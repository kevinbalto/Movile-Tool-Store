<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="AppwebMTS.Factura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container col-lg-10 ml-5">
        <div class="justify-content-center text-center ml-5">
            <div class="card mt-5 mb-5">
                <div class="card-header">
                    <div class="form-group">
                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <h4 class="card-title text-center letraTitulos">Pago y facturación</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Fecha:" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblFecha"
                                    CssClass="form-control" runat="server" MaxLength="80" TextMode="Date" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Nombre cliente:" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" Enabled="false" />
                            </div>                           
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Número de tarjeta:" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtNumeroTarjeta"
                                    CssClass="form-control" runat="server" MaxLength="80" type="number"/>                              
                            </div> 
                            <%--<div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtNumeroTarjeta"
                                    ErrorMessage="El código de barra es requerido."
                                    ControlToValidate="txtNumeroTarjeta" runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Fecha de caducidad:" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtFechaCaducidad"
                                    CssClass="form-control" runat="server" MaxLength="80" type="date"/>                              
                            </div>    
                            <%--<div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtFechaCaducidad"
                                    ErrorMessage="La fecha de caducidad de la tarjeta es requerida."
                                    ControlToValidate="txtFechaCaducidad" runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Código de seguridad:" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtCodigoSeguridad"
                                    CssClass="form-control" runat="server" MaxLength="3" type="password" min="000" max="999"/>                              
                            </div> 
                            <%--<div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredCodigoSeguidad"
                                    ErrorMessage="El código de seguridad es requerido."
                                    ControlToValidate="txtFechaCaducidad" runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>--%>
                        </div>
                    </div>
                    <h5 class="card-title text-left ml-5">Lista de compra</h5>
                    <asp:GridView ID="dtsListaCompra" runat="server" AutoGenerateColumns="false"
                        CssClass="table table-responsive-lg GridView" AllowPaging="True" Enabled="true">
                        <Columns>
                            <asp:BoundField DataField="codigoBarra"
                                HeaderText="Código Barras"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                            <asp:BoundField DataField="nombre" HeaderText="Nombre"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                            <asp:BoundField DataField="precio" HeaderText="Precio"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                            <asp:BoundField DataField="subtotal" HeaderText="Subtotal"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <%--terminar de cargar--%>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Total₡: " runat="server" Style="color: black" />
                            </div>
                            <div class="col-md-4">
                                <asp:Label runat="server" ID="lblTotal" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <asp:Button ID="btnCancelar" Text="Cancelar Compra" CssClass="btn btn-danger" runat="server" OnClick="btnCancelar_Click"/>
                            </div>
                            <div class="col-md-6 text-center">
                                <asp:Button ID="btnFinalizar" Text="Finalizar Compra" CssClass="btn btn-info" runat="server" OnClick="btnFinalizar_Click"/>
                            </div>
                        </div>
                    </div>                  
                </div>
            </div>
        </div>
    </div>
</asp:Content>
