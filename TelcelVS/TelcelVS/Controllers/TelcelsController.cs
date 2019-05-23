using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TelcelVS.Models;

namespace TelcelVS.Controllers
{
    public class TelcelsController : Controller
    {
        private TelcelDBEntities db = new TelcelDBEntities();

        // GET: Telcels
        public ActionResult Index()
        {
            var telcel = db.Telcel.Include(t => t.Telefono).Include(t => t.Usuario);
            return View(telcel.ToList());
        }

        // GET: Telcels/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Telcel telcel = db.Telcel.Find(id);
            if (telcel == null)
            {
                return HttpNotFound();
            }
            return View(telcel);
        }

        // GET: Telcels/Create
        public ActionResult Create()
        {
            ViewBag.IdTelefono = new SelectList(db.Telefono, "Id", "Nombre");
            ViewBag.NombreUsuario = new SelectList(db.Usuario, "Nombre", "Contraseña");
            return View();
        }

        // POST: Telcels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,NombreUsuario,IdTelefono")] Telcel telcel)
        {
            if (ModelState.IsValid)
            {
                db.Telcel.Add(telcel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdTelefono = new SelectList(db.Telefono, "Id", "Nombre", telcel.IdTelefono);
            ViewBag.NombreUsuario = new SelectList(db.Usuario, "Nombre", "Contraseña", telcel.NombreUsuario);
            return View(telcel);
        }

        // GET: Telcels/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Telcel telcel = db.Telcel.Find(id);
            if (telcel == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdTelefono = new SelectList(db.Telefono, "Id", "Nombre", telcel.IdTelefono);
            ViewBag.NombreUsuario = new SelectList(db.Usuario, "Nombre", "Contraseña", telcel.NombreUsuario);
            return View(telcel);
        }

        // POST: Telcels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,NombreUsuario,IdTelefono")] Telcel telcel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(telcel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdTelefono = new SelectList(db.Telefono, "Id", "Nombre", telcel.IdTelefono);
            ViewBag.NombreUsuario = new SelectList(db.Usuario, "Nombre", "Contraseña", telcel.NombreUsuario);
            return View(telcel);
        }

        // GET: Telcels/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Telcel telcel = db.Telcel.Find(id);
            if (telcel == null)
            {
                return HttpNotFound();
            }
            return View(telcel);
        }

        // POST: Telcels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Telcel telcel = db.Telcel.Find(id);
            db.Telcel.Remove(telcel);
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
