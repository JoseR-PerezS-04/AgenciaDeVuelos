using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Proyecto.Models;  
namespace Proyecto.Controllers
{
    public class BoletoController : Controller
    {
        //
        // GET: /Boleto/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Boleto/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Boleto/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Boleto/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Boleto/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Boleto/Edit/5

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
        // GET: /Boleto/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Boleto/Delete/5

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

        public ActionResult Reservar(int id)
        {
            Vuelo v = ModeloVuelo.getInstancia().buscar(id);
            if (v.estado.Equals("despegado"))
            {
                ViewBag.mensaje = "El Avion Despego";
                return View();
            }
            else {
                ViewBag.mensaje = "";
                String[] dato = { "Comprar", "Reservar" };
                ViewData["estado"] = new SelectList(dato);
                ViewBag.idVuelo = id;
                ViewBag.idAvion = ModeloVuelo.getInstancia().buscar(id).idAvion;
                Boleto boleto = new Boleto();
                return View(boleto);
            }
       
        }

        [HttpPost]
        public ActionResult Reservar(Boleto boleto) {
            try
            
            {
                ModeloCompraBoleto.getInstancia().Primera = null;
                ModeloCompraBoleto.getInstancia().Segunda = null;
                ModeloCompraBoleto.getInstancia().Estado = null;
                ModeloCompraBoleto.getInstancia().Vuelo = 0;
                ModeloCompraBoleto.getInstancia().Fecha = null;
                ModeloCompraBoleto.getInstancia().Avion = 0;
                ModeloCompraBoleto.getInstancia().Aumento = 0;
                ModeloCompraBoleto.getInstancia().Codigo = null;
                if (Request["Clase1"] != null)
                {
                    ModeloCompraBoleto.getInstancia().Primera = Request["Clase1"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                }
                if (Request["Clase2"] != null)
                {
                    ModeloCompraBoleto.getInstancia().Segunda = Request["Clase2"].Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                }
                ModeloCompraBoleto.getInstancia().Estado = Request["estado"];
                ModeloCompraBoleto.getInstancia().Fecha = DateTime.Now.ToString();
                ModeloCompraBoleto.getInstancia().Vuelo = int.Parse(Request["idVuelo"]);
                ModeloCompraBoleto.getInstancia().Avion = int.Parse(Request["idAvion"]);
                int d = int.Parse(ModeloAvion.getInstancia().buscar(int.Parse(Request["idAvion"])).idAerolinea.ToString());
                Decimal p = Convert.ToDecimal(ModeloAerolinea.getInstancia().buscar(d).precio);
                ModeloCompraBoleto.getInstancia().Aumento =Convert.ToDecimal(p);
                ModeloCompraBoleto.getInstancia().Codigo = Guid.NewGuid().ToString();

               
                return RedirectToAction("../Boleto/Guardar");
            }
            catch {
                return View();
            }

        }



        public ActionResult Guardar()
        {
            Boleto b = new Boleto();
            ViewBag.mensaje = "";
            if (ModeloCompraBoleto.getInstancia().Primera != null)
            {
                ViewBag.listaPrimera =ModeloCompraBoleto.getInstancia().Primera;
            }
            if (ModeloCompraBoleto.getInstancia().Segunda != null)
            {
                ViewBag.listaSegunda = ModeloCompraBoleto.getInstancia().Segunda;
            }
      
            ViewBag.aumento = Convert.ToDecimal(ModeloAerolinea.getInstancia().buscar(int.Parse(ModeloAvion.getInstancia().buscar(ModeloCompraBoleto.getInstancia().Avion).idAerolinea.ToString())).precio.ToString());
            ViewBag.aerolinea = ModeloAerolinea.getInstancia().buscar(int.Parse(ModeloAvion.getInstancia().buscar(ModeloCompraBoleto.getInstancia().Avion).idAerolinea.ToString())).nombre.ToString();   
            return View(b);
        }




        [HttpPost]
        public ActionResult Guardar(Boleto collection) {

            try {
                int ultimo = 0;
                foreach (var a in ModeloBoleto.getInstancia().listaBoleto())
                {
                    if (ultimo < a.idBoleto)
                    {
                        ultimo = a.idBoleto;
                    }
                }
                
                if (Request["nombre"].Equals("") && Request["apellido"].Equals("") && Request["edad"].Equals("") && Request["correo"].Equals(""))
                {
                    ViewBag.mensaje = "Verifique de Ingresar Todos los Datos";
                    return RedirectToAction("Guardar");
                }else {
                     int idUsuario = ModeloAcceso.getInstancia().Id;
                     if (ModeloCompraBoleto.getInstancia().Primera != null){
                         foreach(Asiento a in  ModeloAsiento.getInstancia().consultaAvion(ModeloCompraBoleto.getInstancia().Avion)){
                             foreach (String bo in ModeloCompraBoleto.getInstancia().Primera){
                                 if(a.idAsiento==int.Parse(bo)){
                                     Boleto boleto = new Boleto();
                                     ultimo=ultimo + 1;
                                     boleto.idBoleto = ultimo;
                                     boleto.fecha = ModeloCompraBoleto.getInstancia().Fecha;
                                     boleto.precio = a.precio+ModeloCompraBoleto.getInstancia().Aumento;
                                     boleto.estado = ModeloCompraBoleto.getInstancia().Estado;
                                     boleto.nombre = Request["nombre"];
                                     boleto.apellido = Request["apellido"];
                                     boleto.edad = int.Parse(Request["edad"]);
                                     boleto.correo = Request["correo"];
                                     boleto.codigo = ModeloCompraBoleto.getInstancia().Codigo;
                                     boleto.idVuelo = ModeloCompraBoleto.getInstancia().Vuelo;
                                     boleto.idAsiento = a.idAsiento;
                                     ModeloBoleto.getInstancia().agregar(boleto);
                                     ModeloAsiento.getInstancia().editar(a.idAsiento, "reservado");
                                 }
                            
                             }
                         }
                   
                     }
                     if (ModeloCompraBoleto.getInstancia().Segunda != null)
                     {
                         foreach (Asiento a in ModeloAsiento.getInstancia().consultaAvion(ModeloCompraBoleto.getInstancia().Avion))
                         {
                             foreach (String bo in ModeloCompraBoleto.getInstancia().Segunda)
                             {
                                 if (a.idAsiento == int.Parse(bo))
                                 {
                                     Boleto boleto = new Boleto();
                                     ultimo = ultimo + 1;
                                     boleto.idBoleto = ultimo ;
                                     boleto.fecha = ModeloCompraBoleto.getInstancia().Fecha;
                                     boleto.precio = a.precio + ModeloCompraBoleto.getInstancia().Aumento;
                                     boleto.estado = ModeloCompraBoleto.getInstancia().Estado;
                                     boleto.nombre = Request["nombre"];
                                     boleto.apellido = Request["apellido"];
                                     boleto.edad = int.Parse(Request["edad"]);
                                     boleto.correo = Request["correo"];
                                     boleto.codigo = ModeloCompraBoleto.getInstancia().Codigo;
                                     boleto.idVuelo = ModeloCompraBoleto.getInstancia().Vuelo;
                                     boleto.idAsiento = a.idAsiento;
                                     ModeloBoleto.getInstancia().agregar(boleto);
                                     ModeloAsiento.getInstancia().editar(a.idAsiento, "reservado");
                                 }

                             }
                         }
               
                
               
                     }
                   
                    return RedirectToAction("../Home/Index");    
                }
              }
            catch { 
                
                return View();
            }
        }
        public ActionResult Reservaciones()
        {
            ViewBag.codigo=Request["codigo"];
            return View();
        }

     
        public ActionResult CancelarReservacion(int id)
        {
            String[] dato = { "cancelar", "comprar" };
            ViewData["estado"] = new SelectList(dato);
            ViewBag.id = id;
            return View();
        }

        //
        // POST: /Boleto/Edit/5

        [HttpPost]
        public ActionResult CancelarReservacion()
        {
            try
            {
                // TODO: Add update logic here
                String estado=Request["estado"];
                if (Request["estado"].Equals("cancelar")) {
                    ModeloAsiento.getInstancia().editar(ModeloAsiento.getInstancia().buscar(int.Parse(Request["idAsiento"])).idAsiento, "disponible");
                    ModeloBoleto.getInstancia().eliminar(ModeloBoleto.getInstancia().buscar(int.Parse(Request["idBoleto"])));
                }
                else if (Request["estado"].Equals("comprar")) {
                    ModeloBoleto.getInstancia().editar(int.Parse(Request["idBoleto"]), "Comprar");
                }
                return RedirectToAction("../Home/Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
