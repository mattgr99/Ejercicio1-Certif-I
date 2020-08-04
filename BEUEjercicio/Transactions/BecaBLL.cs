using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    public class BecaBLL
    {
        public static void Create(Beca a)
        {
            using (DBEntities db = new DBEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Beca.Add(a);
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

        public static Beca Get(int? id)
        {
            DBEntities db = new DBEntities();
            return db.Beca.Find(id);
        }

        public static void Update(Beca Beca)
        {
            using (DBEntities db = new DBEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        db.Beca.Attach(Beca);
                        db.Entry(Beca).State = System.Data.Entity.EntityState.Modified;
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
                        Beca Beca = db.Beca.Find(id);
                        db.Entry(Beca).State = System.Data.Entity.EntityState.Deleted;
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

        public static List<Beca> List()
        {
            DBEntities db = new DBEntities();
            return db.Beca.OrderBy(x => x.apellidos).ToList();
        }
    }
}
