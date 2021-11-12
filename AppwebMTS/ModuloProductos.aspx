<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModuloProductos.aspx.cs" Inherits="AppwebMTS.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
     <div class="container text-center ContenidoTexto">
		<div class="justify-content-center text-center">
			 <div class="form-group mt-4">
				<div class="row">
                    <div class="col-md-12">
                       <h1 class="letraTitulos">Registro  de productos</h1> 
                    </div>
				</div>
			</div>
            <a></a>
            <%--codigo de barra--%>
			<div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Código de barra:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtCodigoBarra" 
                            CssClass="form-control" runat="server" MaxLength="80" 
                            AutoPostBack="True" ontextchanged="txtCodigoBarra_TextChanged"/>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtCodigoBarra"
                            ErrorMessage="El código de barra es requerido."
                            ControlToValidate="txtCodigoBarra" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>
            <%--nombre--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Nombre:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtNombre" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtNombre"
                            ErrorMessage="El nombre del producto es requerido."
                            ControlToValidate="txtNombre" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>

            <%--marca--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Marca:" runat="server" />
					</div>
					  <div class="col-md-8">
                         <asp:DropDownList ID ="ddlMarca"
                                runat= "server" CssClass= "form-control" >
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiereDdlMarca"
                            ErrorMessage="La marca es requerida."
                            ControlToValidate="ddlMarca" runat="server"
                            ForeColor="Red" InitialValue="0"> * </asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>

            <%--precio--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Precio:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtPrecio" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiereTxtxPrecio"
                            ErrorMessage="El precio del producto es requerido."
                            ControlToValidate="txtPrecio" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>

            <%--tipo--%>
			  <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Tipo:" runat="server" />
                    </div>
                    <div class="col-md-8">
                         <asp:DropDownList ID ="ddlTipo" 
                            runat= "server" CssClass= "form-control" >
                            <asp:ListItem Text ="[Seleccionar]" value= "" />
                            <asp:ListItem Text ="Móvil" value= "Móvil" />
                            <asp:ListItem Text ="Laptop" value= "Laptop" />
                            <asp:ListItem Text ="Tablet" value= "Tablet" />
                            <asp:ListItem Text ="Componente" value= "Componente" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredDdlTipo"
                            ErrorMessage="El tipo del producto es requerido."
                            ControlToValidate="ddlTipo" runat="server"
                            ForeColor="Red" >*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>  
            <%--modelo--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Modelo:" runat="server" />
					</div>
					 <div class="col-md-8">
                        <asp:TextBox ID="txtModelo" 
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtModelo"
                            ErrorMessage="El módelo del producto es requerido."
                            ControlToValidate="txtModelo" runat="server"
                            ForeColor="Red" >*</asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>
            <%--proveedor--%>
            <div class="form-group">
				<div class="row">
					<div class="col-md-3">
						<asp:Label Text="Proveedor:" runat="server" />
					</div>
					 <div class="col-md-8">
                         <asp:DropDownList ID ="ddlProveedor" 
                                runat= "server" CssClass= "form-control" >
                         </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredDdlProveedor"
                            ErrorMessage="El proveedor es requerido."
                            ControlToValidate="ddlMarca" runat="server"
                            ForeColor="Red" InitialValue="0"> * </asp:RequiredFieldValidator>
                    </div>
				</div>
			</div>

             <%--cantidad--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Cantidad" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-8">
                         <asp:TextBox ID="txtCantidad" 
                            CssClass="form-control" runat="server" TextMode="Number" min="1" max="99"/>
                        <asp:RegularExpressionValidator ID="regularExpressionValidatortxtCantidad"
                            ControlToValidate="txtCantidad" runat="server"
                            ErrorMessage="Número no válido"
                            ValidationExpression="\d+" ForeColor="Red">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtCantidad"
                            ErrorMessage="La cantidad es requerida."
                            ControlToValidate="txtCantidad" runat="server"
                            ForeColor="Red" InitialValue="0"> * </asp:RequiredFieldValidator>
                    </div>
                </div>          
            </div>
             <%--Estado--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Estado:" runat="server" />
                    </div>
                    <div class="col-md-8">
                         <asp:DropDownList ID ="ddlEstado" 
                            runat= "server" CssClass= "form-control" >
                            <asp:ListItem Text ="[Seleccionar]" value= "" />
                            <asp:ListItem Text ="Nuevo" value= "Nuevo" />
                            <asp:ListItem Text ="Segunda" value= "Segunda" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredDdlEstado"
                            ErrorMessage="El estado del producto es requerido."
                            ControlToValidate="ddlEstado" runat="server"
                            ForeColor="Red" >*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
           
             <%--Descripcion--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Descripción:" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-8">
                         <asp:TextBox ID="txtDescripcion" 
                            CssClass="form-control" runat="server" MaxLength="80"/>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredDTxtDescripcion"
                            ErrorMessage="La descripcion es requerida."
                            ControlToValidate="txtDescripcion" runat="server"
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

             <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Subir foto:" runat="server" />
                    </div>
                    <div class="col-md-8 text-left">
                        <asp:FileUpload ID="fileUpload" runat="server"
                            BorderStyle="None" Font-Bold="true" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredFileUpload"
                            ErrorMessage="La foto es requerida"
                            ControlToValidate="fileUpload"
                            runat="server" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="btnRegistrarProducto" Text="Registrar" CssClass="btn btn-outline-success" runat="server" OnClick="btnRegistrarProducto_Click"/>
                        <asp:Button ID="btnModificarProducto" Text="Modificar" CssClass="btn btn-outline-success" runat="server" OnClick="btnModificarProducto_Click"/>
                        <asp:Button ID="btnEliminarProducto" Text="Eliminar" CssClass="btn btn-outline-success" runat="server" Onclick="btnEliminarProducto_Click"/>
                    </div>
                </div>
            </div>
		</div>	
	</div>
</asp:Content>
