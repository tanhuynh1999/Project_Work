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
    public class EmployersProfileController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        // GET: ManageEmployers/EmployersProfile
        public ActionResult Index()
        {
            return View(db.Employers.ToList());
        }

        // GET: ManageEmployers/EmployersProfile/Details/5
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

        // GET: ManageEmployers/EmployersProfile/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ManageEmployers/EmployersProfile/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "employer_id,employer_email,employer_pass,employer_company,employer_introduct,employer_yeartoset,employer_scale,employer_yotube,employer_product,employer_develop,employer_salary,employer_promotion,employer_datecreate,employer_datelogin,employer_dateupdate,employer_logo,employer_address,employer_fullname")] Employer employer)
        {
            Employer ses = (Employer)Session["employer"];
            if (ModelState.IsValid)
            {
                db.Employers.Add(employer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(employer);
        }

        // GET: ManageEmployers/EmployersProfile/Edit/5
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
            return View(employer);
        }

        // POST: ManageEmployers/EmployersProfile/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "employer_id,employer_email,employer_pass,employer_company,employer_introduct,employer_yeartoset,employer_scale,employer_yotube,employer_product,employer_develop,employer_salary,employer_promotion,employer_datecreate,employer_datelogin,employer_dateupdate,employer_logo,employer_address,employer_fullname,employer_banner,employer_fc,employer_website")] Employer employer)
        {
            Employer ses = (Employer)Session["employer"];
            employer.employer_pageload = true;
            employer.employer_active = false;
            employer.employer_option = true;
            employer.employer_email = ses.employer_email;
            employer.employer_pass = ses.employer_pass;
            employer.employer_fullname = ses.employer_fullname;
            employer.employer_dateupdate = DateTime.Now;
            db.Entry(employer).State = EntityState.Modified;
            db.SaveChanges();

            Session["employer"] = employer;
            return RedirectToAction("Index");
        }

        // GET: ManageEmployers/EmployersProfile/Delete/5
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

        // POST: ManageEmployers/EmployersProfile/Delete/5
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
