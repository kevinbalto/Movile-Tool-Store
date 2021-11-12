using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Producto
    {
        public string codigoBarras { set; get; }
        public string nombre { set; get; }
        public decimal precio { set; get; }
        public string tipo { set; get; }
        public string modelo { set; get; }
        public int cantidad { set; get; }
        public string estado { set; get; }
        public string descripcion { set; get; }
        public string foto { set; get; }
    }
}
