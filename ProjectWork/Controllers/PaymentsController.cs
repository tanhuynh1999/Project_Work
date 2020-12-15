using ProjectWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWork.Controllers
{
    public class PaymentsController : Controller
    {
        DataWork_projectEntities db = new DataWork_projectEntities();
        // GET: Payments
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult PayServicePackUser(int? id)
        {
            if(id == null)
            {
                return HttpNotFound();
            }
            ServicePack service = db.ServicePacks.Find(id);
            return View(service);
        }
        [HttpPost]
        public ActionResult PostPayServicePackUser(int? id)
        {
            ViewBag.tcpay = true;
            ServicePack service = db.ServicePacks.Find(id);
            return View("PayServicePackUser", service);
        }
    }
}