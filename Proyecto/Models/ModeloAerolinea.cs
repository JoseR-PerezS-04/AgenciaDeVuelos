using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloAerolinea
    {
        private Conexion miConexion = null;
        private static ModeloAerolinea instancia = null;
        public static ModeloAerolinea getInstancia()
        {
            if (instancia == null)
            {
                instancia = new ModeloAerolinea();
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
        public void agregar(Aerolinea u)
        {
            conexion.Aerolinea.InsertOnSubmit(u);
            conexion.SubmitChanges();
        }
        public List<Aerolinea> lista()
        {
            return (from v in conexion.Aerolinea
                    select v).ToList();
        }
        public Aerolinea buscar(int id)
        {
            var a = (from v in conexion.Aerolinea
                         where v.idAerolinea == id
                         select v).First();

            return a;
        }
        public List<String> listaNombres()
        {
            return (from v in conexion.Aerolinea
                    
                     select v.nombre).ToList();
        }
        public Aerolinea consultarNombre(String nombre)
        {
            return (from v in conexion.Aerolinea
                     where v.nombre.Equals(nombre)
                    select v).First();
        }
    }
}