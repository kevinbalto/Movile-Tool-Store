<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModuloMarcas.aspx.cs" Inherits="AppwebMTS.Marcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


       <div class="container text-center ContenidoTexto">
        <div class="justify-content-center text-center">
            <div class="form-group mt-4">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="letraTitulos">Registro de Marca</h1>
                    </div>
                </div>
            </div>
             <%--Código de Marca--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Código de marca:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtCodigoMarca"
                            CssClass="form-control" runat="server" MaxLength="80" 
                            AutoPostBack="true" OnTextChanged="txtCodigoMarca_TextChanged"/>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtCodigoMarca"
                            ErrorMessage="El código de la marca es requerida."
                            ControlToValidate="txtCodigoMarca" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                    <%--aqui van los validator--%>
                </div>
            </div>
            <%-- Nombre de la marca.--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Nombre de marca:" runat="server" />
                    </div>

                    <div class="col-md-8">
                        <asp:TextBox ID="txtNombreMarca"
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>

                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtNombre"
                            ErrorMessage="El nombre de la marca es requerida."
                            ControlToValidate="txtNombreMarca" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>

                </div>
            </div>
           
            <%--País de origen--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="País de origen:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtPaisOrigen"
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>

                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtPaisOrigen"
                            ErrorMessage="El pais de origen es requerido."
                            ControlToValidate="txtPaisOrigen" runat="server"

                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <%--correo--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Correo electrónico:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtCorreoMarca"
                            CssClass="form-control" runat="server" placeholder="example@domain.com" MaxLength="80" />
                    </div>

                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtCorreoMarca"
                            ErrorMessage="El correo electrónico es requerido."
                            ControlToValidate="txtCorreoMarca" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--contacto--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Contacto:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtContactoMarca"
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>

                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtContactoMarca"
                            ErrorMessage="El contacto de la marca es requerido."
                            ControlToValidate="txtContactoMarca" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--telefono--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Teléfono:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtTelefonoMarca"
                            CssClass="form-control" runat="server" placeholder="####-####" MaxLength="80" />
                    </div>

                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtTelefono"
                            ErrorMessage="El telefono de la marca es requerido."
                            ControlToValidate="txtTelefonoMarca" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12 text-left">
                    <asp:ValidationSummary ID="validaciones" runat="server"
                        DisplayMode="BulletList" HeaderText="Datos requeridos"
                        Front-Names="verdana" Font-Size="12" ForeColor="Red" />
                </div>
            </div>

            <%--Botones--%>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnRegistrarMarca" Text="Registrar" CssClass="btn btn-outline-success" runat="server" OnClick="btnRegistrarMarca_Click" />

                    <%--<asp:Button ID="btnBuscarMacar" Text="Buscar" CssClass="btn btn-outline-success" runat="server" OnClick="btnBuscarMacar_Click" />--%>

                    <asp:Button ID="btnModificarMarca" Text="Modificar" CssClass="btn btn-outline-success" runat="server"  OnClick="btnModificarMarca_Click"/>

                    <asp:Button ID="btnEliminarMarca" Text="Eliminar" CssClass="btn btn-outline-success" runat="server" OnClick="btnEliminarMarca_Click"/>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
