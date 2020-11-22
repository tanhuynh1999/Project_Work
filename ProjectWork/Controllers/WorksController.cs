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
using PagedList.Mvc;

namespace ProjectWork.Controllers
{
    public class WorksController : Controller
    {
        private DataWork_projectEntities db = new DataWork_projectEntities();
        private const int PAGE_SIZE = 12;

        // GET: Works
        public ActionResult Index()
        {
            return View(db.Works.ToList());
        }
        // filter work
        public ActionResult FilterWorkByCatId(int? id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            List<Work> works = db.WorkCategories.Where(t => t.category_id == id).Select(t => t.Work).ToList();
            if (works == null)
            {
                return HttpNotFound();
            }
            db.Categories.Find(id).category_view++;
            db.SaveChanges();
            ViewBag.Title = "Tìm kiếm theo danh mục";
            Category category = db.Categories.Find(id);
            Search search = db.Searches.FirstOrDefault(t => t.search_key.Contains(category.category_name));
            if (search != null)
            {
                db.Searches.FirstOrDefault(t => t.search_key.Contains(category.category_name)).search_count++;
                db.Searches.FirstOrDefault(t => t.search_key.Contains(category.category_name)).search_date = DateTime.Now;
                db.SaveChanges();
            }
            else
            {
                Search addItemSearch = new Search()
                {
                    search_key = category.category_name,
                    search_count = 1,
                    search_date = DateTime.Now
                };
                db.Searches.Add(addItemSearch);
                db.SaveChanges();
            }
            ViewBag.CountWork = works.Count;
            return View("FilterWork", works.OrderByDescending(t => t.work_createdate).ToPagedList(page ?? 1, PAGE_SIZE));
        }
        public ActionResult MultipleSearchHome(int? page, string keyword, int? category, int? location)
        {
            List<Work> works = new List<Work>();
            if (category != null && location != null)
            {
                works = db.WorkCategories.Where(t => t.category_id == category).Select(t => t.Work).Where(t => t.province_id == location).ToList();

                // add or update view search suggestion category
                Category tblcategory = db.Categories.Find(category);
                Search search = db.Searches.FirstOrDefault(t => t.search_key.Contains(tblcategory.category_name));
                if (search != null)
                {
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(tblcategory.category_name)).search_count++;
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(tblcategory.category_name)).search_date = DateTime.Now;
                    db.SaveChanges();
                }
                else
                {
                    Search addItemSearch = new Search()
                    {
                        search_key = tblcategory.category_name,
                        search_count = 1,
                        search_date = DateTime.Now
                    };
                    db.Searches.Add(addItemSearch);
                    db.SaveChanges();
                }

                // add or update view search suggestion location
                Province province = db.Provinces.Find(location);
                Search search1 = db.Searches.FirstOrDefault(t => t.search_key.Contains(province.province_name));
                if (search1 != null)
                {
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(province.province_name)).search_count++;
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(province.province_name)).search_date = DateTime.Now;
                    db.SaveChanges();
                }
                else
                {
                    Search addItemSearch = new Search()
                    {
                        search_key = province.province_name,
                        search_count = 1,
                        search_date = DateTime.Now
                    };
                    db.Searches.Add(addItemSearch);
                    db.SaveChanges();
                }

            }
            else if (category != null && location == null)
            {
                works = db.WorkCategories.Where(t => t.category_id == category).Select(t => t.Work).ToList();

                // add or update view search suggestion category
                Category tblcategory = db.Categories.Find(category);
                Search search = db.Searches.FirstOrDefault(t => t.search_key.Contains(tblcategory.category_name));
                if (search != null)
                {
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(tblcategory.category_name)).search_count++;
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(tblcategory.category_name)).search_date = DateTime.Now;
                    db.SaveChanges();
                }
                else
                {
                    Search addItemSearch = new Search()
                    {
                        search_key = tblcategory.category_name,
                        search_count = 1,
                        search_date = DateTime.Now
                    };
                    db.Searches.Add(addItemSearch);
                    db.SaveChanges();
                }
            }
            else if (location != null && category == null)
            {
                works = db.Works.Where(t => t.province_id == category).ToList();

                // add or update view search suggestion location
                Province province = db.Provinces.Find(location);
                Search search1 = db.Searches.FirstOrDefault(t => t.search_key.Contains(province.province_name));
                if (search1 != null)
                {
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(province.province_name)).search_count++;
                    db.Searches.FirstOrDefault(t => t.search_key.Contains(province.province_name)).search_date = DateTime.Now;
                    db.SaveChanges();
                }
                else
                {
                    Search addItemSearch = new Search()
                    {
                        search_key = province.province_name,
                        search_count = 1,
                        search_date = DateTime.Now
                    };
                    db.Searches.Add(addItemSearch);
                    db.SaveChanges();
                }
            }
            ViewBag.Title = "Tìm kiếm việc làm";
            works = works.Where(t => t.work_name.Contains(keyword)).ToList();
            Search search2 = db.Searches.FirstOrDefault(t => t.search_key.Contains(keyword));
            if (search2 != null)
            {
                db.Searches.FirstOrDefault(t => t.search_key.Contains(keyword)).search_count++;
                db.Searches.FirstOrDefault(t => t.search_key.Contains(keyword)).search_date = DateTime.Now;
                db.SaveChanges();
            }
            else
            {
                if(keyword != null || keyword != "")
                {
                    Search addItemSearch = new Search()
                    {
                        search_key = keyword,
                        search_count = 1,
                        search_date = DateTime.Now
                    };
                    db.Searches.Add(addItemSearch);
                    db.SaveChanges();
                }
            }
            ViewBag.CountWork = works.Count;
            return View("FilterWork", works.ToPagedList(page ?? 1, PAGE_SIZE));
        }

        // favorite wwork
        public ActionResult WorksCollection(int? page)
        {
            if(Session["member"] == null)
            {
                return Redirect("/User/Login");
            }
            User user = (User)Session["member"];
            IPagedList<Work> works = db.Favourites.Where(t => t.user_id == user.user_id).OrderByDescending(t => t.favourite_datecreate).Select(t => t.Work).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(works);
        }

        public ActionResult PopularKeyWord(int? page, string key)
        {
            ViewBag.Title = "Từ khóa phổ biến";
            List<Work> searchWork = db.Works.Where(t => t.work_name.Contains(key) || t.Province.province_name.Contains(key) || t.WorkCategories.Select(n => n.Category).Select(x => x.category_name).Contains(key)).ToList();
            ViewBag.CountWork = searchWork.Count;
            return View("FilterWork", searchWork.ToPagedList(page ?? 1, PAGE_SIZE));
        }
        // GET: Works/Details/5
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

        // GET: Works/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Works/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "work_id,work_name,work_img,work_deadline,work_createdate,work_description,work_request,work_benefit,work_address,work_money,work_amount,work_active,work_option,work_view,work_exp,work_sex,work_del,work_status,work_dateupdate")] Work work)
        {
            if (ModelState.IsValid)
            {
                db.Works.Add(work);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(work);
        }

        // GET: Works/Edit/5
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
            return View(work);
        }

        // POST: Works/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "work_id,work_name,work_img,work_deadline,work_createdate,work_description,work_request,work_benefit,work_address,work_money,work_amount,work_active,work_option,work_view,work_exp,work_sex,work_del,work_status,work_dateupdate")] Work work)
        {
            if (ModelState.IsValid)
            {
                db.Entry(work).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(work);
        }

        // GET: Works/Delete/5
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

        // POST: Works/Delete/5
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
