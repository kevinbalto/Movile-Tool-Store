using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DetalleFactura
    {
        public string codigoDetalleFactura { set; get; }
        public int codigoFactura { set; get; }
        public string codigoBarras { set; get; }
        public string nombreProducto { set; get; }
        public decimal precio { set; get; }
        public int cantidad { set; get; }
        public decimal subTotal { set; get; }
    }
}
