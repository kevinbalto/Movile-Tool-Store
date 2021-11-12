<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioComentario.aspx.cs" Inherits="AppwebMTS.FormularioComentario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container col-md-6 col-lg-6 col-xl-6 text-center div-radius loginContainer">
        <div class="justify-content-center text-center">
            <div class="form-group mt-4">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="letraTitulos">Contacta con nosotros.</h1>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label Text="Nombre Completo:" runat="server" Style="color: green" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtNombre" CssClass="form-control" MaxLenght="80" runat="server" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtNombre"
                            ErrorMessage="El nombre es requerido."
                            ControlToValidate="txtNombre" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label Text="Teléfono:" runat="server" Style="color: green" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtTelefono" CssClass="form-control" MaxLenght="15" TextMode="Number" runat="server" placeholder="####-####" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="txtRequiredTxtNumero"
                            ErrorMessage="El número es requerido."
                            ControlToValidate="txtTelefono" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label Text="Correo electrónico:" runat="server" Style="color: green" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtCorreo" CssClass="form-control" MaxLenght="100" TextMode="Email" runat="server" placeholder="correo@domain.com" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="txtRequiredTxtCorreo"
                            ErrorMessage="El correo electrónico es requerido."
                            ControlToValidate="txtCorreo" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label Text="Comentario:" runat="server" Style="color: green" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtComentario" CssClass="form-control" MaxLenght="199" TextMode="MultiLine" runat="server"
                            placeholder="Se recomienta que el comentario sea de un máximo de 200 caracteres." />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredTxtComentario"
                            ErrorMessage="El correo electrónico es requerido."
                            ControlToValidate="txtComentario" runat="server"
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
            <div class="form-group ">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="btnEnviarComentario" CssClass="btn btn-outline-success" Text="Enviar Comentario" runat="server" OnClick="btnEnviarComentario_Click"/>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
