//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClassLibraryCafe
{
    using System;
    using System.Collections.Generic;
    
    public partial class ComboProduct
    {
        public int ComboID { get; set; }
        public int ProductID { get; set; }
        public Nullable<int> Count { get; set; }
        public int ComboProductID { get; set; }
    
        public virtual Combo Combo { get; set; }
        public virtual Product Product { get; set; }
    }
}
