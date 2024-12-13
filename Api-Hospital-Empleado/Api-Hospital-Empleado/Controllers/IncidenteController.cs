using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Incidente")]
    public class IncidenteController : Controller
    {

        private readonly AppDbContext _context;
        public IncidenteController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Incidente>>> GetIncidente()
        {
            return await _context.Incidentes.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Incidente>> GetIncidente(int id)
        {
            var incidente = await _context.Incidentes.FindAsync(id);
            if (incidente == null) return NotFound();
            return incidente;
        }
        [HttpPost]
        public async Task<ActionResult<Incidente>> CreateIncidente(Incidente incidente)
        {
            incidente.FechaAdicion = DateTime.UtcNow;
            _context.Incidentes.Add(incidente);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetIncidente), new { id = incidente.IdIncidente }, incidente);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateIncidente(int id, Incidente incidente)
        {
            if (id != incidente.IdIncidente) return BadRequest();

            var incidenteExistente = await _context.Incidentes.FindAsync(id);
            if (incidenteExistente == null) return NotFound();

            incidenteExistente.IdEmpleado = incidente.IdEmpleado;
            incidenteExistente.Tipo = incidente.Tipo;
            incidenteExistente.Fecha = incidente.Fecha;
            incidenteExistente.Descripcion = incidente.Descripcion;
            incidenteExistente.AdicionadoPor = incidente.AdicionadoPor;
            incidenteExistente.FechaAdicion = incidente.FechaAdicion;
            incidenteExistente.ModificadoPor = incidente.ModificadoPor;
            incidenteExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteIncidente(int id)
        {
            var incidente = await _context.Disciplina.FindAsync(id);
            if (incidente == null) return NotFound();

            _context.Disciplina.Remove(incidente);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
