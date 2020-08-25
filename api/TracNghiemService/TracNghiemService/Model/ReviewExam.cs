using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TracNghiemService.Model
{
    public class ReviewExam
    {
        public int id { get; set; }
        public int idExam { get; set; }
        public string question { get; set; }

        public string A { get; set; }
        public string B { get; set; }
        public string C { get; set; }
        public string D { get; set; }
        public String correct { get; set; }
        public String explain { get; set; }
        public String chooseAnswer { get; set; }
        public DateTime lastUpdate { get; set; }
    }
}
