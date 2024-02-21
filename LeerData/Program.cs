using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace LeerData
{
    class Program 
    {
        static void Main(string[] args)
        {
          using(var db = new AppVentaCursosContext()){
            var cursos = db.Curso.Include(p=> p.Precio).AsNoTracking();
            foreach(var curso in cursos){
              Console.WriteLine(string.Format("{0} {1} {2}", curso.Titulo, ":", curso.Precio.PrecioActual));
            }
          }
        }
    }
}