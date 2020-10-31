using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloAcceso
    {
        private string nombreUsuario;
        private string apellido;
        private string nombre;
        private string email;
        public string Nombre
        {
            get { return this.nombre; }
            set { this.nombre = value; }
        }

        public string Apellido
        {
            get { return this.apellido; }
            set { this.apellido = value; }
        }


        public string Email
        {
            get { return this.email; }
            set { this.email = value; }
        }

        public string NombreUsuario
        {
            get { return nombreUsuario; }
        }
        private int id;

        public int Id
        {
            get { return id; }
        }
        private static ModeloAcceso instancia;

        public static ModeloAcceso getInstancia()
        {
            if (instancia == null)
                instancia = new ModeloAcceso();
            return instancia;
        }

        private bool estado;

        public bool Estado
        {
            get { return estado; }
        }

        public void Logged(string nombreUsuario, int id)
        {
            this.nombreUsuario = nombreUsuario;
            this.id = id;
            this.estado = true;
        }
        public void Logout()
        {
            this.nombreUsuario = null;
            this.id = 0;
            this.estado = false;
            instancia = null;
        }
    }
}