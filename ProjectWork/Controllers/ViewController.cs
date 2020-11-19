using ProjectWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace ProjectWork.Controllers
{
    public class ViewController : Controller
    {
        private const int PAGE_SIZE = 12;
        DataWork_projectEntities db = new DataWork_projectEntities();
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
        public ActionResult FilterWorkByCatId(int? id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            List<Work> works = db.WorkCategories.Where(t => t.category_id == id).Select(t => t.Work).ToList();
            if (works == null)
            {
                return HttpNotFound();
            }
            db.Categories.Find(id).category_view++;
            db.SaveChanges();
            return View("FilterWork", works.OrderByDescending(t => t.work_createdate).ToPagedList(page ?? 1, PAGE_SIZE));
        }
        public ActionResult WorkDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.Find(id);
            if (work == null)
            {
                return HttpNotFound();
            }
            return View(work);
        }
    }
}