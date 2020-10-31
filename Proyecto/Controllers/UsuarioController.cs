using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Drawing;
using System.Web;
using System.Web.Mvc;
using Proyecto.Models;

namespace Proyecto.Controllers
{
    public class UsuarioController : Controller
    {
        //
        // GET: /Usuario/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult List()
        {
            return View(ModeloUsuario.getInstancia().listaUsuarios());
        }
        //
        // GET: /Administrador/
        public ActionResult Admin()
        {
            return View();
        }
        //
        // GET: /Cliente/
        public ActionResult Cliente()
        {
            return View();
        }

        //
        // GET: /Usuario/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Usuario/Create

        public ActionResult Create()
        {
            ViewBag.mensaje = "";
            Usuario user = new Usuario();
            return View(user);
        }

        //
        // POST: /Usuario/Create

        [HttpPost]
        public ActionResult Create(Usuario user)
        {
            try
                {

                user.idUsuario = ModeloUsuario.getInstancia().listaUsuarios().Count+1;
                user.nombreUsuario = Request["nombreUsuario"];
                user.pass = Request["pass"];
                user.nombre = Request["nombre"];
                user.apellido = Request["apellido"];
                user.email = Request["email"];
                user.idRol = 1;
                HttpPostedFileBase file = this.HttpContext.Request.Files.Get("file");
                if (file != null)
                {
                    if (file.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                             var path = Path.Combine(Server.MapPath("~/Resources/administrador/img_admin"), fileName);
                            file.SaveAs(path);
                             user.foto = "../../Resources/administrador/img_admin/" + fileName;
                    }
                }
                if (user.nombreUsuario != null && user.nombre != null && user.apellido != null && user.email != null && user.foto != null && user.idRol != null && user.pass != null)
                {
                    ViewBag.mensaje = "";
                    ModeloUsuario.getInstancia().agregar(user);
                    return View("../Home/Index");
                }
                else {
                    ViewBag.mensaje = "Verifique de Ingresar Todos Los Datos";
                    return View("../Usuario/Create");
                }
             
            }
            catch
            {
                return View();
            }
        }
         
        // GET: /usuario/Autenticar
        public ActionResult Autenticar()
        {




            return View();
        }

        [HttpPost]
        public ActionResult Autenticar(String nombre, String pass)
        {
            try
            {
                Usuario user = ModeloUsuario.getInstancia().autenticar(Request["txtNombreUsuario"], Request["txtContrasena"]);
                if (user != null)
                {

                    if (user.Rol.nombre.Equals("administrador"))
                    {
                        ModeloAcceso.getInstancia().Nombre = user.nombre;
                        ModeloAcceso.getInstancia().Apellido = user.apellido;
                        ModeloAcceso.getInstancia().Email = user.email;
                        ModeloAcceso.getInstancia().Logged(user.nombreUsuario, user.idUsuario);
                        Session.Add("foto",user.foto);
                        return RedirectToAction("../Vuelo/Index");
                    }
                    else
                    {
                        return View("../Home/Index");
                    }

                }
                else
                {
                    return View("../Home/Index");
                }
            }
            catch
            {
                return View("../Home/Index");
            }
        }


        //
        // GET: /Usuario/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Usuario/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Usuario/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Usuario/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Logout()
        {
            ModeloAcceso.getInstancia().Logout();
            Session.Remove("foto");
            return View("../Home/Index");
        }

        public ActionResult Perfil()
        {
            ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
            ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
            return View();
        }


    }
}
