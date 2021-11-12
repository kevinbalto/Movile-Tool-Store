<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppwebMTS.Login" %>
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
                       <h1 class="letraTitulos" >Iniciar Sesión</h1> 
                    </div>
				</div>
			</div>

            <%--Incoming name data form--%>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label Text="Usuario" runat="server" style="color:white"/>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtUsuario" CssClass="form-control" MaxLenght="80" runat="server" placeholder="Correo Electrónico" />  
                    </div>
                   <%-- <div class="col-md-1"> 
                        <asp:RequiredFieldValidator id="requiredTxtUsuario" ErrorMessage="El usuario es un campo requerido" ControlToValidate="txtUsuario" ForeColor="Red" runat="server">*</asp:RequiredFieldValidator>
                    </div>--%>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <asp:Label Text="Contraseña" runat="server" style="color:white"/>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox id="txtContrasena" Type="password" CssClass="form-control" MaxLenght="80" runat="server" placeholder="Contraseña"/>  
                    </div>
                    <%--<div class="col-md-1"> 
                        <asp:RequiredFieldValidator id="requiredTxtContrasena" ErrorMessage="La contraseña es un campo requerido" ControlToValidate="txtContrasena" ForeColor="Red" runat="server">*</asp:RequiredFieldValidator>
                    </div>--%>
                </div>
            </div>

            <%--Holder to show validation messages in required fields--%>
            <%--<div class="form-group">
                <div class="row">
                    <div class="col-md-12 text-left">
                        <asp:ValidationSummary id="validaciones" ForeColor="red" DisplayMode="BulletList" HeaderText="Datos requeridos" Font-Names="verdana" Font-Size="12" runat="server" />
                    </div>
                </div>
            </div>--%>

            <%--Button holder--%>
             <div class="form-group ">
                <div class="row">
                    <div class="col-md-12">
                        <h5 class="tamannoLetraNav">¿No tienes cuenta?</h5>
                        <a href="ModuloUsuarios.aspx">Registrarse</a>
                    </div>
                </div>
            </div>
            <div class="form-group ">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button id="btnIngresar" CssClass="btn btn-outline-success" Text="Ingresar" runat="server" OnClick="btnIngresar_Click"/>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
