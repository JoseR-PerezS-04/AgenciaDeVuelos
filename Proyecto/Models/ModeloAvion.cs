using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloAvion
    {
        private Conexion miConexion = null;
        private static ModeloAvion instancia = null;
        public static ModeloAvion getInstancia()
        {
            if (instancia == null)
            {
                instancia = new ModeloAvion();
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
        public void agregar(Avion u)
        {
            conexion.Avion.InsertOnSubmit(u);
            conexion.SubmitChanges();
        }
        public List<Avion> lista()
        {
            return (from v in conexion.Avion
                    select v).ToList();
        }
        public Avion buscarAvion(String nombre)
        {
            var a = (from v in conexion.Avion
                     where v.modelo.Equals(nombre)
                     select v).First();

            return a;
        }
        public List<String> listaNombres()
        {
            return (from v in conexion.Avion
                    select v.modelo).ToList();
        }
        public Avion buscar(int id)
        {
            var a = (from v in conexion.Avion
                     where v.idAvion==id
                     select v).First();

            return a;
        }
        public Avion consultarIdAvion(String nombre)
        {
            return (from v in conexion.Avion
                    where v.modelo.Equals(nombre)
                    select v).First();
        }

        public String devolverNombre(int id) {
            var query = (from v in conexion.Avion
                         where v.idAvion == id
                         select v).First();
           return ModeloAerolinea.getInstancia().buscar(int.Parse(query.idAerolinea.ToString())).nombre;
        }
        public Avion devolverAerolinea(int id)
        {
            return (from v in conexion.Avion
                         where v.idAvion == id
                         select v).First();
        }
    }
}