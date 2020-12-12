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
    public class RepliesController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();
        private const int PAGE_SIZE = 5;

        // GET: Replies
        public ActionResult Index()
        {
            var replies = db.Replies.Include(r => r.Comment).Include(r => r.User);
            return View(replies.ToList());
        }

        // get comment by id employer
        public PartialViewResult GetrRepByCommentId(int? pagerep, int? id)
        {
            IPagedList<Reply> replies = db.Replies.Where(t => t.comment_id == id && t.rep_del == false).OrderByDescending(t => t.rep_datepost).ToPagedList(pagerep ?? 1, PAGE_SIZE);
            return PartialView(replies);
        }

        // GET: Replies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reply reply = db.Replies.Find(id);
            if (reply == null)
            {
                return HttpNotFound();
            }
            return View(reply);
        }

        // GET: Replies/Create
        public ActionResult Create()
        {
            ViewBag.comment_id = new SelectList(db.Comments, "comment_id", "comment_contents");
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email");
            return View();
        }

        // POST: Replies/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "rep_id,rep_contents,comment_id,user_id,rep_datepost")] Reply reply)
        {
            if (ModelState.IsValid)
            {
                db.Replies.Add(reply);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.comment_id = new SelectList(db.Comments, "comment_id", "comment_contents", reply.comment_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", reply.user_id);
            return View(reply);
        }

        // GET: Replies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reply reply = db.Replies.Find(id);
            if (reply == null)
            {
                return HttpNotFound();
            }
            ViewBag.comment_id = new SelectList(db.Comments, "comment_id", "comment_contents", reply.comment_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", reply.user_id);
            return View(reply);
        }

        // POST: Replies/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "rep_id,rep_contents,comment_id,user_id,rep_datepost")] Reply reply)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reply).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.comment_id = new SelectList(db.Comments, "comment_id", "comment_contents", reply.comment_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_email", reply.user_id);
            return View(reply);
        }

        // GET: Replies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reply reply = db.Replies.Find(id);
            if (reply == null)
            {
                return HttpNotFound();
            }
            return View(reply);
        }

        // POST: Replies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reply reply = db.Replies.Find(id);
            db.Replies.Remove(reply);
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
