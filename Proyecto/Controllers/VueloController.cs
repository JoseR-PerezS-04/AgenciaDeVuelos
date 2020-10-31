using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Proyecto.Models;
namespace Proyecto.Controllers
{
    public class VueloController : Controller
    {
        //
        // GET: /Vuelo/
   

        public ActionResult Index()
        {

            ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
            ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
    
            List<Vuelo> model = ModeloVuelo.getInstancia().lista();
            return View(model);
        }

        //
        // GET: /Vuelo/Details/5

        public ActionResult Details(int id)
        {
            ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
            ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
            return View(ModeloVuelo.getInstancia().buscar(id));
        }


        //
        // GET: /Vuelo/Create

        public ActionResult Create()
        {
            ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
            ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
            String[] dato = { "proceso", "despegado" };
            ViewData["estadoVuelo"] = new SelectList(dato);
            ViewData["aviones"] = new SelectList(ModeloAvion.getInstancia().listaNombres());
            Vuelo model = new Vuelo();
            return View(model);
        }

        //
        // POST: /Vuelo/Create

        [HttpPost]
        public ActionResult Create(Vuelo vuelo)
        {
            try
            {
                int ultimo = 0;
                foreach (var a in ModeloVuelo.getInstancia().lista())
                {
                    if (ultimo < a.idVuelo)
                    {
                        ultimo = a.idVuelo;
                    }
                }
                
                Vuelo v = new Vuelo();
              
                    v.idVuelo = ultimo + 1;
                    v.horaVuelo = Request["horaVuelo"];
                    v.destino = Request["destino"];
                    v.estado = Request["estadoVuelo"];
                    v.fecha = DateTime.Now.ToString(); ;
                    v.idAvion = int.Parse(ModeloAvion.getInstancia().consultarIdAvion(Request["aviones"]).idAvion.ToString());
                    ModeloVuelo.getInstancia().agregar(v);
                    return RedirectToAction("Index");
               
            }
            catch { return RedirectToAction("Index"); }
        }

        //
        // GET: /Vuelo/Edit/5

        public ActionResult Edit(int id)
        {
            Vuelo v = ModeloVuelo.getInstancia().buscar(id);
            int contador = int.Parse(v.idAvion.ToString());
            int opcion = ModeloAsiento.getInstancia().existenciaAsientos(contador).Count;
    
            if (opcion != 0)
            
            {
                ViewBag.m = "";
                ViewData["condicion"] = "si";
                ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
                ViewData["estado"] = ModeloAcceso.getInstancia().Estado; 
                String[] dato = { "proceso", "despegado" };
                ViewData["estadoVuelo"] = new SelectList(dato);
                ViewBag.mensaje = "Hay Asientos Reservados, Solo Puede Editar El Estado Si el Avion Ya Despego";
                return View();
            }
            else {
                if (v.estado.Equals("despegado"))
                {
                    ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
                    ViewBag.mensaje = "El Avion Despego";
                    return View();
                }
                else {
                    ViewBag.mensaje = "";
                    ViewBag.m = "";
                    ViewData["condicion"] = "no";
                    ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
                    ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
                    String[] dato = { "proceso", "despegado" };
                    ViewData["estadoVuelo"] = new SelectList(dato);
                    ViewData["listaAvion"] = new SelectList(ModeloAvion.getInstancia().listaNombres());
                    return View(ModeloVuelo.getInstancia().buscar(id));
                }
            
            }
           
        }

        //
        // POST: /Vuelo/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, Vuelo v)
        {
            try
            {
             
         
                    if (Request["mensaje"].Equals("si"))
                    {
                      
                        ModeloVuelo.getInstancia().editarEstado(id, Request["estadoVuelo"]);
                        int dato = int.Parse(ModeloVuelo.getInstancia().buscar(id).idAvion.ToString());
                        foreach (var a in ModeloAsiento.getInstancia().consultaAvion(dato))
                        {
                            ModeloAsiento.getInstancia().editar(a.idAsiento, "disponible");
                        }
                        foreach (var a in ModeloBoleto.getInstancia().consultarExistencia(id))
                        {
                            ModeloBoleto.getInstancia().editar(a.idBoleto, "Cancelado");
                        }
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ModeloVuelo.getInstancia().eliminar(ModeloVuelo.getInstancia().buscar(id));
                        v.idVuelo = id;
                        v.horaVuelo = Request["horaVuelo"];
                        v.destino = Request["destino"];
                        v.fecha = Request["fecha"];
                        v.estado = Request["estadoVuelo"];
                        v.idAvion = int.Parse(ModeloAvion.getInstancia().buscarAvion(Request["listaAvion"]).idAvion.ToString());

                        ModeloVuelo.getInstancia().agregar(v);
                        return RedirectToAction("Index");
                    }
     
            
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Vuelo/Delete/5

        public ActionResult Delete(int id)
        {
            Vuelo v = ModeloVuelo.getInstancia().buscar(id);
            int contador = int.Parse(ModeloVuelo.getInstancia().buscar(id).idAvion.ToString());
            int dato = ModeloAsiento.getInstancia().existenciaAsientos(contador).Count;
            if (v.estado.Equals("despegado"))
            {
                ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
                ViewBag.mensaje = "El Avion Despego";
                return View();
            }
            else {
                if (dato != 0)
                {
                    ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
                    ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
                    ViewBag.mensaje = "Hay Asientos Reservados, No Puede Eliminar El Vuelo";
                    return View();
                }
                else
                {
                    ViewBag.mensaje = "";
                    ViewData["nombreUsuario"] = ModeloAcceso.getInstancia().NombreUsuario;
                    ViewData["estado"] = ModeloAcceso.getInstancia().Estado;
                    return View(ModeloVuelo.getInstancia().buscar(id));
                }
            }
         
           
        }

        //
        // POST: /Vuelo/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, Vuelo v)
        {
            try
            {
                // TODO: Add delete logic here
                System.Diagnostics.Debug.WriteLine(id);
                ModeloVuelo.getInstancia().eliminar(ModeloVuelo.getInstancia().buscar(id));
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
