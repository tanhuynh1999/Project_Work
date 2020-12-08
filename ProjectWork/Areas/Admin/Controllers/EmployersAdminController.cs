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
    public class EmployersAdminController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        // GET: Admin/EmployersAdmin
        public ActionResult Index()
        {
            var employers = db.Employers.Include(e => e.Version);
            return View(employers.ToList());
        }

        // GET: Admin/EmployersAdmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.Find(id);
            if (employer == null)
            {
                return HttpNotFound();
            }
            return View(employer);
        }

        // GET: Admin/EmployersAdmin/Create
        public ActionResult Create()
        {
            ViewBag.version_id = new SelectList(db.Versions, "version_id", "varsion_name");
            return View();
        }

        // POST: Admin/EmployersAdmin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "employer_id,employer_email,employer_pass,employer_company,employer_introduct,employer_yeartoset,employer_scale,employer_yotube,employer_product,employer_develop,employer_salary,employer_promotion,employer_datecreate,employer_datelogin,employer_dateupdate,employer_logo,employer_address,employer_fullname,employer_pageload,employer_active,employer_option,employer_banner,employer_fc,employer_website,employer_amoutwork,version_id")] Employer employer)
        {
            if (ModelState.IsValid)
            {
                db.Employers.Add(employer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.version_id = new SelectList(db.Versions, "version_id", "varsion_name", employer.version_id);
            return View(employer);
        }

        // GET: Admin/EmployersAdmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.Find(id);
            if (employer == null)
            {
                return HttpNotFound();
            }
            ViewBag.version_id = new SelectList(db.Versions, "version_id", "varsion_name", employer.version_id);
            return View(employer);
        }

        // POST: Admin/EmployersAdmin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "employer_id,employer_email,employer_pass,employer_company,employer_introduct,employer_yeartoset,employer_scale,employer_yotube,employer_product,employer_develop,employer_salary,employer_promotion,employer_datecreate,employer_datelogin,employer_dateupdate,employer_logo,employer_address,employer_fullname,employer_pageload,employer_active,employer_option,employer_banner,employer_fc,employer_website,employer_amoutwork,version_id")] Employer employer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.version_id = new SelectList(db.Versions, "version_id", "varsion_name", employer.version_id);
            return View(employer);
        }

        // GET: Admin/EmployersAdmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.Find(id);
            if (employer == null)
            {
                return HttpNotFound();
            }
            return View(employer);
        }

        // POST: Admin/EmployersAdmin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Employer employer = db.Employers.Find(id);
            db.Employers.Remove(employer);
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
