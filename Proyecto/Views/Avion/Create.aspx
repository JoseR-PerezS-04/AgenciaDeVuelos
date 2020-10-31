<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<Proyecto.Avion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Registro" runat="server">
     <% if(Html.Value("estado").ToHtmlString().Equals("True")==true){ %>
        <div >
          <ul>
                <li> <a href="../Usuario/Logout"> Cerrar Sesion</a></li>
          </ul>
        </div>
       <% }else{
          Response.Redirect("../Home/Index");
        }%>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="Nav" runat="server">
       <div >
          <ul>
              <li><a href="../Vuelo/Index">Home</a></li>
          </ul>
        </div>
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="MainContent" runat="server">

<center><h2>Registrar Avion</h2></center>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
    <form  id="form1" runat="server">
             <% using (Html.BeginForm()) { %>
        <table class="registroVuelo">
                 <tr><td> <label class="title">Avion</label></td></tr> 
                 <tr><td><input  class="input1" type="text" name="modelo" placeholder="Modelo Avion"/></td></tr> 
                 <tr><td><label class="titlem">Cantidad de Asientos de Primera Clase</label></td></tr> 
                 <tr><td><div class="dropdown-select" ><%= Html.DropDownList("primera") %></div></td></tr> 
                 <tr><td><label class="titlem">Precio Para los Asientos de Primera Clase</label></td></tr>
                 <tr><td><div class="dropdown-select"><%= Html.DropDownList("precioClase1") %></div></td></tr>
                 <tr><td><label class="titlem">Cantidad de Asientos de Segunda Clase</label></td></tr>
                 <tr><td><div class="dropdown-select"><%= Html.DropDownList("segunda") %></div></td></tr>
                 <tr><td><label class="titlem">Precio Para los Asientos de Segunda Clase</label></td></tr> 
                 <tr><td><div class="dropdown-select"><%= Html.DropDownList("precioClase2") %></div></td></tr>
               <tr><td><label class="titlem">Aerolineas</label></td></tr> 
                    <tr><td>
                      <tr><td><div class="dropdown-select"><%= Html.DropDownList("aerolineas") %></div></td></tr>
                 <tr><td><input type="submit" value="Create" class="boton"/></td></tr> 
           </table> 
    <% } %>
        </form>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
