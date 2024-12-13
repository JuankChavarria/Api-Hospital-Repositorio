using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Reporte")]
    public class ReporteController : Controller
    {
        private readonly AppDbContext _context;
        public ReporteController(AppDbContext context)
        { _context = context; }

        [HttpGet]

        public async Task<ActionResult<IEnumerable<Reporte>>> GetReporte()
        {
            return await _context.Reportes.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Reporte>> GetReporte(int id)
        {
            var reporte = await _context.Reportes.FindAsync(id);
            if (reporte == null) return NotFound();
            return reporte;
        }
        [HttpPost]
        public async Task<ActionResult<Reporte>> CreateReporte(Reporte reporte)
        {
            reporte.FechaAdicion = DateTime.UtcNow;
            _context.Reportes.Add(reporte);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetReporte), new { id = reporte.IdReporte }, reporte);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateReportes(int id, Reporte reporte)
        {
            if (id != reporte.IdReporte) return BadRequest();

            var reporteExistente = await _context.Reportes.FindAsync(id);
            if (reporteExistente == null) return NotFound();

            reporteExistente.IdEmpleado = reporte.IdEmpleado;
            reporteExistente.Titulo = reporte.Titulo;
            reporteExistente.Descripcion = reporte.Descripcion;
            reporteExistente.FechaGeneracion = reporte.FechaGeneracion;
            reporteExistente.Autor = reporte.Autor;
            reporteExistente.AdicionadoPor = reporte.AdicionadoPor;
            reporteExistente.FechaAdicion = reporte.FechaAdicion;
            reporteExistente.ModificadoPor = reporte.ModificadoPor;
            reporteExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReportes(int id)
        {
            var reporte = await _context.Reportes.FindAsync(id);
            if (reporte == null) return NotFound();

            _context.Reportes.Remove(reporte);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
