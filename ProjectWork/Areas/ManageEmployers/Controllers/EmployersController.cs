using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;

namespace ProjectWork.Areas.ManageEmployers.Controllers
{
    public class EmployersController : Controller
    {
        // GET: Employer/Employer
        // Dang nhap xong nó sẽ đá qua trang _LayoutManagerEmployer
        // Controller thì m cứ phân ra : work,cv kèm Employer (WorkEmployer) kế thừa layout _LayoutManagerEmployer chứ không phải _LayoutEmployer
        // _LayoutEmployer chỉ giói thieu 
        DataWork_projectEntities db = new DataWork_projectEntities();
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(ViewLogIn log)
        {
            bool employer = db.Employers.SingleOrDefault(t => t.employer_email == log.UserName && t.employer_pass == log.Password) != null;
            if (employer)
            {
                Session["employer"] = db.Employers.SingleOrDefault(t => t.employer_email == log.UserName && t.employer_pass == log.Password);
                return Redirect("/ManageEmployers/HomeManage/Index");
            }
            ViewBag.Notification_Login_Employer = "Sai roi dmm";
            return View(log);
        }
        public ActionResult Reg()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reg(ViewReg reg)
        {
            if (ModelState.IsValid)
            {
                if(db.Employers.SingleOrDefault(t => t.employer_email == reg.Email) != null)
                {
                    ViewBag.Notification_Login_Employer = "Email da ton tai";
                    return View(reg);
                }
                Employer employer = new Employer()
                {
                    employer_email = reg.Email,
                    employer_pass = reg.Password,
                    employer_fullname = reg.DisplayName
                };
                db.Employers.Add(employer);
                db.SaveChanges();

                Session["employer"] = employer;
                return RedirectToAction("EditInfo");
            }
            ViewBag.Notification_Login_Employer = "Sai roi dmm";
            return View(reg);
        }
        public ActionResult EditInfo()
        {
            if (Session["employer"] == null)
            {
                return RedirectToAction("Login");
            }
            Employer employer = (Employer)Session["employer"];
            return View(employer);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditInfo([Bind(Include = "employer_id,employer_email,employer_pass,employer_fullname,employer_company,employer_position,employer_address,employer_phone,employer_token,employer_datelogin,employer_datecreated,employer_active,employer_status,employer_logo,employer_specialized,employer_version,employer_option,employer_personalpage,employer_name,employer_introduce,employer_linkfc,employer_recruitment,employer_addressmain,employer_ifamemapmain,employer_addresstwo,employer_ifamemaptwo,employer_addressthree,employer_ifamemapthree,employer_province,employer_recrequirement,employer_limit,employer_emailcompany,employer_banner,employer_scale,employer_bonus,employer_foundedyear")] Employer employer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employer).State = EntityState.Modified;
                db.SaveChanges();

                // save again to sesstion
                Session["employer"] = employer;
                return RedirectToAction("Index");
            }
            return View(employer);
        }
    }
}