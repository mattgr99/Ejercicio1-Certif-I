using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class MateriaBLL
    {
        public static void Create(Materia a)
        {
            using (DBEntities db = new DBEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Materia.Add(a);
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static Materia Get(int? id)
        {
            DBEntities db = new DBEntities();
            return db.Materia.Find(id);
        }

        public static void Update(Materia Materia)
        {
            using (DBEntities db = new DBEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Materia.Attach(Materia);
                        db.Entry(Materia).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static void Delete(int? id)
        {
            using (DBEntities db = new DBEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Materia Materia = db.Materia.Find(id);
                        db.Entry(Materia).State = System.Data.Entity.EntityState.Deleted;
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }
        }

        public static List<Materia> List()
        {
            DBEntities db = new DBEntities();
            return db.Materia.ToList();
        }

        public static List<Materia> ListToNames()
        {
            DBEntities db = new DBEntities();
            List<Materia> result = new List<Materia>();
            db.Materia.ToList().ForEach(x =>
                result.Add(
                    new Materia
                    {
                        nombre = x.nrc + "-" + x.nombre,
                        idmateria = x.idmateria
                    }));
            return result;
        }
    }
}
