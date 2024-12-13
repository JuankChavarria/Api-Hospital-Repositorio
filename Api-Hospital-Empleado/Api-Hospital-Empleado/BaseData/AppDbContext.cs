
using Api_Hospital_Empleado.Models;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.BaseData
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
        public DbSet<Asistencia> Asistencias { get; set; }

        public DbSet<Beneficio> Beneficios { get; set; }
        public DbSet<Capa> Capacitaciones { get; set; }
        public DbSet<Disciplinaa> Disciplina { get; set; }
        public DbSet<Cumplimiento> Cumplimiento_Legal { get; set; }
        public DbSet<Empleado> Empleados { get; set; }
        public DbSet<Evaluacion> Evaluaciones { get; set; }

        public DbSet<Incidente> Incidentes { get; set; }
        public DbSet<Nominas> Nomina { get; set; }
        public DbSet<Permisos_Legales> Permisos_Licencias { get; set; }
        public DbSet<Recibos_Pago> Recibos_Pagos { get; set; }
        public DbSet<Reporte> Reportes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
                modelBuilder.Entity<Asistencia>()
                    .HasKey(a => a.IdAsistencia);

                 modelBuilder.Entity<Beneficio>()
                    .HasKey(b => b.IdBeneficio);

            modelBuilder.Entity<Capa>()
               .HasKey(c => c.IdCapacitacion);

                   modelBuilder.Entity<Cumplimiento>()
               .HasKey(i => i.IdCumplimiento);

              modelBuilder.Entity<Disciplinaa>()
             .HasKey(d => d.IdDisciplina);

            modelBuilder.Entity<Empleado>()
            .HasKey(e => e.IdEmpleado);
           
            modelBuilder.Entity<Evaluacion>()
              .HasKey(e => e.IdEvaluacion);

            modelBuilder.Entity<Incidente>()
              .HasKey(i => i.IdIncidente);


            modelBuilder.Entity<Nominas>()
              .HasKey(n => n.IdNomina);

            modelBuilder.Entity<Permisos_Legales>()
              .HasKey(p => p.IdPermiso);


            modelBuilder.Entity<Recibos_Pago>()
              .HasKey(r => r.IdReciboPago);

            modelBuilder.Entity<Reporte>()
             .HasKey(r => r.IdReporte);



        }
        }
    }

