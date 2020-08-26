using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TracNghiemService.Model
{
    public class LearningProcess
    {
        public int idLearning { get; set; }
        public int idQuestion { get; set; }
        public string question { get; set; }

        public string A { get; set; }
        public string B { get; set; }
        public string C { get; set; }
        public string D { get; set; }
        public string correct { get; set; }

        public string explain { get; set; }

        public string ChooseAnswer{ get; set; }

    }
}
