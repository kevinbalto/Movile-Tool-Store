<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModuloUsuarios.aspx.cs" Inherits="AppwebMTS.RegistroUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container text-center ContenidoTexto">
		<div class="justify-content-center text-center">
			 <div class="form-group mt-4">
				<div class="row">
                    <div class="col-md-12">
                       <h1 class="letraTitulos">Registro  de Usuario</h1> 
                    </div>
				</div>
			</div>
			 <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Correo electrónico:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtCorreoElectronico" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
					<div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtCorreoElectronico"
                            ErrorMessage="El correo es requerido."
                            ControlToValidate="txtCorreoElectronico" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>
              <%-- Nombre del cliente.--%>
			<div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Nombre completo:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtNombreCompleto" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
					<div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtNombre"
                            ErrorMessage="El nombre es requerido."
                            ControlToValidate="txtNombreCompleto" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>
           <%--fecha de nacimiento--%>
			<div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Fecha nacimiento:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtFechaNacimiento" 
                            CssClass="form-control" runat="server" MaxLength="80" TextMode="Date" />
                    </div>
					<div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredFechaNacimiento"
                            ErrorMessage="La fecha de nacimiento es requerida."
                            ControlToValidate="txtFechaNacimiento" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>
			 <%--direccion--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Dirección:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtDireccion" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
					<div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requieredTxtDireccion"
                            ErrorMessage="La dirección es requerida."
                            ControlToValidate="txtDireccion" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>

			 <%--contraseña--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Contraseña:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtContrasenna" 
                            CssClass="form-control"  type="password" runat="server" MaxLength="80" />
                    </div>
					<div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtContrasenna"
                            ErrorMessage="La contraseña es requerida."
                            ControlToValidate="txtContrasenna" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>
            <%--confirmacion de contraseña--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Confirmación de contraseña:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtConfirmarContrasenna" 
                            CssClass="form-control" runat="server" type="password" MaxLength="80" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtConfirmarContrasenna"
                            ErrorMessage="La confirmación de contraseña es requerida."
                            ControlToValidate="txtConfirmarContrasenna" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
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
			 </div>
              <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="btnRegistrarUsuario" Text="Registrar" CssClass="btn btn-outline-success" runat="server" OnClick="btnRegistrarUsuario_Click"/>
                    </div>
                </div>
             </div>
	</div>
</asp:Content>
