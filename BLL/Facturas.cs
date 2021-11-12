using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Facturas
    {
        public int codigoFactura { set; get; }
        public string nombreCliente { set; get; }
        public DateTime fechaFacturacion { set; get; }
        public decimal totalPagar { set; get; }
        public string numeroTarjeta { set; get; }
        public DateTime fechaCaducidad { set; get; }
        public string codigoSeguridad { set; get; }
    }
}
