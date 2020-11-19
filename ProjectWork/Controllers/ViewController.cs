using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWork.Controllers
{
    public class ViewController : Controller
    {
        //Menu 
        public PartialViewResult Menu()
        {
            return PartialView();
        }
        //Modal
        public PartialViewResult Modal()
        {
            return PartialView();
        }
        //validation
        public PartialViewResult Vali()
        {
            return PartialView();
        }
        //Manager
        public PartialViewResult Manager()
        {
            return PartialView();
        }
    }
}