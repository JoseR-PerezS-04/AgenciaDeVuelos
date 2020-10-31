<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace = "Proyecto.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CanvelarReservacion
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Registro" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="Nav" runat="server">
        <div id="topnav">
          <ul>
             <li><a href="../../Home/Index">Home</a></li>
          </ul>
        </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<center><h2>CanvelarReservacion</h2></center>

</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
      <form action="CancelarReservacion" method="post">
         <h3>Este es la reservacion que decea cancelar</h3>
          <% foreach (var a in ModeloBoleto.getInstancia().listaBoleto()){ %>
             <% if(a.idBoleto==ViewBag.id){  %>
                <div> Asiento : <%= a.Asiento.numeroAsiento %></div>
                <div>Estado :<%= a.estado%></div>
                <div>precio :<%= a.precio%></div>
                 <%foreach(var b in ModeloTipoAsiento.getInstancia().lista()){ %>
                       <% if(b.idTipoAsiento==a.Asiento.idTipoAsiento){%>
                            <div>Tipo De Asiento: <%= b.nombre%></div>
                         <% } %>
                   <% } %>
                   <%= Html.DropDownList("estado") %>
                  <input type="hidden" name="idBoleto" value="<%=a.idBoleto%>"/>
              <input type="hidden" name="idAsiento" value="<%=a.idAsiento%>"/>
             <% } %>
               <% } %>
            <input type="submit"/>
         </form>

</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
