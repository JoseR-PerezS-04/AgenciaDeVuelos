<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Proyecto.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Guardar
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
    <h2>Confirmar Datos</h2>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
    <body>
    
    <div>
        <h3> Boletos</h3>
    </div>
        <%=ViewBag.mensaje%>
    <form action="Guardar" method="post">
         <%Int32 total = 0; Int32  precio = 0;%>
            <div>A la fecha  <%=ModeloCompraBoleto.getInstancia().fecha %></div>
        <div>  <input type="text" name="nombre" placeholder="Nombre" /></div>
          <div>  <input type="text" name="apellido" placeholder="Apellido" /></div>
          <div>  <input type="text" name="edad" placeholder="edad" /></div>
          <div>  <input type="text" name="correo" placeholder="Correo" /></div>
            <div>
                 <table>
                       <tr>
                           <td><h6>Vuelo</h6></td>
                       </tr>
                        <% foreach (var a in ModeloVuelo.getInstancia().lista()) %>
                               <% { %>
                                 <%if(a.idVuelo==ModeloCompraBoleto.getInstancia().Vuelo) %>
                                  <% { %>
                                     <tr><td>Aerolinea: <%= ModeloAerolinea.getInstancia().buscar(int.Parse(a.Avion.idAerolinea.ToString())).nombre%></td></tr>
                                     <tr><td>Destino : <%= a.destino%></td>
                                     <tr><td>Hora : <%= a.horaVuelo%></td>
                                     <tr><td>Estado : <%= a.estado%></td>
                                     <tr><td>Fecha Vuelo : <%= a.fecha%></td>
                                     <tr><td>Aumento Por Tipo Aerolinea : <%= ModeloAerolinea.getInstancia().buscar(int.Parse(a.Avion.idAerolinea.ToString())).precio%></td>
                                      <% total = Convert.ToInt32(ViewBag.aumento) + total;%>
                             <% } %>
                         <% } %>
                 </table>
            </div>
            <div>
                <table>
                     <tr>
                 
                         <%if (ModeloCompraBoleto.getInstancia().Primera !=null) { %>
                             <td><h4>Asientos de Primera Clase seleccionados </h4></td>
                                <% foreach (var a in ModeloAsiento.getInstancia().lista()){  %>
                                    <% foreach (var c in ModeloCompraBoleto.getInstancia().Primera){ %>
                                         <%if (a.idAsiento== int.Parse(c)) {%>
                                             <td> Asiento <%=a.numeroAsiento %>  Precio :<%=a.precio %></td>
                                                 <% total = Convert.ToInt32(a.precio) + total;%>
                                          <% } %>
                                     <% } %>
                                  <% } %>      
                          <% } %>
                     </tr>
                       <tr>
                         <%if (ModeloCompraBoleto.getInstancia().Segunda !=null) { %>
                             <td><h4>Asientos de Segunda Clase seleccionados </h4></td>
                                <% foreach (var s in ModeloAsiento.getInstancia().lista()){  %>
                                    <% foreach (var c in ModeloCompraBoleto.getInstancia().Segunda){ %>
                                         <%if (s.idAsiento== int.Parse(c)) {%>
                                             <td> Asiento <%=s.numeroAsiento %>  Precio :<%=s.precio %></td>
                                                <% total = Convert.ToInt32(s.precio) + total;%>
                                          <% } %>
                                     <% } %>
                                  <% } %>      
                          <% } %>
                     </tr>
                    <tr>
                        <td><h4>El total $<%=total%></h4></td>
                        <td><h4>El Codigo de su Compra "<%=ModeloCompraBoleto.getInstancia().Codigo%>"</h4></td>
                    </tr>
                </table>
            </div>
        <input type="submit" name="Guardar Cambios" />
    </form>
    <div><a href="../Cliente/Index">Cancelar Todo</a></div>
</body>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
