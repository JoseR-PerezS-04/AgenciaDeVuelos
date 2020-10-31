<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Proyecto.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reservaciones
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Registro" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Nav" runat="server">
        <div id="topnav">
          <ul>
             <li><a href="../../Home/Index">Home</a></li>
          </ul>
        </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Reservaciones</h2>

</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
  <body>
    <div>
        <h3>Usted Compro Los Siguietes Boletos</h3>
          <table>
                       <% if (ModeloBoleto.getInstancia().lista(ViewBag.codigo) != null)
                          {%>
                        <% foreach (var a in ModeloBoleto.getInstancia().lista(ViewBag.codigo))
                           { %>
                          
                            <tr><td>Vuelo: <%= a.Vuelo.destino%></td></tr>
                           <tr><td>Fecha: <%= a.fecha%></td></tr>
                            <tr><td>Estado Vuelo: <%= a.Vuelo.estado%></td></tr>
                           <tr><td>No.Asiento: <%= a.Asiento.numeroAsiento%></td></tr>
                            <tr><td>Estado Asiento: <%= a.Asiento.estado%></td></tr>
                           <tr><td>Precio Del Boleto: <%= a.precio%></td></tr>
                               <tr><td>Estado Boleto: <%= a.estado%></td></tr>
                            <%foreach(var b in ModeloTipoAsiento.getInstancia().lista()){ %>
                                    <% if(b.idTipoAsiento==a.Asiento.idTipoAsiento){%>
                                     <tr><td>Tipo De Asiento: <%= b.nombre%></td></tr>
                                      <% } %>
                              <% } %>
                            <% if(a.Asiento.estado.Equals("reservado") && a.estado.Equals("Reservar")){%>
                                 <tr><td><%: Html.ActionLink("Cancelar Reservacion", "CancelarReservacion", new { id=a.idBoleto }) %></td></tr>
                            <% } %>
                           <tr><td>___________________________________________________________________________</td></tr>
                         <% } %>
               <% } %>
          </table>
      </div>
    </body>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
