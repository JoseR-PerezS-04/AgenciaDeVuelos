using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Proyecto.Models;
namespace Proyecto.Controllers
{
    public class AvionController : Controller
    {
        //
        // GET: /Avion/

        public ActionResult Index()
        {
 
            return View();
        }

        //
        // GET: /Avion/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Avion/Create

        public ActionResult Create()
        {
            ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
            ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
            Avion avion = new Avion();
            String[] precio = { "400", "500", "600", "700", "800" };
            String[] precio2 = { "100", "150", "250", "300", "350"};
            List<int> primera = new List<int>();
            List<int> segunda = new List<int>();
            for (int i = 10; i <= 50;i=i+10 )
            {
                if (i <=20) {
                    primera.Add(i);
                }
                segunda.Add(i);
               
            }
            ViewData["precioClase1"] = new SelectList(precio);
            ViewData["precioClase2"] = new SelectList(precio2);
            ViewData["primera"] = new SelectList(primera);
            ViewData["segunda"] = new SelectList(segunda);
            ViewData["aerolineas"] = new SelectList(ModeloAerolinea.getInstancia().listaNombres());
            return View(avion);
        }

        //
        // POST: /Avion/Create

        [HttpPost]
        public ActionResult Create(Avion a)
        {
            try
            {
                a.idAvion = ModeloAvion.getInstancia().lista().Count+1;
                a.modelo = Request["modelo"];
                int id = int.Parse(ModeloAerolinea.getInstancia().consultarNombre(Request["aerolineas"]).idAerolinea.ToString());
                a.idAerolinea = id;
                ModeloAvion.getInstancia().agregar(a);
                int idPrimera=ModeloTipoAsiento.getInstancia().buscar("Primera Clase").idTipoAsiento;
                int idSegunda =ModeloTipoAsiento.getInstancia().buscar("Segunda Clase").idTipoAsiento;
                for (int i = 1; i <= Convert.ToInt32(Request["primera"]); i++) {
                    Asiento s = new Asiento();
                    s.idAsiento = ModeloAsiento.getInstancia().lista().Count+1;
                    s.numeroAsiento = "No." + i;
                    s.idAvion = a.idAvion;
                    s.estado = "disponible";
                    s.precio = Convert.ToDecimal(Request["precioClase1"]);
                    s.idTipoAsiento = idPrimera;
                    
                    ModeloAsiento.getInstancia().agregar(s);
                }
                for (int i = 1; i <= Convert.ToInt32(Request["segunda"]); i++)
                {
                    Asiento s = new Asiento();
                    s.idAsiento = ModeloAsiento.getInstancia().lista().Count+1;
                    s.numeroAsiento = "No." + i;
                    s.idAvion = a.idAvion;
                    s.estado = "disponible";
                    s.precio = Convert.ToDecimal(Request["precioClase2"]);
                    s.idTipoAsiento = idSegunda;
                    ModeloAsiento.getInstancia().agregar(s);
                }
                    return RedirectToAction("../Vuelo/Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Avion/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Avion/Edit/5

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
        // GET: /Avion/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Avion/Delete/5

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
