using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Areas.Admin.Controllers
{
    public class ViewAdminController : Controller
    {
        // GET: Admin/View
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
    }
}