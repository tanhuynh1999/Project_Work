using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectWork.Models;
using PagedList;

namespace ProjectWork.Controllers
{
    public class CommentsController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();
        private const int PAGE_SIZE = 5;

        // GET: Comments
        public ActionResult Index()
        {
            var comments = db.Comments.Include(c => c.Employer).Include(c => c.User);
            return View(comments.ToList());
        }

        // get comment by id employer
        public PartialViewResult GetCommentByEmployerId(int? pagecmt, int? id)
        {
            IPagedList<Comment> comments = db.Comments.Where(t => t.employer_id == id).OrderByDescending(t => t.comment_datepost).ToPagedList(pagecmt ?? 1, PAGE_SIZE);
            return PartialView(comments);
        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create(int id)
        {
            ViewBag.employer_id = id;
            return PartialView();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "comment_id,comment_contents,user_id,comment_datepost,employer_id")] Comment comment)
        {
            if(Session["member"] == null)
            {
                return HttpNotFound();
            }
            User user = (User)Session["member"];
            if (ModelState.IsValid)
            {
                comment.comment_datepost = DateTime.Now;
                comment.user_id = user.user_id;
                db.Comments.Add(comment);
                db.SaveChanges();
                ViewBag.employer_id = comment.employer_id;
                return View();
            }

            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", comment.employer_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", comment.user_id);
            return PartialView(comment);
        }

        // GET: Comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", comment.employer_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", comment.user_id);
            return View(comment);
        }

        // POST: Comments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "comment_id,comment_contents,user_id,comment_datepost,employer_id")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", comment.employer_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", comment.user_id);
            return View(comment);
        }

        // GET: Comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.Comments.Find(id);
            db.Comments.Remove(comment);
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
