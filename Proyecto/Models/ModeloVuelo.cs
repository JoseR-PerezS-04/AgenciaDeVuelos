using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloVuelo
    {
        private Conexion miConexion = null;
        private static ModeloVuelo instancia = null;
        public static ModeloVuelo getInstancia()
        {
            if (instancia == null)
            {
                instancia = new ModeloVuelo();
            }
            return instancia;
        }
        public Conexion conexion
        {
            get
            {
                if (miConexion == null)
                {
                    miConexion = new Conexion();
                }
                return miConexion;
            }
        }
        
        public void agregar(Vuelo v)
        {
            conexion.Vuelo.InsertOnSubmit(v);
            conexion.SubmitChanges();
        }
        public void eliminar(Vuelo v)
        {
            System.Diagnostics.Debug.WriteLine(v.idVuelo);
            System.Diagnostics.Debug.WriteLine(v.horaVuelo);
            System.Diagnostics.Debug.WriteLine(v.estado);
            System.Diagnostics.Debug.WriteLine(v.fecha);
            System.Diagnostics.Debug.WriteLine(v.destino);
            System.Diagnostics.Debug.WriteLine(v.idAvion);
            conexion.Vuelo.DeleteOnSubmit(v);
            conexion.SubmitChanges();
        }
        public List<Vuelo> lista() {
            return (from v in conexion.Vuelo
                    select v).ToList();
        }
       public void editar(int id, Vuelo v)
        {
            var query = (from user in conexion.Vuelo
                         where user.idVuelo == id
                         select user).First();
            query.destino = v.destino;
            query.estado = v.estado;
            query.horaVuelo = v.horaVuelo;
            query.fecha = v.fecha;
            query.idAvion = v.idAvion;

           conexion.SubmitChanges();
        }
       public Vuelo buscar(int id)
       {
           var vuelo = (from v in conexion.Vuelo
                       where v.idVuelo == id
                       select v).First();
           
           return vuelo;
       }
       public List<Vuelo> consultar(int id)
       {
           var vuelo = (from v in conexion.Vuelo
                        where v.idAvion == id
                          
                        select v).ToList();

           return vuelo;
          
       }
 
       public void editarEstado(int id, String estado)
       {
           var query = (from user in conexion.Vuelo
                        where user.idVuelo == id
                        select user).First();
           query.estado = estado;

           conexion.SubmitChanges();
       }





















    }
}