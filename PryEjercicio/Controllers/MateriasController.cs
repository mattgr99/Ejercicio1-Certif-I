using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BEUEjercicio;
using BEUEjercicio.Transactions;

namespace PryEjercicio.Controllers
{
    public class MateriasController : Controller
    {

        // GET: Materias
        public ActionResult Index()
        {
            
            return View(MateriaBLL.List());
        }

        // GET: Materias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Materia materia = MateriaBLL.Get(id);
            if (materia == null)
            {
                return HttpNotFound();
            }
            return View(materia);
        }

        // GET: Materias/Create
        public ActionResult Create()
        {
            ViewBag.idarea = new SelectList(AreaBLL.List(), "idarea", "nombre");
            return View();
        }

        // POST: Materias/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idmateria,nombre,nrc,creditos,idarea")] Materia materia)
        {
            if (ModelState.IsValid)
            {
                MateriaBLL.Create(materia);
                return RedirectToAction("Index");
            }

            ViewBag.idarea = new SelectList(AreaBLL.List(), "idarea", "nombre", materia.idarea);
            return View(materia);
        }

        // GET: Materias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Materia materia =MateriaBLL.Get(id);
            if (materia == null)
            {
                return HttpNotFound();
            }
            ViewBag.idarea = new SelectList(AreaBLL.List(), "idarea", "nombre", materia.idarea);
            return View(materia);
        }

        // POST: Materias/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idmateria,nombre,nrc,creditos,idarea")] Materia materia)
        {
            if (ModelState.IsValid)
            {
                MateriaBLL.Update(materia);
                return RedirectToAction("Index");
            }
            ViewBag.idarea = new SelectList(AreaBLL.List(), "idarea", "nombre", materia.idarea);
            return View(materia);
        }

        // GET: Materias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Materia materia = MateriaBLL.Get(id);
            if (materia == null)
            {
                return HttpNotFound();
            }
            return View(materia);
        }

        // POST: Materias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MateriaBLL.Delete(id);

            return RedirectToAction("Index");
        }

        
    }
}
