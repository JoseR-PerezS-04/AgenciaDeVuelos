<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Proyecto.Vuelo>>" %>
<%@ Import Namespace = "Proyecto.Models"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Registro" runat="server">
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

<asp:Content ID="Content4" ContentPlaceHolderID="Nav" runat="server">
       <div >
          <ul>
              <li><a  href="../Usuario/Perfil">Perfil</a></li>
             <li><a  href="../Aerolinea/Create"> Aerolinea</a></li>
             <li><a  href="../Avion/Create"> Avion</a></li>
              <li><a  href="../Vuelo/Create"> Vuelo</a></li>
              <li><a href="../Vuelo/Index">Home</a></li>
          </ul>
        </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<center><h2>Vuelos</h2></center>

</asp:Content>



<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
<link type="text/css" rel="stylesheet" href="../../Resources/bootstrap/bootstrap.css" />
    <div class="centro">
                <h2 >Bienvenido Administrador <%: Html.Display("nombreUsuario") %></h2>
                <h2 >Esta es la seccion de Vuelos</h2>
         
        </div>
             
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
             <th>
                 <label>Aerolinea</label>
            </th>
            <th></th>
        </tr>
    
    <% foreach (var item in Model) { %>
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
                                <%: Html.DisplayFor(modelItem => ModeloAerolinea.getInstancia().buscar(int.Parse(ModeloAvion.getInstancia().buscar(int.Parse(item.idAvion.ToString())).idAerolinea.ToString())).nombre) %>
            </td>
            <td>
                <div >
                   <a href="/Vuelo/Edit?id=<%=item.idVuelo%>" >Editar</a>
                     <a  href="/Vuelo/Details?id=<%=item.idVuelo%>" >Mostrar</a>
                     <a  href="/Vuelo/Delete?id=<%=item.idVuelo%>" >Eliminar</a>
                </div>
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
