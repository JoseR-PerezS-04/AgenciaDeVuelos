using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloAsiento
    {
        private Conexion miConexion = null;
        private static ModeloAsiento instancia = null;
        public static ModeloAsiento getInstancia()
        {
            if (instancia == null)
            {
                instancia = new ModeloAsiento();
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
        public void agregar(Asiento u)
        {
            conexion.Asiento.InsertOnSubmit(u);
            conexion.SubmitChanges();
        }
        public List<Asiento> lista()
        {
            return (from v in conexion.Asiento
                    select v).ToList();
        }
        public List<Asiento> consultaAvion(int id)
        {
            return (from v in conexion.Asiento
                    where v.idAvion==id
                    select v).ToList();
        }
        public void editar(int id, String estado)
        {
            var query = (from user in conexion.Asiento
                         where user.idAsiento == id
                         select user).First();
            query.estado = estado;
            conexion.SubmitChanges();
        }
        public Asiento buscar(int id)
        {
            var asiento = (from v in conexion.Asiento
                           where v.idAsiento == id
                           select v).First();

            return asiento;
        }
        public void eliminar(Asiento v)
        {
            conexion.Asiento.DeleteOnSubmit(v);
            conexion.SubmitChanges();
        }

        public List<Asiento> existenciaAsientos(int id)
        {
            return (from v in conexion.Asiento
                    where v.idAvion == id && v.estado.Equals("reservado")
                    select v).ToList();
        }
    }
}