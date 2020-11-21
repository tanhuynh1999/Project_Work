using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWork.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        public PartialViewResult Sematic()
        {
            return PartialView();
        }
    }
}