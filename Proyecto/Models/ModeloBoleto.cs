using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloBoleto
    {
        private Conexion miConexion = null;
        public int dato=0;
        private static ModeloBoleto instancia = null;
        public static ModeloBoleto getInstancia()
        {
            if (instancia == null)
            {
                instancia = new ModeloBoleto();
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
        public void agregar(Boleto b)
        {

            conexion.Boleto.InsertOnSubmit(b);
            conexion.SubmitChanges();
        }
        public void eliminar(Boleto v)
        {
            conexion.Boleto.DeleteOnSubmit(v);
            conexion.SubmitChanges();
        }
        public List<Boleto> lista(String codigo)
        {
            return (from v in conexion.Boleto
                    where v.codigo.Equals(codigo)
                    select v).ToList();
        }
        public List<Boleto> listaBoleto()
        {
            return (from v in conexion.Boleto
                    select v).ToList();
        }
        public Boleto buscar(int id)
        {
            var b = (from v in conexion.Boleto
                           where v.idBoleto == id
                           select v).First();

            return b;
        }
        public void editar(int id, String estado)
        {
            var query = (from user in conexion.Boleto
                         where user.idBoleto == id
                         select user).First();
            query.estado = estado;
            conexion.SubmitChanges();
        }

        public List<Boleto> consultarExistencia(int id)
        {
            var b = (from v in conexion.Boleto
                     where v.idVuelo == id
                     select v).ToList();

            return b;
        }
    

    }
}