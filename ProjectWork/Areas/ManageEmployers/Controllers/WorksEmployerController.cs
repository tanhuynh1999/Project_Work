﻿using System;
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
    public class WorksEmployerController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();

        // GET: ManageEmployers/WorksEmployer
        public ActionResult Index()
        {
            var works = db.Works.Include(w => w.Employer).Include(w => w.ExpYear).Include(w => w.Position).Include(w => w.Province).Include(w => w.Sex).Include(w => w.Form);
            return View(works.ToList());
        }

        // GET: ManageEmployers/WorksEmployer/Details/5
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

        // GET: ManageEmployers/WorksEmployer/Create
        public ActionResult Create()
        {
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email");
            ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name");
            ViewBag.positions = new SelectList(db.Positions, "position_id", "position_name");
            ViewBag.provinces = new SelectList(db.Provinces, "province_id", "province_name");
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name");
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name");
            return View();
        }

        // POST: ManageEmployers/WorksEmployer/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "work_id,work_name,work_img,work_deadline,work_createdate,work_description,work_request,work_benefit,work_address,work_money,work_amount,work_active,work_option,work_view,work_del,work_status,work_dateupdate,employer_id,position_id,sex_id,province_id,expyear_id,form_id,employer_version,employer_amoutwork,work_phoe,work_email,work_nickname")] Work work, List<HttpPostedFileBase> mul_file_img_viewmore, int[] provinces, int[] category)
        {
            if(Session["employer"] == null)
            {
                return Redirect("/ManageEmployers/Employers/Login");
            }
            Employer employer = (Employer)Session["employer"];
            if (ModelState.IsValid)
            {
                // default 
                work.work_createdate = DateTime.Now;
                work.employer_id = employer.employer_id;
                work.work_active = false;
                work.work_del = false;
                work.work_option = true;
                work.work_view = 0;
                work.work_dateupdate = DateTime.Now;
                if(work.work_deadline == null)
                {
                    work.work_deadline = DateTime.Now.AddDays(30);
                }
                // add images

                db.Works.Add(work);
                db.SaveChanges();

                // add provinces
                Work work1 = db.Works.Where(t => t.work_name == work.work_name && t.work_active == false).OrderByDescending(t => t.work_dateupdate).First();
                foreach (var item in provinces)
                {
                    WorkProvince workProvince = new WorkProvince()
                    {
                        work_id = work1.work_id,
                        province_id = item,
                    };
                    db.WorkProvinces.Add(workProvince);
                }
                // add categories
                foreach(var item in category)
                {
                    WorkCategory workCategory = new WorkCategory()
                    {
                        work_id = work1.work_id,
                        category_id = item,
                    };
                    db.WorkCategories.Add(workCategory);
                }
                db.SaveChanges();

                Session["employer"] = employer;
                return RedirectToAction("Index");
            }

            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name", work.expyear_id);
            ViewBag.positions = new SelectList(db.Positions, "position_id", "position_name", work.position_id);
            ViewBag.provinces = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", work.sex_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            return View(work);
        }

        // GET: ManageEmployers/WorksEmployer/Edit/5
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
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name", work.expyear_id);
            ViewBag.position_id = new SelectList(db.Positions, "position_id", "position_name", work.position_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", work.sex_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            return View(work);
        }

        // POST: ManageEmployers/WorksEmployer/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "work_id,work_name,work_img,work_deadline,work_createdate,work_description,work_request,work_benefit,work_address,work_money,work_amount,work_active,work_option,work_view,work_del,work_status,work_dateupdate,employer_id,position_id,sex_id,province_id,expyear_id,form_id")] Work work)
        {
            if (ModelState.IsValid)
            {
                // default 
                ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
                ViewBag.expyear_id = new SelectList(db.ExpYears, "expyear_id", "expyear_name", work.expyear_id);
                ViewBag.position_id = new SelectList(db.Positions, "position_id", "position_name", work.position_id);
                ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
                ViewBag.sex_id = new SelectList(db.Sexes, "sex_id", "sex_name", work.sex_id);
                ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);

                // add image


                // add provinces

                
                // add categories

                db.Entry(work).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(work);
        }

        // GET: ManageEmployers/WorksEmployer/Delete/5
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

        // POST: ManageEmployers/WorksEmployer/Delete/5
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
