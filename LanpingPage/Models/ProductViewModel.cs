using LanpingPage.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LanpingPage.Models
{
    public class ProductViewModel
    {
        public List<Product> DamNuProducts { get; set; }
        public List<Product> AoKhoacProducts { get; set; }
        public List<Product> AoThunProducts { get; set; }
    }
}