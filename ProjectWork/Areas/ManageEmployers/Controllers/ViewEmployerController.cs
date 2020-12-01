using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Areas.ManageEmployers.Controllers
{
    public class ViewEmployerController : Controller
    {
        DataWork_projectEntities db = new DataWork_projectEntities();
        // GET: ManageEmployers/ViewEmployer
        public PartialViewResult Vali()
        {
            return PartialView();
        }
        // get a list province
        public PartialViewResult GetProvince()
        {
            List<Province> provinces = db.Provinces.ToList();
            return PartialView(provinces);
        }
        // get a list category
        public PartialViewResult GetCategory()
        {
            List<Category> categories = db.Categories.ToList();
            return PartialView(categories);
        }
    }
}