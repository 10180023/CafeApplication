using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CafeApplication
{
    public partial class Product
    {
        public override string ToString()
        {
            return Title;
        }

        public string ValidImage => Image == null ? "../../Resources/product.png" : Image;

        public string FoodStaffList
        {
            get
            {
                string foodStaff = "";
                foreach (var item in ProductFoodStuff)
                {
                    foodStaff += item.FoodStaff.Title;
                    if (item != ProductFoodStuff.Last())
                    {
                        foodStaff += ", ";
                    }
                }
                return foodStaff;
            }
        }

        
    }
}
