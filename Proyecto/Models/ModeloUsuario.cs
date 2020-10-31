using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloUsuario
    {
        private Conexion miConexion=null;
        private static ModeloUsuario instancia=null;
        public static ModeloUsuario getInstancia() {
            if (instancia == null) {
                instancia = new ModeloUsuario();
            }
            return instancia;
        }
        public Conexion conexion {
            get {
                if (miConexion == null) {
                    miConexion = new Conexion();
                }
                return miConexion;
            }
        }
        public List<Usuario> listar(int id) {
            var query = (from u in conexion.Usuario
                         where u.idUsuario==id
                         select u).ToList();
            return query;
        }
        public List<Usuario> listaUsuarios()
        {
            var query = (from u in conexion.Usuario
                      
                         select u).ToList();
            return query;
        }

        public void agregar(Usuario u) {
            conexion.Usuario.InsertOnSubmit(u);
            conexion.SubmitChanges();
        }
        public void eliminar(Usuario u) {
            conexion.Usuario.DeleteOnSubmit(u);
            conexion.SubmitChanges();
        }
        public void editar(int id, Usuario u)
        {
            var query = (from user in conexion.Usuario
                         where user.idUsuario == id
                         select user).First();
            query.nombre = u.nombre;
            query.nombreUsuario = u.nombreUsuario;
            query.pass = u.pass;
            query.apellido = u.apellido;
            query.email = u.email;
            query.foto=u.foto;
            query.idRol = u.idRol;
            conexion.SubmitChanges();
        }

        public Usuario autenticar(String nombreUsuario, String contrasena)
        {
            return (from u in conexion.Usuario
                    where u.nombreUsuario == nombreUsuario && u.pass == contrasena
                    select u).First();
        }

        public Usuario buscar(int id)
        {
            var asiento = (from v in conexion.Usuario
                           where v.idUsuario == id
                           select v).First();

            return asiento;
        }


    }
}