using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Controllers
{
    public class SubmitCVsController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        // GET: SubmitCVs
        public ActionResult Index()
        {
            var submitCVs = db.SubmitCVs.Include(s => s.Work).Include(s => s.Cv);
            return View(submitCVs.ToList());
        }

        // GET: SubmitCVs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubmitCV submitCV = db.SubmitCVs.Find(id);
            if (submitCV == null)
            {
                return HttpNotFound();
            }
            return View(submitCV);
        }

        // GET: SubmitCVs/Create
        public ActionResult Create()
        {
            ViewBag.work_id = new SelectList(db.Works, "work_id", "work_name");
            ViewBag.cv_id = new SelectList(db.Cvs, "cv_id", "cv_fullname");
            return View();
        }

        // POST: SubmitCVs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "submitcv_id,work_id,submitcv_datesubmit,cv_id")] SubmitCV submitCV)
        {
            if (ModelState.IsValid)
            {
                db.SubmitCVs.Add(submitCV);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.work_id = new SelectList(db.Works, "work_id", "work_name", submitCV.work_id);
            ViewBag.cv_id = new SelectList(db.Cvs, "cv_id", "cv_fullname", submitCV.cv_id);
            return View(submitCV);
        }

        // GET: SubmitCVs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubmitCV submitCV = db.SubmitCVs.Find(id);
            if (submitCV == null)
            {
                return HttpNotFound();
            }
            ViewBag.work_id = new SelectList(db.Works, "work_id", "work_name", submitCV.work_id);
            ViewBag.cv_id = new SelectList(db.Cvs, "cv_id", "cv_fullname", submitCV.cv_id);
            return View(submitCV);
        }

        // POST: SubmitCVs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "submitcv_id,work_id,submitcv_datesubmit,cv_id")] SubmitCV submitCV)
        {
            if (ModelState.IsValid)
            {
                db.Entry(submitCV).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.work_id = new SelectList(db.Works, "work_id", "work_name", submitCV.work_id);
            ViewBag.cv_id = new SelectList(db.Cvs, "cv_id", "cv_fullname", submitCV.cv_id);
            return View(submitCV);
        }

        // GET: SubmitCVs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubmitCV submitCV = db.SubmitCVs.Find(id);
            if (submitCV == null)
            {
                return HttpNotFound();
            }
            return View(submitCV);
        }

        // POST: SubmitCVs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SubmitCV submitCV = db.SubmitCVs.Find(id);
            db.SubmitCVs.Remove(submitCV);
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
