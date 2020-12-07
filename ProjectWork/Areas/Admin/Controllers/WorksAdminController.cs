using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Areas.Admin.Controllers
{
    public class WorksAdminController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        public JsonResult IndexWork()
        {
            var works = db.Works.ToList();
            return new JsonResult { Data = works, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
        // GET: Admin/WorksAdmin
        public ActionResult Index()
        {
            var works = db.Works.Include(w => w.ExpYear).Include(w => w.Position).Include(w => w.Province).Include(w => w.Sex).Include(w => w.Form).Include(w => w.Employer);
            return View(works.ToList());
        }

        // GET: Admin/WorksAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.Find(id);
            if (work == null)
            {
                return HttpNotFound();
            }
            return View(work);
        }

        // GET: Admin/WorksAdmin/Create
        public ActionResult Create()
        {
            ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name");
            ViewBag.position_id = new SelectList(db.Positions, "position_id", "position_name");
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name");
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name");
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name");
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email");
            return View();
        }

        // POST: Admin/WorksAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "work_id,work_name,work_img,work_deadline,work_createdate,work_description,work_request,work_benefit,work_address,work_money,work_amount,work_active,work_option,work_view,work_del,work_status,work_dateupdate,employer_id,position_id,sex_id,province_id,expyear_id,form_id")] Work work)
        {
            if (ModelState.IsValid)
            {
                db.Works.Add(work);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name", work.expyear_id);
            ViewBag.position_id = new SelectList(db.Positions, "position_id", "position_name", work.position_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", work.sex_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            return View(work);
        }

        // GET: Admin/WorksAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.Find(id);
            if (work == null)
            {
                return HttpNotFound();
            }
            ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name", work.expyear_id);
            ViewBag.position_id = new SelectList(db.Positions, "position_id", "position_name", work.position_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", work.sex_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            return View(work);
        }

        // POST: Admin/WorksAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "work_id,work_name,work_img,work_deadline,work_createdate,work_description,work_request,work_benefit,work_address,work_money,work_amount,work_active,work_option,work_view,work_del,work_status,work_dateupdate,employer_id,position_id,sex_id,province_id,expyear_id,form_id")] Work work)
        {
            if (ModelState.IsValid)
            {
                db.Entry(work).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name", work.expyear_id);
            ViewBag.position_id = new SelectList(db.Positions, "position_id", "position_name", work.position_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", work.sex_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            return View(work);
        }

        // GET: Admin/WorksAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.Find(id);
            if (work == null)
            {
                return HttpNotFound();
            }
            return View(work);
        }

        // POST: Admin/WorksAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Work work = db.Works.Find(id);
            db.Works.Remove(work);
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
