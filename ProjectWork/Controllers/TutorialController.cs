using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWork.Controllers
{
    public class TutorialController : Controller
    {
        // GET: Tutorial
        public PartialViewResult PersonalInformation()
        {
            return PartialView();
        }
        public PartialViewResult LocationWork()
        {
            return PartialView();
        }
    }
}