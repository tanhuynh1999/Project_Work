using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Areas.ManageEmployers.Controllers
{
    public class CvsEmployerController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        // GET: ManageEmployers/CvsEmployer
        public ActionResult Index()
        {
            HttpCookie employer_cookie = Request.Cookies["employer_id"];
            if (employer_cookie == null)
            {
                return Redirect("/ManageEmployers/Employers/Login");
            }
            var cvs = db.Cvs.Include(c => c.Theme).Include(c => c.Sex).Include(c => c.User);
            return View(cvs.ToList());
        }

        // GET: ManageEmployers/CvsEmployer/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            return View(cv);
        }

        // GET: ManageEmployers/CvsEmployer/Create
        public ActionResult Create()
        {
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_title");
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name");
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        // POST: ManageEmployers/CvsEmployer/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cv_id,cv_fullname,cv_location,cv_birth,cv_phone,cv_email,cv_addpress,cv_website,cv_target,cv_interests,cv_information,cv_title,cv_img,theme_id,sex_id,user_id")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                db.Cvs.Add(cv);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_title", cv.theme_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", cv.sex_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", cv.user_id);
            return View(cv);
        }

        // GET: ManageEmployers/CvsEmployer/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_title", cv.theme_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", cv.sex_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", cv.user_id);
            return View(cv);
        }

        // POST: ManageEmployers/CvsEmployer/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cv_id,cv_fullname,cv_location,cv_birth,cv_phone,cv_email,cv_addpress,cv_website,cv_target,cv_interests,cv_information,cv_title,cv_img,theme_id,sex_id,user_id")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cv).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_title", cv.theme_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", cv.sex_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", cv.user_id);
            return View(cv);
        }

        // GET: ManageEmployers/CvsEmployer/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            return View(cv);
        }

        // POST: ManageEmployers/CvsEmployer/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cv cv = db.Cvs.Find(id);
            db.Cvs.Remove(cv);
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
