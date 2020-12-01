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

namespace ProjectWork.Controllers
{
    public class CvsController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        // GET: Cvs
        public ActionResult Index()
        {
            User user = (User)Session["member"];
            var cvs = db.Cvs.Include(c => c.Theme).Include(c => c.Sex);
            if(user == null)
            {
                return Redirect("/User/Login");
            }
            return View(cvs.Where(n=>n.user_id == user.user_id).ToList());
        }

        // GET: Cvs/Details/5
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

        public PartialViewResult Create(int? id)
        {
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name");
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_title");
            ViewBag.theme = id;
            return PartialView("Theme" + id);
        }

        // POST: Cvs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "cv_id,cv_fullname,cv_location,cv_birth,cv_phone,cv_email,cv_addpress,cv_website,cv_target,cv_interests,cv_information,cv_title,cv_img,theme_id,sex_id,user_id")] Cv cv, HttpPostedFileBase cv_img)
        {

            User user = (User)Session["member"];

            Random random = new Random();
            ViewBag.random = random.Next(1, 1000);

            var fileimg = Path.GetFileName(cv_img.FileName);
            //Lưu file
            var pa = Path.Combine(Server.MapPath("~/Images/Cv"), ViewBag.random + fileimg);
            if (ModelState.IsValid)
            {
                if (cv_img == null)
                {
                    ViewBag.ThongBao = "Chọn hình ảnh";
                    return View();
                }
                else if (System.IO.File.Exists(pa))
                {
                    ViewBag.ThongBao = "Hình ảnh đã tồn tại!";
                }
                else
                {
                    cv.cv_img = ViewBag.random + fileimg;
                    cv_img.SaveAs(pa);
                    db.Cvs.Add(cv);
                    cv.user_id = user.user_id;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }

            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_title", cv.theme_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", cv.sex_id);
            return View(cv);
        }

        // GET: Cvs/Edit/5
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
            return View(cv);
        }

        // POST: Cvs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cv_id,cv_fullname,cv_location,cv_birth,cv_phone,cv_email,cv_addpress,cv_website,cv_target,cv_interests,cv_information,cv_title,cv_img,theme_id,sex_id")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cv).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.theme_id = new SelectList(db.Themes, "theme_id", "theme_title", cv.theme_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", cv.sex_id);
            return View(cv);
        }

        // GET: Cvs/Delete/5
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

        // POST: Cvs/Delete/5
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

        // Phần phải copy lại trước khi update
        public ActionResult SubmitCv([Bind(Include = "submitcv_id,work_id,submitcv_datesubmit,cv_id")] SubmitCV submitCV)
        {
            User user = (User)Session["member"];
            db.SubmitCVs.Add(submitCV);
            submitCV.submitcv_datesubmit = DateTime.Now;
            db.SaveChanges();

            //Update ses
            Session["member"] = user;
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}
