<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<Proyecto.Vuelo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
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

<center><h2>Eliminar Vuelo</h2></center>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
       <%if (ViewBag.mensaje.Equals("")){ %>
     <h3>Seguro decea Eliminar el Vuelo?</h3>
    <fieldset>
        <legend>Vuelo</legend>
          
                    <div class="display-label">
                        <label>Horario del Vuelo</label>
                    </div>
                 <%: Html.HiddenFor(model => model.idVuelo) %>
                    <div class="display-field">
                        <%: Html.DisplayFor(model => model.horaVuelo) %>
                    </div>
    
                    <div class="display-label">
                        <label>Destino Vuelo</label>
                    </div>
                    <div class="display-field">
                        <%: Html.DisplayFor(model => model.destino) %>
                    </div>
    
                    <div class="display-label">
                        <label>Estado</label>
                    </div>
                    <div class="display-field">
                        <%: Html.DisplayFor(model => model.estado) %>
                    </div>
    
                    <div class="display-label">
                        <label>Fecha</label>
                    </div>
                    <div class="display-field">
                        <%: Html.DisplayFor(model => model.fecha) %>
                    </div>
    
                    <div class="display-label">
                       <label>Avion</label>
                    </div>
                    <div class="display-field">
                        <%: Html.DisplayFor(model => model.Avion.modelo) %>
                    </div>
       
                </fieldset>
                <% using (Html.BeginForm()) { %>
                    <p>
                        <input type="submit" value="Estoy Seguro" /> 
                    </p>
        
    <% } %>
     <%}else if(ViewBag.mensaje.Equals("El Avion Despego")){%>
            <%= ViewBag.mensaje %>
              <%}else{%>
      <%: Html.HiddenFor(model => model.idVuelo) %>
                     <%= ViewBag.mensaje %>
              <% } %>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
