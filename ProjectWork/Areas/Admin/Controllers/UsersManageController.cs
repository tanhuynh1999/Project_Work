using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Areas.Admin.Controllers
{
    public class UsersManageController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        // GET: Admin/UsersManage
        public ActionResult Index()
        {
            return View(db.Users.ToList());
        }

        // GET: Admin/UsersManage/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admin/UsersManage/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/UsersManage/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "user_id,user_email,user_pass,user_name,user_active,user_del,user_datecreate,user_datelogin,user_img,user_sex,user_interests")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(user);
        }

        // GET: Admin/UsersManage/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/UsersManage/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
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
                return RedirectToAction("Index");
            }
            return View(user);
        }

        // GET: Admin/UsersManage/Delete/5
        public ActionResult DeleteConfirmed(int id)
        {
            db.Users.Find(id).user_del = true;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
