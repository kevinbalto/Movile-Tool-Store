//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class TblDetalleFactura
    {
        public int codigoDetalleFactura { get; set; }
        public int codigoFactura { get; set; }
        public string codigoBarras { get; set; }
        public string nombreProducto { get; set; }
        public decimal precio { get; set; }
        public int cantidad { get; set; }
        public decimal subtotal { get; set; }
    
        public virtual TblFacturas TblFacturas { get; set; }
    }
}
