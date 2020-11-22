using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Controllers
{
    public class AjaxController : Controller
    {
        DataWork_projectEntities db = new DataWork_projectEntities();
        // GET: Ajax
        public JsonResult SaveWork(int? id)
        {
            User user = (User)Session["member"];
            if(id == null)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            Favourite favourite = new Favourite()
            {
                work_id = id,
                user_id = user.user_id,
                favourite_datecreate = DateTime.Now,
                favourite_delete = false
            };

            db.Favourites.Add(favourite);
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        public JsonResult RemoveWork(int? id)
        {
            User user = (User)Session["member"];
            if(id == null)
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
            Favourite favourite = db.Favourites.SingleOrDefault(t => t.user_id == user.user_id && t.work_id == id);
            db.Favourites.Remove(favourite);
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }
    }
}