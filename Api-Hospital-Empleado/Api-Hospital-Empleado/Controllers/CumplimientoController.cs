using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Cumplimiento")]
    public class CumplimientoController : Controller
    {
        private readonly AppDbContext _context;
        public CumplimientoController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Cumplimiento>>> GetCumplimiento()
        {
            return await _context.Cumplimiento_Legal.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Cumplimiento>> GetCumplimiento(int id)
        {
            var cumplimiento = await _context.Cumplimiento_Legal.FindAsync(id);
            if (cumplimiento == null) return NotFound();
            return cumplimiento;
        }
        [HttpPost]
        public async Task<ActionResult<Cumplimiento>> CreateCumplimiento(Cumplimiento cumplimiento)
        {
            cumplimiento.FechaAdicion = DateTime.UtcNow;
            _context.Cumplimiento_Legal.Add(cumplimiento);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetCumplimiento), new { id = cumplimiento.IdCumplimiento }, cumplimiento);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCumplimiento(int id, Cumplimiento cumplimiento)
        {
            if (id != cumplimiento.IdCumplimiento) return BadRequest();

            var cumplimientoExistente = await _context.Cumplimiento_Legal.FindAsync(id);
            if (cumplimientoExistente == null) return NotFound();

            cumplimientoExistente.IdEmpleado = cumplimiento.IdEmpleado;
            cumplimientoExistente.Documento = cumplimiento.Documento;
            cumplimientoExistente.FechaPresentacion = cumplimiento.FechaPresentacion;
            cumplimientoExistente.Descripcion = cumplimiento.Descripcion;
            cumplimientoExistente.ModificadoPor = cumplimiento.ModificadoPor;
            cumplimientoExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCumplimiento(int id)
        {
            var cumplimiento = await _context.Cumplimiento_Legal.FindAsync(id);
            if (cumplimiento == null) return NotFound();

            _context.Cumplimiento_Legal.Remove(cumplimiento);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
