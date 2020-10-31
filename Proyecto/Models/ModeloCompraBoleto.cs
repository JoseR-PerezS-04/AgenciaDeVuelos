using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto.Models
{
    public class ModeloCompraBoleto
    {
        public String[] primera = null;
        public String[] segunda = null;
        public String estado = null;
        public int idVuelo;
        public String fecha = null;
        public int idAvion;
        public Decimal aumento;
        public String codigo = null;
        private static ModeloCompraBoleto instancia = null;
        public static ModeloCompraBoleto getInstancia()
        {
            if (instancia == null)
            {
                instancia = new ModeloCompraBoleto();
            }
            return instancia;
        }
   

        public String[] Primera
        {
            get{ return this.primera;}
           set {this.primera = value;}
        }
        public String[] Segunda
        {
            get { return this.segunda; }
            set { this.segunda = value; }
        }
        public String Estado
        {
            get { return this.estado; }
            set { this.estado = value; }
        }
        public int Vuelo
        {
            get { return this.idVuelo; }
            set { this.idVuelo = value; }
        }
        public String Fecha
        {
            get { return this.fecha; }
            set { this.fecha = value; }
        }
        public int Avion
        {
            get { return this.idAvion; }
            set { this.idAvion = value; }
        }
        public Decimal Aumento
        {
            get { return this.aumento; }
            set { this.aumento = value; }
        }
        public String Codigo
        {
            get { return this.codigo; }
            set { this.codigo = value; }
        }
    }
}