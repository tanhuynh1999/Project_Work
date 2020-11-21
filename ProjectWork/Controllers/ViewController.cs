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
            Work work = db.Works.Find(id);
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
            Employer employer = db.Employers.Find(id);
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
            List<Category> categories = db.Categories.ToList();
            return PartialView(categories);
        }
        public PartialViewResult ListSearchLocation()
        {
            List<Province> provinces = db.Provinces.ToList();
            return PartialView(provinces);
        }
    }
}