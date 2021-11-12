<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductosAgotados.aspx.cs" Inherits="AppwebMTS.ProductosAgotados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <h1 class="letraTitulos mt-3">Lista de productos agotados</h1>
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
                            <div class="card md-3 m-5" style="max-width: 300vh; max-height: 300vh;">
                                <div class="row no-gutters">
                                    <div class="col-md-12 text-center" style="color: forestgreen">
                                        <h4 class="card-title text-center" style="color: forestgreen">
                                            <asp:Label ID="nombre" runat="server" Style="color: forestgreen; font-size: 3vh;" Text='<%#Eval ("nombre") %>' />
                                        </h4>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="card-body text-center">
                                            <img src='Productos/<%# Eval("foto") %>' alt='<%#Eval("foto") %>height="300vh" width="300vh"' class="card-img-left" style="height:30vh; width:30vh;" />


                                            <%--campo para el codigo--%>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <asp:Label Text="Código de Barras:" runat="server" />
                                                        <asp:Label ID="codBarra" Text='<%#Eval("codigoBarras") %>' runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <%--campo para el modelo--%>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <asp:Label Text="Modelo: " runat="server" />
                                                        <asp:Label ID="modelo" Text='<%#Eval("modelo") %>' runat="server" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <asp:Label Text="Tipo" runat="server" />
                                                        <asp:Label ID="tipo" Text='<%#Eval("tipo") %>' runat="server" />
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
    <asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:MobileToolStoreConnectionString %>' SelectCommand="SELECT [codigoBarras], [foto], [nombre], [modelo], [tipo] FROM [TblProductos] WHERE ([disponibilidad] = @disponibilidad)">


        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="disponibilidad" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
