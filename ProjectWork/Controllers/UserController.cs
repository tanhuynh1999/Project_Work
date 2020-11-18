using ProjectWork.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectWork.Controllers
{
    public class UserController : Controller
    {
        DataWork_projectEntities db = new DataWork_projectEntities();
        // GET: User --access to web with role member
        public ActionResult Reg()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reg(ViewReg reg)
        {
            if (ModelState.IsValid)
            {
                // register
                User user = new User()
                {
                    user_name = reg.DisplayName,
                    user_pass = reg.Password,
                    user_email = reg.Email,
                    user_datecreate = DateTime.Now,
                    user_datelogin = DateTime.Now,
                    user_active = true,
                    user_del = false
                };

                db.Users.Add(user);
                db.SaveChanges();

                // login
                Session["member"] = db.Users.SingleOrDefault(t => t.user_email == reg.Email && t.user_pass == reg.Password);

                return RedirectToAction("MyInfo");
            }
            return View(reg);
        }

        public ActionResult Login()
        {
            return View("Reg");
        }
        [HttpPost]
        public ActionResult Login(ViewLogIn log)
        {
            User user = db.Users.SingleOrDefault(t => (t.user_email == log.UserName || t.user_name == log.UserName) && t.user_pass == log.Password && t.user_active == true && t.user_del == false);
            if(user != null)
            {
                Session["member"] = user;
                return Redirect(log.ReturnUrl);
            }
            return View("Reg", log);
        }
        [HttpPost]
        public JsonResult ajaxLogin(string uname, string pass)
        {
            Boolean user = db.Users.SingleOrDefault(t => (t.user_email == uname || t.user_name == uname) && t.user_pass == pass && t.user_active == true && t.user_del == false) != null;
            return Json(user, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Logout()
        {
            Session["member"] = null;
            return RedirectToAction("LogIn");
        }

        // account manager
        public ActionResult MyInfo()
        {
            User user = (User)Session["member"];
            if(user == null)
            {
                return RedirectToAction("Login");
            }
            return View(user);
        }

        public ActionResult ResetPassword()
        {
            if(Session["member"] == null)
            {
                return RedirectToAction("Login");
            }
            User user = (User)Session["member"];
            return View(user);
        }
        [HttpPost]
        public ActionResult ResetPassword(ViewResetPass resetPass)
        {
            User user = (User)Session["member"];
            if (ModelState.IsValid)
            {
                user.user_pass = resetPass.NewPassword;
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

                Session["member"] = user;
                Session["resetPass"] = "Đổi mật khẩu thành công!";
                return RedirectToAction("MyInfo");
            }
            return View(resetPass);
        }
    }
}