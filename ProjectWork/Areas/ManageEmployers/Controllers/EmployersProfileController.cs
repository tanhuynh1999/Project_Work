﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
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
            HttpCookie employer_cookie = Request.Cookies["employer_id"];
            if (id == null || employer_cookie == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.Find(int.Parse(employer_cookie.Value.ToString()));
            if (employer == null || employer.employer_id != id)
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
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "employer_id,employer_email,employer_pass,employer_company,employer_introduct,employer_yeartoset,employer_scale,employer_yotube,employer_product,employer_develop,employer_salary,employer_promotion,employer_datecreate,employer_datelogin,employer_dateupdate,employer_logo,employer_address,employer_fullname,employer_banner,employer_fc,employer_website,employer_version,employer_amoutwork,version_id,employer_del")] Employer employer, HttpPostedFileBase file_img_banner, HttpPostedFileBase file_img_logo, int[] provinces, int[] categories)
        {
            // default
            employer.employer_dateupdate = DateTime.Now;

            // update banner
            if (file_img_banner != null)
            {
                // delete old image
                if(employer.employer_banner != null)
                {
                    string fullPath = Request.MapPath("~/Images/Employer/" + employer.employer_banner);
                    System.IO.File.Delete(fullPath);
                }
                // update new image
                var imgBanner = Guid.NewGuid().ToString() + Path.GetExtension(file_img_banner.FileName);
                var pathimg = Path.Combine(Server.MapPath("~/Images/Employer"), imgBanner);
                file_img_banner.SaveAs(pathimg);
                employer.employer_banner = imgBanner;
            }

            // update logo
            if (file_img_logo != null)
            {
                // delete old image
                if (employer.employer_logo != null)
                {
                    string fullPath = Request.MapPath("~/Images/Employer/" + employer.employer_logo);
                    System.IO.File.Delete(fullPath);
                }
                // update new image
                var imgLogo = Guid.NewGuid().ToString() + Path.GetExtension(file_img_logo.FileName);
                var pathimg = Path.Combine(Server.MapPath("~/Images/Employer"), imgLogo);
                file_img_logo.SaveAs(pathimg);
                employer.employer_logo = imgLogo;
            }

            db.Entry(employer).State = EntityState.Modified;
            db.SaveChanges();

            // update province
            List<WorkProvince> removeProvinces = db.WorkProvinces.Where(t => t.employer_id == employer.employer_id).ToList();
            foreach(var item in removeProvinces)
            {
                db.WorkProvinces.Remove(item);
            }
            db.SaveChanges();
            foreach(var item in provinces)
            {
                WorkProvince workProvince = new WorkProvince()
                {
                    employer_id = employer.employer_id,
                    province_id = item
                };
                db.WorkProvinces.Add(workProvince);
                db.SaveChanges();
            }

            // update cateogories
            List<WorkCategory> removeCategories = db.WorkCategories.Where(t => t.employer_id == employer.employer_id).ToList();
            foreach (var item in removeCategories)
            {
                db.WorkCategories.Remove(item);
            }
            db.SaveChanges();
            foreach (var item in categories)
            {
                WorkCategory workCategory = new WorkCategory()
                {
                    employer_id = employer.employer_id,
                    category_id = item
                };
                db.WorkCategories.Add(workCategory);
                db.SaveChanges();
            }
            return Redirect("/ManageEmployers/HomeManage/Index");
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
