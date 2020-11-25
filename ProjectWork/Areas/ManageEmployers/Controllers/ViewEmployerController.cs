using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWork.Areas.ManageEmployers.Controllers
{
    public class ViewEmployerController : Controller
    {
        // GET: ManageEmployers/ViewEmployer
        public PartialViewResult Vali()
        {
            return PartialView();
        }
    }
}