using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;
using PagedList;
using PagedList.Mvc;

namespace ProjectWork.Controllers
{
    public class SearchController : Controller
    {
        DataWork_projectEntities db = new DataWork_projectEntities();
        private const int PAGE_SIZE = 12;
        // GET: Search
        public PartialViewResult Sematic()
        {
            return PartialView();
        }
        
    }
}