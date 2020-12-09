using ProjectWork.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
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
                User logUser = db.Users.SingleOrDefault(t => t.user_email == reg.Email && t.user_pass == reg.Password && t.user_active == true && t.user_del == false);
                HttpCookie cookie = new HttpCookie("member_id", logUser.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);

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
                ViewBag.tbsai = false;
                HttpCookie cookie = new HttpCookie("member_id", user.user_id.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                return PartialView(log);
            }
            ViewBag.tbsai = true;
            return PartialView(log);
        }

        public ActionResult Logout()
        {
            HttpCookie cookie = Request.Cookies["member_id"];
            cookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Set(cookie);
            return RedirectToAction("LogIn");
        }

        // account manager
        public ActionResult MyInfo()
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            User user = db.Users.Find(int.Parse(member_cookie.Value.ToString()));
            return View(user);
        }

        public ActionResult ResetPassword()
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            User user = db.Users.Find(int.Parse(member_cookie.Value.ToString()));
            return View(user);
        }
        [HttpPost]
        public ActionResult ResetPassword(ViewResetPass resetPass)
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            User user = db.Users.Find(int.Parse(member_cookie.Value.ToString()));
            if (ModelState.IsValid)
            {
                user.user_pass = resetPass.NewPassword;
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                Session["resetPass"] = "Đổi mật khẩu thành công!";
                return RedirectToAction("MyInfo");
            }
            return View(resetPass);
        }
        // update info
        public ActionResult Edit()
        {
            HttpCookie member_cookie = Request.Cookies["member_id"];
            if (member_cookie == null)
            {
                return Redirect("/User/Login");
            }
            User user = db.Users.Find(int.Parse(member_cookie.Value.ToString()));
            return View(user);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "user_id,user_email,user_pass,user_name,user_active,user_del,user_datecreate,user_datelogin,user_img,user_sex,user_interests")] User user, HttpPostedFileBase file_img)
        {
            if (ModelState.IsValid)
            {
                // update avata
                if (file_img != null)
                {
                    // delete old image
                    if (user.user_img != null)
                    {
                        string fullPath = Request.MapPath("~/Images/User/" + user.user_img);
                        System.IO.File.Delete(fullPath);
                    }
                    // update new image
                    var img = Guid.NewGuid().ToString() + Path.GetExtension(file_img.FileName);
                    var pathimg = Path.Combine(Server.MapPath("~/Images/User"), img);
                    file_img.SaveAs(pathimg);
                    user.user_img = img;
                }

                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("MyInfo");
            }
            return View(user);
        }
    }
}