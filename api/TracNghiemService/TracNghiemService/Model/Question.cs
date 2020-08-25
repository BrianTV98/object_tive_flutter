using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TracNghiemService.Model
{
    public class Question
    {
        public int id { get; set; }
        public int idTheme { get; set; }
        public int idLevel { get; set; }

        public String usernameSend{ get; set;}

        public String question { get; set; }
        public String A { get; set; }
        public String B { get; set; }
        public String C { get; set; }
        public String D { get; set; }
     
        public String correct { get; set; }
        public String explain { get; set; }
        public DateTime lastUpdate { get; set; }
    }
}
