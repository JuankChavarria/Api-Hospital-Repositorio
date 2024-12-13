
using Api_Hospital_Empleado.Models;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.BaseData
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
        public DbSet<Asistencia> Asistencias { get; set; }

        public DbSet<Beneficio> Beneficios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
                modelBuilder.Entity<Asistencia>()
                    .HasKey(a => a.IdAsistencia);

                 modelBuilder.Entity<Beneficio>()
                    .HasKey(b => b.IdBeneficio);
            }
        }
    }

