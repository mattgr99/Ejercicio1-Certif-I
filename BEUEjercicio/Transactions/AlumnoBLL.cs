using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    //TBLL:Trasactional Business Logic Layer
    //capa de logica del negocio-transacciones-escritura
    public class AlumnoBLL
    {
        
        public Alumno alumno1 { get; set; } //alumno activo
        
        //instanciar un contexto general y unico que se va atrabajar en la clase
        

        //Busco un dato especifico dentro de la tabla en la instancia general para la clase
        //de las entidades de la base de datos
        

        //insertar datos en la tabla Alumno
        public static void Create(Alumno alumno)
        {
            using (DBEntities db= new DBEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                    {
                    try
                    {
                        db.Alumno.Add(alumno);
                        db.SaveChanges();
                        transaction.Commit();
                    }
                    catch(Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                    }

            }
        }
        //Actualizar un elemento de la base de datos
        //Debe pertenecer el contexto de la BD como la variable de la clase Alumno
        //a una misma instancia de DBEntities

        public static Alumno Get(int? id)
        {
            DBEntities db = new DBEntities();
            
            return db.Alumno.Find(id);
        }


        public static void Update(Alumno alumno, int? id)
        {
            using (DBEntities db= new DBEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                try
                {
                        //db.Entry(alumno).State = System.Data.Entity.EntityState.Modified;
                        alumno.idalumno = id.Value;
                        db.Alumno.Attach(alumno);
                        db.Entry(alumno).State = System.Data.Entity.EntityState.Modified;
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

        //eliminar un registro de BD
        public static void Delete(int? id)
        {
            using (DBEntities db= new DBEntities())
            {
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                        Alumno alumno = db.Alumno.Find(id);
                        db.Entry(alumno).State = System.Data.Entity.EntityState.Deleted;
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

        public static List<Alumno> List()
        {
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.ToList();
            //Los metodos del entity framework se denomina Linq, y la evaluacion de condiciones lambda
        }

        public static List<Alumno> ListToNames()
        {
            DBEntities db = new DBEntities();
            List<Alumno> result = new List<Alumno>();
            db.Alumno.ToList().ForEach(x =>
                result.Add(
                    new Alumno
                    {
                        nombres = x.nombres + " " + x.apellidos,
                        idalumno = x.idalumno
                    }));
            return result;
        }


        private static List<Alumno> GetAlumnos(string criterio)
        {
            //starswith inicio de palabra
            //contains que contiene en cualquier lado de la cadena
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.Where(x => x.apellidos.ToLower().StartsWith(criterio)).ToList();
        }

        /*public static List<Alumno> GetAlumno(int id)
        {
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.Where(x => x.idalumno == id).ToList();
        }*/

        private static Alumno GetAlumno(string cedula)
        {
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.FirstOrDefault(x => x.cedula == cedula);
        }
    }
}
