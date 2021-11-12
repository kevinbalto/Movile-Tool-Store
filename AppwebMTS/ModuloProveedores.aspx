<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModuloProveedores.aspx.cs" Inherits="AppwebMTS.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center ContenidoTexto">
		<div class="justify-content-center text-center">
			 <div class="form-group mt-4">
				<div class="row">
                    <div class="col-md-12">
                       <h1 class="letraTitulos">Registro  de proveedores</h1> 
                    </div>
				</div>
			</div>

            <%--cedula legal--%>
			<div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Código legal:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtCedulaLegal" 
                            CssClass="form-control" runat="server" MaxLength="80"  AutoPostBack="True" ontextchanged="txtCedulaLegal_TextChanged"/>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredDropDownProveedor"
                            ErrorMessage="La cédula legal del proveedor es requerido."
                            ControlToValidate="txtCedulaLegal" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>

            <%--nombre--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Nombre del proveedor" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtNombre" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
                      <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtNombreComercial"
                            ErrorMessage="El nombre del proveedor es requerido."
                            ControlToValidate="txtNombre" runat="server"
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
                        <asp:TextBox ID="TxtCorreo" 
                            CssClass="form-control" runat="server" placeholder="example@domain.com" MaxLength="80" />
                       </div>
                     <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtEmail"
                            ErrorMessage="El correo electronico del proveedor es requerido."
                            ControlToValidate="TxtCorreo" runat="server"
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
                        <asp:TextBox ID="txtTelefono" 
                            CssClass="form-control" runat="server" placeholder="####-####" MaxLength="80" />
                    </div>
                      <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtTelefono"
                            ErrorMessage="El teléfono del provedor es requerido."
                            ControlToValidate="txtTelefono" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="requiredTxtDireccion"
                            ErrorMessage="La dirección del proveedor es requerida."
                            ControlToValidate="txtDireccion" runat="server"
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
                        <asp:TextBox ID="txtContacto" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
                     <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtContacto"
                            ErrorMessage="El contacto del proveedor es requerido."
                            ControlToValidate="txtContacto" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
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
          
            </div>
              <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="btnRegistrarProveedor" Text="Registrar" CssClass="btn btn-outline-success" runat="server" OnClick="btnRegistrarProveedor_Click"/>
                        <asp:Button ID="btnModificarProveedor" Text="Modificar" CssClass="btn btn-outline-success" runat="server" Onclick="btnModificarProveedor_Click"/>
                        <asp:Button ID="btnEliminarProveedor" Text="Eliminar" CssClass="btn btn-outline-success" runat="server" Onclick="btnEliminarProveedor_Click"/>
                    </div>
                </div>
             </div>
	</div>
</asp:Content>
