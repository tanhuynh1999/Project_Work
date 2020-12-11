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
        public ActionResult WorkDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.SingleOrDefault(t => t.work_id == id && t.work_del == false);
            if (work == null)
            {
                return HttpNotFound();
            }
            return View(work);
        }
        public ActionResult EmployerDetais(int ?id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.SingleOrDefault(t => t.employer_id == id && t.employer_del == false);
            if (employer == null)
            {
                return HttpNotFound();
            }
            return View(employer);
        }
        public PartialViewResult Search()
        {
            return PartialView();
        }
        public PartialViewResult ListSearchCategory()
        {
            List<Category> categories = db.Categories.Where(t => t.category_del == false).ToList();
            return PartialView(categories);
        }
        public PartialViewResult ListSearchLocation()
        {
            List<Province> provinces = db.Provinces.Where(t => t.province_del == false).ToList();
            return PartialView(provinces);
        }
        public PartialViewResult ButtonPoint(int ?id)
        {
            ViewBag.theme = id;
            return PartialView();
        }
        
    }
}