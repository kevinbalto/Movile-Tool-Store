using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Usuario
    {
        public string correoElectronico { set; get; }
        public string nombre { set; get; }
        public DateTime fechaDeNacimiento { set; get; }
        public string direccion { set; get; }
        public string contrasena { set; get; }
        public string rol { set; get; }
    }
}
