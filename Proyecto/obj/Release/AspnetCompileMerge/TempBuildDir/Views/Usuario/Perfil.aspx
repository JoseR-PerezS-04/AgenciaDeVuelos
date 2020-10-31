<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<Proyecto.Usuario>" %>
<%@ Import Namespace="Proyecto.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Perfil
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
              <li><a href="../Vuelo/Index">Home</a></li>
          </ul>
        </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<center><h2>Perfil</h2></center>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Resources/bootstrap/bootstrap.css" />

                <h2 >Administrador <%: Html.Display("nombreUsuario") %></h2>
     <div id="Div1" class="container" runat="server">
     
            <h3>Nombre Usuario : <%=ModeloAcceso.getInstancia().NombreUsuario%></h3>
              <h3>Nombre : <%=ModeloAcceso.getInstancia().Nombre%></h3>
               <h3>Apellido : <%=ModeloAcceso.getInstancia().Apellido%></h3>
               <h3>Email : <%=ModeloAcceso.getInstancia().Email%></h3>
   
      </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
  
        <table class="table table-bordered" border="1">
        <%if (Session["foto"]!= null){ %>
         <tr><td><img src="<% Response.Write(Session["foto"]); %>" width="250" height="200" /></td></tr> 
        <%} %>
            </table>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
