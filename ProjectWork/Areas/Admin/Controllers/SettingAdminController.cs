using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Areas.Admin.Controllers
{
    public class SettingAdminController : Controller
    {
        DataWork_projectEntities db = new DataWork_projectEntities();
        // GET: Admin/SettingAdmin
        public PartialViewResult EditHome()
        {
            Layout layout = db.Layouts.Find(1);
            return PartialView(layout);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditHome([Bind(Include = "layout_id,ct_1,ct_2,ct_3,ct_4,ct_5,ct_6,ct_7,ct_8,ct_9,ct_10,ct_11,ct_12,ct_13,ct_14,ct_15,ct_16")] Layout layout)
        {
            db.Entry(layout).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("EditHome", new { id = layout.layout_id });
        }
    }
}