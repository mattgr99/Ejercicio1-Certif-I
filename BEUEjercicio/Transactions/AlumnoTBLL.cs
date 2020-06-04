using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Transactions
{
    //TBLL:Trasactional Business Logic Layer
    //capa de logica del negocio-transacciones-escritura
    public class AlumnoTBLL
    {
        private DBEntities context;
        public Alumno alumno { get; set; } //alumno activo
        
        //instanciar un contexto general y unico que se va atrabajar en la clase
        public AlumnoTBLL(bool withContext) {
            if (withContext)
            {
                context = new DBEntities();
            }
        }

        //Busco un dato especifico dentro de la tabla en la instancia general para la clase
        //de las entidades de la base de datos
        public void Get(int id)
        {
            alumno = context.Alumno.Find(id);
        }

        //insertar datos en la tabla Alumno
        public void Create(Alumno alumno)
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
        public void Update()
        {

                using (var transaction = context.Database.BeginTransaction())
                {
                try
                {
                    context.Entry(alumno).State = System.Data.Entity.EntityState.Modified;
                        context.SaveChanges();
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }

            
        }

        //eliminar un registro de BD
        public void Delete()
        {

            using (var transaction = context.Database.BeginTransaction())
            {
                try
                {
                    context.Entry(alumno).State = System.Data.Entity.EntityState.Deleted;
                    context.SaveChanges();
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
}
