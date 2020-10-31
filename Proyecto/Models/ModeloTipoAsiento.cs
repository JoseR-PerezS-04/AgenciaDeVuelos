using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloTipoAsiento
    {
        private Conexion miConexion = null;
        private static ModeloTipoAsiento instancia = null;
        public static ModeloTipoAsiento getInstancia()
        {
            if (instancia == null)
            {
                instancia = new ModeloTipoAsiento();
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
        public TipoAsiento buscar(String nombre)
        {
            var asiento = (from v in conexion.TipoAsiento
                           where v.nombre == nombre
                           select v).First();

            return asiento;
        }
        public List<TipoAsiento> lista()
        {
            var asiento = (from v in conexion.TipoAsiento
                           select v).ToList();

            return asiento;
        }
    }
}