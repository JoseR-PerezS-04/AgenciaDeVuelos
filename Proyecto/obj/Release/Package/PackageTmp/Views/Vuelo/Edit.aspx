<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SiteMaster.Master" Inherits="System.Web.Mvc.ViewPage<Proyecto.Vuelo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
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

<center><h2>Editar Vuelo</h2></center>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Content" runat="server">
     <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>Vuelo</legend>
              <%: Html.HiddenFor(model => model.idVuelo) %>
          <%if (ViewBag.mensaje.Equals("")){ %>
              <%: Html.HiddenFor(model => model.idVuelo) %>
            <%: Html.HiddenFor(model => model.idVuelo) %>
    
            <div class="editor-label">
                     <label>Horario Del Vuelo</label>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.horaVuelo) %>
                <%: Html.ValidationMessageFor(model => model.horaVuelo) %>
            </div>
    
            <div class="editor-label">
                       <label>Destino</label>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.destino) %>
                <%: Html.ValidationMessageFor(model => model.destino) %>
            </div>
            <div class="editor-label">
             <label> Estado</label>
            </div>
            <div class="editor-field">
                 
                  <%: Html.HiddenFor(model => model.estado) %>

                  <%= Html.DropDownList("estadoVuelo") %>
            </div>
    
            <div class="editor-label">
                        <label>Fecha</label>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.fecha) %>
                <%: Html.ValidationMessageFor(model => model.fecha) %>
            </div>
    
            <div class="editor-label">
                <label>Avion</label>
            </div>
            <div class="editor-field">
                 <input type="hidden" name="mensaje" value="<%=ViewData["condicion"]%>" />
              
                  <%= Html.DropDownList("listaAvion") %>
            </div>
    
            <p>
                <input type="submit" value="Guardar Edicion" />
            </p>
                 <%}else if(ViewBag.mensaje.Equals("El Avion Despego")) {%>
              <%= ViewBag.mensaje %>
                <%}else {%>
                      <%: Html.HiddenFor(model => model.idVuelo) %>
                     <input type="hidden" name="mensaje" value="<%=ViewData["condicion"]%>" />
                     <%= ViewBag.mensaje %>
                     <h6>Ingrese Seleccione el Estado</h6>
                     <%= Html.DropDownList("estadoVuelo") %>
              <p>
                <input type="submit" value="Guardar Edicion" />
            </p>
                <%}%>
        </fieldset>
    <% } %>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Content3" runat="server">
</asp:Content>
