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
    
    public partial class TblProveedores
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblProveedores()
        {
            this.TblProductoProveedor = new HashSet<TblProductoProveedor>();
        }
    
        public string cedulaLegalProveedor { get; set; }
        public string nombreProveedor { get; set; }
        public string correoElectronico { get; set; }
        public string telefono { get; set; }
        public string direccion { get; set; }
        public string contacto { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblProductoProveedor> TblProductoProveedor { get; set; }
    }
}
