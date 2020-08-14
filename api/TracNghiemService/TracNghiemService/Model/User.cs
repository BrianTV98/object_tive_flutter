using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TracNghiemService.Model
{
    public class User
    {
        //public int id { get; set; }
        public string username { get; set;}

        public string password { get; set; }

        public string email { get; set; }

        public string fullName { get; set; }

        public string address { get; set; }

        public string phoneNumber { get; set; }

        public string birthday { get; set; }

        public string Job { get; set; }

        public string linkavata { get; set; }

        public bool isAdmin { get; set; }
       
    }
}
