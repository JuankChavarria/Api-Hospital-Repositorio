using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Evaluacion")]
    public class EvaluacionesController : Controller
    {
        private readonly AppDbContext _context;
        public EvaluacionesController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Evaluacion>>> GetEvaluacion()
        {
            return await _context.Evaluaciones.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Disciplinaa>> GetEvaluacion(int id)
        {
            var disciplina = await _context.Disciplina.FindAsync(id);
            if (disciplina == null) return NotFound();
            return disciplina;
        }
        [HttpPost]
        public async Task<ActionResult<Disciplinaa>> CreateEvaluacion(Evaluacion evaluacion)
        {
            evaluacion.FechaAdicion = DateTime.UtcNow;
            _context.Evaluaciones.Add(evaluacion);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetEvaluacion), new { id = evaluacion.IdEvaluacion }, evaluacion);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateEvaluacion(int id, Evaluacion evaluacion)
        {
            if (id != evaluacion.IdEvaluacion) return BadRequest();

            var disciExistente = await _context.Evaluaciones.FindAsync(id);
            if (disciExistente == null) return NotFound();

            disciExistente.IdEmpleado = evaluacion.IdEmpleado;
            disciExistente.Fecha = evaluacion.Fecha;
            disciExistente.Indicadores = evaluacion.Indicadores;
            disciExistente.Resultado = evaluacion.Resultado;
            disciExistente.AdicionadoPor = evaluacion.AdicionadoPor;
            disciExistente.FechaAdicion = DateTime.UtcNow;
            disciExistente.ModificadoPor = evaluacion.ModificadoPor;
            disciExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDisciplina(int id)
        {
            var evaluacion = await _context.Evaluaciones.FindAsync(id);
            if (evaluacion == null) return NotFound();

            _context.Evaluaciones.Remove(evaluacion);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}