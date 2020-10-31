<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Proyecto.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reservar
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

     <h2>Boleto</h2>
      
</asp:Content>





<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
       <% if(ViewBag.mensaje.Equals("El Avion Despego")){ %>
      <%= ViewBag.mensaje %>
    <% }else{ %>
    <form id="form1" runat="server">
    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true) %>
    
            <div class="editor-label">
           <h6>Eliga Una Opcion</h6>
        </div>
         <div class="editor-field">
             <%= Html.DropDownList("estado") %>
         </div>
                <input type="hidden" name="idVuelo" value="<%=ViewBag.idVuelo%>"/>
                <input type="hidden" name="idAvion" value="<%=ViewBag.idAvion%>"/>
           
            <div class="editor-label">
                <h6>Asientos</h6>
            </div>
            <div> 
               <table>
                   <tr>
                      <td><h6>Primera Clase</h6></td>
                        <td>
                         <% foreach (var a in ModeloAsiento.getInstancia().lista()){ %>
                            <%if (ViewBag.idAvion==a.idAvion){ %>

                                <%if (a.TipoAsiento.nombre.Equals("Primera Clase")){ %>
                                     <tr>
                                         <% if(!(a.estado.Equals("reservado"))){%>

                                          <td>
                                              <label class="switch">
                                                  <input type="checkbox" class="switch-input" name="Clase1" value="<%=a.idAsiento %>">
                                                  <span class="switch-label" data-on="On" data-off="Off"></span>
                                                  <span class="switch-handle"></span>
                                                </label>
                                         </td>
                                          <% } else if (a.estado.Equals("reservado")) {%>
                                                 <td> X</td>
                                           <% } %>
                                          <td><%=a.numeroAsiento %></td>
                                         <td> <%=a.estado %></td>
                                         <td> Precio  <%=a.precio %></td>
                                     </tr>
                            
                                <% } %>
                             <% } %>
                          <% } %>
                         </td>
                        <td><h6>Segunda Clase</h6></td>
                        <td>
                         <% foreach (var a in ModeloAsiento.getInstancia().lista()){ %>
                            <%if (ViewBag.idAvion==a.idAvion){ %>
                                <%if (a.TipoAsiento.nombre.Equals("Segunda Clase")){ %>
                                     <tr>
                                        <% if(!(a.estado.Equals("reservado"))){%>
                                          <td>
                                              <label class="switch">
                                                  <input type="checkbox" class="switch-input" name="Clase2" value="<%=a.idAsiento %>">
                                                  <span class="sw
                                                      itch-label" data-on="On" data-off="Off"></span>
                                                  <span class="switch-handle"></span>
                                                </label>
                                         </td>
                                          <% } else if (a.estado.Equals("reservado")) {%>
                                                 <td> X</td>
                                           <% } %>
                                         <td><%=a.numeroAsiento %></td>
                                          <td> <%=a.estado %></td>
                                          <td> Precio  <%=a.precio %></td>
                                         
                                     </tr>
                                <% } %>
                             <% } %>
                          <% } %>
                         </td>
                    </tr>
               </table>
            </div>
            <p>
                <input type="submit" value="Continuar" />
            </p>
    <% } %>

    </form>
    <% } %>
   
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
