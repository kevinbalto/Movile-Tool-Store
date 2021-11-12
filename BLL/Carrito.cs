using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Carrito
    {
        public string codigoBarra { set; get; }
        public string nombre { set; get; }
        public decimal precio { set; get; }
        public int cantidad { set; get; } 
    }
}
