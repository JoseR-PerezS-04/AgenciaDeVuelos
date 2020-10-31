using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Proyecto.Models;
namespace Proyecto.Controllers
{
    public class AerolineaController : Controller
    {
        //
        // GET: /Aerolinea/

        public ActionResult Index()
        {
           
            return View();
        }

        //
        // GET: /Aerolinea/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Aerolinea/Create

        public ActionResult Create()
        {
            ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
            ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
            String[] precio = { "100", "150","250","300","350","400"};
            ViewData["precio"] = new SelectList(precio);
            Aerolinea a = new Aerolinea();
            return View(a);
        }

        //
        // POST: /Aerolinea/Create

        [HttpPost]
        public ActionResult Create(Aerolinea a)
        {
            try
            {
                // TODO: Add insert logic here
                a.idAerolinea = ModeloAerolinea.getInstancia().lista().Count+1;
                a.nombre = Request["nombre"];
                a.precio = Convert.ToDecimal(Request["precio"]);
                ModeloAerolinea.getInstancia().agregar(a);
                return RedirectToAction("../Vuelo/Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Aerolinea/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Aerolinea/Edit/5

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
        // GET: /Aerolinea/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Aerolinea/Delete/5

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
    }
}
