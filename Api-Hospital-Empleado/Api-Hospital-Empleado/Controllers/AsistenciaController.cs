using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Asistencia")]
    public class AsistenciaController : Controller
    {
        private readonly AppDbContext _context;
        public AsistenciaController(AppDbContext context)
        { _context = context; }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Asistencia>>> GetAsistencia() { 
        return await _context.Asistencias.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Asistencia>> GetAsitencia(int id) 
        {
            var asistencia = await _context.Asistencias.FindAsync(id);
            if (asistencia == null) return NotFound();
            return asistencia;
        }
        [HttpPost]
        public async Task<ActionResult<Asistencia>> CreateAsistencia(Asistencia asistencia)
        {
            asistencia.FechaAdicion = DateTime.UtcNow;
            _context.Asistencias.Add(asistencia);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetAsistencia), new { id = asistencia.IdAsistencia }, asistencia);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateAsistencia(int id, Asistencia asistencia)
        {
            if (id != asistencia.IdAsistencia) return BadRequest();

            var asistenciaExistente = await _context.Asistencias.FindAsync(id);
            if (asistenciaExistente == null) return NotFound();

            asistenciaExistente.IdEmpleado = asistencia.IdEmpleado;
            asistenciaExistente.Fecha = asistencia.Fecha;
            asistenciaExistente.HoraEntrada = asistencia.HoraEntrada;
            asistenciaExistente.HoraSalida = asistencia.HoraSalida;
            asistenciaExistente.HorasTrabajadas = asistencia.HorasTrabajadas;
            asistenciaExistente.ModificadoPor = asistencia.ModificadoPor;
            asistenciaExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAsistencia(int id)
        {
            var asistencia = await _context.Asistencias.FindAsync(id);
            if (asistencia == null) return NotFound();

            _context.Asistencias.Remove(asistencia);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
