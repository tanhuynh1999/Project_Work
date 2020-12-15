using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;


namespace ProjectWork.Areas.ManageEmployers.Controllers
{
    public class PayEmployerController : Controller
    {
        DataWork_projectEntities db = new DataWork_projectEntities();
        // GET: ManageEmployers/Pay
        public ActionResult Index()
        {
            if(Request.Cookies["employer_id"] == null)
            {
                return Redirect("/ManageEmployers/Employers/Login");
            }
            List<ServicePack> services = db.ServicePacks.Where(t => t.servicepack_emloyers == true).ToList();
            return View(services);
        }
        public ActionResult PayServicePackEmployer(int? id)
        {
            if (id == null)
            {
                return HttpNotFound();
            }
            ServicePack service = db.ServicePacks.Find(id);
            return View(service);
        }
        [HttpPost]
        public ActionResult PostPayServicePackEmployer(int? id)
        {
            ViewBag.tcpay = true;
            ServicePack service = db.ServicePacks.Find(id);
            return View("PayServicePackEmployer", service);
        }
    }
}