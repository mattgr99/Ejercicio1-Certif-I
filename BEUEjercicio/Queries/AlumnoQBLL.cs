using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BEUEjercicio.Queries
{
    //QBLL: Query Business Logic Layer
    // Capa Logica de Negocio-Consultas-Solo Lectura
    public static class AlumnoQBLL
    {
        public static List<Alumno> GetAlumnos()
        {
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.ToList();
            //Los metodos del entity framework se denomina Linq, y la evaluacion de condiciones lambda
        }

        public static List<Alumno> GetAlumnos(string criterio)
        {
            //starswith inicio de palabra
            //contains que contiene en cualquier lado de la cadena
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.Where(x => x.apellidos.ToLower().StartsWith(criterio)).ToList();
        }

        public static List<Alumno> GetAlumno(int id)
        {
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.Where(x=>x.idalumno==id).ToList();
        }

        public static List<Alumno> GetAlumno(string cedula)
        {
            DBEntities db = new DBEntities();//Instancia del contexto
            return db.Alumno.Where(x => x.cedula == cedula).ToList();
        }

    }
}
