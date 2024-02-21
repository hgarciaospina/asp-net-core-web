using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace LeerData
{
  class Program
  {
    static void Main(string[] args)
    {
      using (var db = new AppVentaCursosContext())
      {
        // Relación uno a uno: Curso con Precio
        // Relación uno a muchos: Curso con Comentarios
        var cursos = db.Curso
                        .Include(p => p.Precio)      // Incluir Precio
                        .Include(c => c.Comentarios)  // Incluir Comentario
                        .AsNoTracking();

        foreach (var curso in cursos)
        {
          Console.WriteLine("** Curso **");
          Console.WriteLine($"- {curso.Titulo}: {curso.Precio.PrecioActual}");
          Console.WriteLine("==============");
          Console.WriteLine("  Comentarios ");
          Console.WriteLine("==============");
          foreach (var comentario in curso.Comentarios)
          {
            Console.WriteLine($"    - {comentario.DescripcionComentario}");
          }
          Console.WriteLine();
        }
      }
    }
  }
}