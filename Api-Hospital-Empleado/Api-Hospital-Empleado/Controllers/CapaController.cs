using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{

    [ApiController]
    [Route("api/Capa")]
    public class CapaController : Controller
    {
        private readonly AppDbContext _context;
        public CapaController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Capa>>> GetCapa()
        {
            return await _context.Capacitaciones.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Capa>> GetCapa(int id)
        {
            var capa = await _context.Capacitaciones.FindAsync(id);
            if (capa == null) return NotFound();
            return capa;
        }
        [HttpPost]
        public async Task<ActionResult<Capa>> CreateCapa(Capa capa)
        {
            capa.FechaAdicion = DateTime.UtcNow;
            _context.Capacitaciones.Add(capa);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetCapa), new { id = capa.IdCapacitacion }, capa);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCapa(int id, Capa capa)
        {
            if (id != capa.IdCapacitacion) return BadRequest();

            var capaExistente = await _context.Capacitaciones.FindAsync(id);
            if (capaExistente == null) return NotFound();

            capaExistente.IdEmpleado = capa.IdEmpleado;
            capaExistente.Curso = capa.Curso;
            capaExistente.FechaInicio = capa.FechaInicio;
            capaExistente.FechaFin = capa.FechaFin;
            capaExistente.Certificacion = capa.Certificacion;
            capaExistente.ModificadoPor = capa.ModificadoPor;
            capaExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCapa(int id)
        {
            var capa = await _context.Capacitaciones.FindAsync(id);
            if (capa == null) return NotFound();

            _context.Capacitaciones.Remove(capa);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
