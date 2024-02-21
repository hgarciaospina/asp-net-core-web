using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace LeerData
{
    public class AppVentaCursosContext : DbContext 
    {
        private const string connectionString = @"Data Source=DESARROLLO;Initial Catalog=CursosOnline;Integrated Security=True;TrustServerCertificate=True";

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder){
            optionsBuilder.UseSqlServer(connectionString);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CursoInstructor>()
            .HasKey(ci => new { ci.CursoId, ci.InstructorId });
        }
        public DbSet<Curso> Curso {get; set;}
        public DbSet<Precio> Precio {get; set;}
        public DbSet<Comentario> Comentario {get; set;}
        public DbSet<Instructor> Instructor {get; set;}
        public DbSet<CursoInstructor> CursoInstructor {get; set;}
    }
}