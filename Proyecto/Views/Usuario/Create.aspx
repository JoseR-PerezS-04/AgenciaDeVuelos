<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<Proyecto.Usuario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center><h2>Registrarse</h2></center>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Nav" runat="server">
     <div id="topnav">
          <ul>
             <li><a href="../Home/Index">Home</a></li>
          </ul>
        </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
       <%= ViewBag.mensaje %>
      <form id="form1" runat="server" enctype="multipart/form-data" >
    <% using (Html.BeginForm()) { %>
         <table border="0">
           
              <tr><td> <label class="title">Usuario</label></td></tr> 
               <tr><td><input  class="input1" type="text" name="nombreUsuario" placeholder="Username"/></td></tr> 
               <tr><td><input  class="input1" type="password" name="pass" placeholder="Password"/></td></tr> 
               <tr><td> <input  class="input1" type="text" name="nombre" placeholder="Nombre"/></td></tr> 
               <tr><td> <input  class="input1" type="text" name="apellido" placeholder="Apellido"/></td></tr> 
               <tr><td><input  class="input1" type="text" name="email" placeholder="Email" /></td></tr>  

     <% Html.AntiForgeryToken();%>
               <tr><td> <input type="file" name="file" /></td></tr> 
              <tr><td><input type="submit" value="Guardar" class="boton"/> </td></tr> 
            </table> 
    <% } %>
            
     </form>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
      <link type="text/css" rel="stylesheet" href="../../Resources/login/create/index.css" />
    <div>
        <img src="../../Resources/login/create/registro.jpg" width="350" height="300" class="imagen"/>
         
    </div>
    <div>  <label class="title">Al Registrarse Podra Tener Los Privilegios de Administrar La Seccion De Vuelos</label></div>
</asp:Content>


