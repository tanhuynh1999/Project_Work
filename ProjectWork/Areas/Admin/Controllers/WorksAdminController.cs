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
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "work_id,work_name,work_img,work_deadline,work_createdate,work_description,work_request,work_benefit,work_address,work_money,work_amount,work_active,work_option,work_view,work_del,work_status,work_dateupdate,employer_id,position_id,sex_id,province_id,expyear_id,form_id,work_email, work_nickname")] Work work, HttpPostedFileBase file_img, int[] cat_id, int[] pro_id)
        {
            if (ModelState.IsValid)
            {
                // update avata
                if (file_img != null)
                {
                    // delete old image
                    if (work.work_img != null)
                    {
                        string fullPath = Request.MapPath("~/Images/Work/" + work.work_img);
                        System.IO.File.Delete(fullPath);
                    }
                    // update new image
                    var img = Guid.NewGuid().ToString() + Path.GetExtension(file_img.FileName);
                    var pathimg = Path.Combine(Server.MapPath("~/Images/Work"), img);
                    file_img.SaveAs(pathimg);
                    work.work_img = img;
                }
                db.Entry(work).State = EntityState.Modified;
                db.SaveChanges();

                // add categoris
                List<WorkCategory> workCategories = db.WorkCategories.Where(t => t.work_id == work.work_id).ToList();
                foreach (var item in workCategories)
                {
                    db.WorkCategories.Remove(item);
                }
                db.SaveChanges();
                foreach(var item in cat_id)
                {
                    WorkCategory addItem = new WorkCategory()
                    {
                        category_id = item,
                        work_id = work.work_id
                    };
                    db.WorkCategories.Add(addItem);
                }
                db.SaveChanges();

                // add provinces
                List<WorkProvince> workProvinces = db.WorkProvinces.Where(t => t.work_id == work.work_id).ToList();
                foreach (var item in workProvinces)
                {
                    db.WorkProvinces.Remove(item);
                }
                db.SaveChanges();
                foreach (var item in pro_id)
                {
                    WorkProvince addItem = new WorkProvince()
                    {
                        province_id = item,
                        work_id = work.work_id
                    };
                    db.WorkProvinces.Add(addItem);
                }
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
