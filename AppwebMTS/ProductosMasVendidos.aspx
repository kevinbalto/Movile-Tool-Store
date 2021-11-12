<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductosMasVendidos.aspx.cs" Inherits="AppwebMTS.ProductosMasVendidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <h1 class="letraTitulos mt-3">Productos más vendidos</h1>
    </div>


    <div class="card-body">
        <asp:DataList ID="lDatos"
            runat="server"
            DataSourceID="SqlDataSource"
            RepeatColumns="2"
            CellSpacing="3"
            CssClass="text-center"
            OnItemCommand="lDatos_ItemCommand"
            Width="100%" class="text-center">
            <ItemTemplate>
                <table>
                    <div class="row">
                        <div class="text-center col-12">
                            <div class="card md-3 m-5" style="max-width: 300vh;">
                                <div class="row no-gutters">
                                    <div class="col-md-12 text-center" style="color: forestgreen">
                                        <h4 class="card-title text-center" style="color: forestgreen">
                                            <asp:Label ID="nombre" runat="server" Style="color: forestgreen; font-size: 3vh;" Text='<%#Eval ("nombre") %>' />
                                        </h4>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="card-body text-center">
                                            <img src='Productos/<%# Eval("foto") %>' alt='<%#Eval("foto") %>height="300" width="300"' class="card-img-left" style="height:30vh; width:30vh;" />


                                            <%--campo para la cedula--%>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <asp:Label Text="Código de Barras:" runat="server" />
                                                        <asp:Label ID="codBarra" Text='<%#Eval("codigoBarras") %>' runat="server" />
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
    <asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:MobileToolStoreConnectionString %>' SelectCommand="Sp_Cns_ProductosMasVendidos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
