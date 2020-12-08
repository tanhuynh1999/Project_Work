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
            HttpCookie member_cookie = Request.Cookies["member_id"];
            User user = db.Users.Find(int.Parse(member_cookie.Value.ToString()));
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
        public ActionResult Create([Bind(Include = "cv_id,cv_fullname,cv_location,cv_birth,cv_phone,cv_email,cv_addpress,cv_website,cv_target,cv_interests,cv_information,cv_title,cv_img,theme_id,sex_id,user_id,cv_font,cv_size,cv_line,cv_education,cv_graduation,cv_jobexperience,cv_datejobexperience,cv_outdooractivities,cv_dateoutdooractivities,cv_certificate,cv_datecertificate,cv_prize,cv_dateprize,cv_skill,cv_dateskill")] Cv cv, HttpPostedFileBase cv_img, List<String> Education, List<DateTime> GraduationDate, List<String> JobExperience, List<DateTime> DateJobExperience, List<String> OutdoorActivities, List<DateTime> DateOutdoorActivities, List<String> Certificate, List<DateTime> DateCertificate, List<String> Prize, List<DateTime> DatePrize, List<String> Skill, List<DateTime> DateSkill)
        {

            HttpCookie member_cookie = Request.Cookies["member_id"];
            User user = db.Users.Find(int.Parse(member_cookie.Value.ToString()));

            if (ModelState.IsValid)
            {
                if (cv_img != null)
                {
                    // update new image
                    var fileimg = Guid.NewGuid().ToString() + Path.GetExtension(cv_img.FileName);
                    var pathimg = Path.Combine(Server.MapPath("~/Images/Employer"), fileimg);
                    cv.cv_img = fileimg;
                    cv_img.SaveAs(pathimg);
                }
                string addItem = "";

                // add education
                foreach (var item in Education)
                {
                    if(item != null && item != "")
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_education = addItem;
                addItem = "";
                foreach (var item in GraduationDate)
                {
                    if (item != null)
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_graduation = addItem;
                addItem = "";

                // add job experience
                foreach (var item in JobExperience)
                {
                    if (item != null && item != "")
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_jobexperience = addItem;
                addItem = "";
                foreach (var item in DateJobExperience)
                {
                    if (item != null)
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_datejobexperience = addItem;
                addItem = "";

                // add outdoor activities
                foreach (var item in OutdoorActivities)
                {
                    if (item != null && item != "")
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_outdooractivities = addItem;
                addItem = "";
                foreach (var item in DateOutdoorActivities)
                {
                    if (item != null)
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_dateoutdooractivities = addItem;
                addItem = "";

                // add certificate
                foreach (var item in Certificate)
                {
                    if (item != null && item != "")
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_certificate = addItem;
                addItem = "";
                foreach (var item in DateCertificate)
                {
                    if (item != null)
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_datecertificate = addItem;
                addItem = "";

                // add prize
                foreach (var item in Prize)
                {
                    if (item != null && item != "")
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_prize = addItem;
                addItem = "";
                foreach (var item in DatePrize)
                {
                    if (item != null)
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_dateprize = addItem;
                addItem = "";

                // add skill
                foreach (var item in Skill)
                {
                    if (item != null && item != "")
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_skill = addItem;
                addItem = "";
                foreach (var item in DateSkill)
                {
                    if (item != null)
                    {
                        addItem += item + ";";
                    }
                }
                cv.cv_dateskill = addItem;
                addItem = "";

                db.Cvs.Add(cv);
                cv.user_id = user.user_id;
                db.SaveChanges();
                return RedirectToAction("Index");
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
        public ActionResult Edit([Bind(Include = "cv_id,cv_fullname,cv_location,cv_birth,cv_phone,cv_email,cv_addpress,cv_website,cv_target,cv_interests,cv_information,cv_title,cv_img,theme_id,sex_id,user_id,cv_education,cv_graduation,cv_jobexperience,cv_datejobexperience,cv_outdooractivities,cv_dateoutdooractivities,cv_certificate,cv_datecertificate, cv_prize, cv_dateprize, cv_skill, cv_dateskill")] Cv cv)
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
            HttpCookie member_cookie = Request.Cookies["member_id"];
            User user = db.Users.Find(int.Parse(member_cookie.Value.ToString()));
            db.SubmitCVs.Add(submitCV);
            submitCV.submitcv_datesubmit = DateTime.Now;
            db.SaveChanges();

            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}
