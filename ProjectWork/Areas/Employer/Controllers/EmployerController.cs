using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWork.Areas.Employer.Controllers
{
    public class EmployerController : Controller
    {
        // GET: Employer/Employer
        // Dang nhap xong nó sẽ đá qua trang _LayoutManagerEmployer
        // Controller thì m cứ phân ra : work,cv kèm Employer (WorkEmployer) kế thừa layout _LayoutManagerEmployer chứ không phải _LayoutEmployer
        // _LayoutEmployer chỉ giói thieu 
        public PartialViewResult Login()
        {
            return PartialView();
        }
        public PartialViewResult Reg()
        {
            return PartialView();
        }
    }
}