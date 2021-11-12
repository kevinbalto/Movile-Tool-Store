<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VistaCatalogoProductos.aspx.cs" Inherits="AppwebMTS.VistaCatalogoProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--aqui van los productos]--%>
    <div class="container text-center">
        <h1 class="letraTitulos mt-3">Productos Disponibles</h1>
    </div>


    <div class="card-body">

        <asp:DataList ID="lDatos"
            runat="server"
            DataSourceID="SqlDataSource"
            RepeatColumns="2"
            CellSpacing="3"
            class="text-center"
            OnItemCommand="lDatos_ItemCommand"
            Width="100%">
            <ItemTemplate>
                <table>
                    <div class="row">
                        <div class="text-center col-12">
                            <div class="card md-3 m-5" style="max-width: 300vh;">
                                <div class="row no-gutters">
                                    <div class="col-md-12 text-center" style="color: forestgreen">
                                        <h4 class="card-title text-center" style="color: forestgreen">
                                            <span>
                                                <asp:Label ID="nombre" TextMode="MultiLine" runat="server" Style="color: forestgreen; font-size: 3vh;" Text='<%#Eval ("nombre") %>' />
                                            </span>
                                        </h4>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="card-body text-center">
                                            <img src='Productos/<%# Eval("foto") %>' alt="" height="300" width="300" class="card-img-left" />


                                            <%--campo para codigo de barra--%>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <asp:Label Text="Código de Barras:" runat="server" />
                                                        <asp:Label ID="codBarra" Text='<%#Eval("codigoBarras") %>' runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <%--campo para el precio--%>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <asp:Label Text="Precio: ₡" runat="server" />
                                                        <asp:Label ID="precio" Text='<%#Eval("precio") %>' runat="server" />
                                                    </div>
                                                </div>
                                            </div>

                                            <%--botones--%>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:Button ID="btnAnadir" Text="Añadir a carrito" runat="server" CssClass="btn btn-outline-success"
                                                            CommandName="añadir"
                                                            CommandArgument='<%# ( (DataListItem)Container).ItemIndex %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </table>
            </ItemTemplate>

        </asp:DataList>
    </div>
    <asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:MobileToolStoreConnectionString %>' SelectCommand="Sp_Cns_FiltroProducto" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter SessionField="controlCatalogo" Name="tipo" Type="String" DefaultValue=""></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
