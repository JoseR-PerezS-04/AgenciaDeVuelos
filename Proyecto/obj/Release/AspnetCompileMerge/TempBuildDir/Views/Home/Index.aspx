<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Proyecto.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="Registro" runat="server">
    <link rel="stylesheet" href="../../Resources/login/css/style.css" />
    <script src="../../Resources/login/js/login.js"></script>
    <div >
          <ul>
                <li><div id="loginContainer">
                         <a href="#" id="loginButton"><span>Login</span><em></em></a> 
                              <div id="loginBox">                
                               <form id="loginForm" action="/Usuario/Autenticar" method="post">
                                <fieldset id="body">
                                   <label for="email">Username</label>
                                   <input type="text" name="txtNombreUsuario" id="email" />
                                   <label for="password">Password</label>
                                   <input type="password" name="txtContrasena" id="password" />
                                   <input type="submit" id="login" value="Sign in" />
                                   <a href="../Usuario/Create" id="registro">Registrarse</a>
                                </fieldset>
                             </form>
                            </div>
                 </div></li>
          </ul>
        </div>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="Nav" runat="server"> 
    <div id="topnav">
          <ul>
            
             
              <li><a href="#">Consultar Reservaciones</a>
                  <ul>
                <li>            
                     <form action="../Boleto/Reservaciones" method="post">
                            <label class="label">Ingrese Codigo Compra</label>
                            <input type="text" name="codigo" />
                     </form></li>
                 </ul>
                   
              </li>
               <li><a href="../Home/Index"">Home</a></li>
          </ul>
        </div>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<center><h2>Galeria</h2></center>
     <div id="featured_slide">
        <div class="featured_box">
          <div class="floater">
            <h2>Vuelos</h2>
            <p>Contamos con los aveadores mas profesionales.</p>
          </div>
          <img src="../../Resources/template/images/slider/imagen3.jpg" alt="" /> </div>
        <div class="featured_box">
          <div class="floater">
            <h2>Asientos</h2>
            <p>Disfrute de los mejores asientos, comodos y con una gran vista.</p>
          </div>
     
          <img src="../../Resources/template/images/slider/imagen2.jpg" alt="" /> </div>
        <div class="featured_box">
          <div class="floater">
            <h2>Aerolineas</h2>
            <p>Consta de las Aerolineas Mase seguras.</p>
          </div>
          <img src="../../Resources/template/images/slider/imagen1.jpg" alt="" /> </div>
        <div class="featured_box">
          <div class="floater">
            <h2>Mapas</h2>
            <p>Se especifica bien el lugar antes de dar a marcha.</p>
          </div>
          <img src="../../Resources/template/images/slider/imagen4.jpg" alt="" /> </div>
        <div class="featured_box">
          <div class="floater">
            <h2>Servicio</h2>
            <p>Le Garantisamos un exelente servicio para su comidad.</p>
          </div>
         <img src="../../Resources/template/images/slider/imagen5.jpg" alt="" /> </div>
      </div>
</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
   <link type="text/css" rel="stylesheet" href="../../Resources/bootstrap/bootstrap.css" />
    <h2>ESTA ES LA LISTA DE VUELOS</h2>
        <div id="Div1" class="container" runat="server">
        <table class="table table-bordered">
        <tr>
            <th>
                <label>Horario</label>
            </th>
            <th>
               <label>Destino</label>
            </th>
            <th>
                <label>Estado Vuelo</label>
            </th>
            <th>
                 <label>Fecha</label>
            </th>
        
            <th></th>
        </tr>
    
    <% foreach (var item in ModeloVuelo.getInstancia().lista()) { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.horaVuelo) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.destino) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.estado) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.fecha) %>
            </td>
          
            <td>
                <%: Html.ActionLink("Reservar Boletos", "../Boleto/Reservar", new { id=item.idVuelo }) %>
            </td>
        </tr>
    <% } %>
    
    </table>
     </div>
</asp:Content>






<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
