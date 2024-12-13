using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{

    [ApiController]
    [Route("api/Disciplina")]
    public class DisciplinaController : Controller
    {
        private readonly AppDbContext _context;
        public DisciplinaController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Disciplinaa>>> GetDisciplina()
        {
            return await _context.Disciplina.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Disciplinaa>> GetDisciplina(int id)
        {
            var disciplina = await _context.Disciplina.FindAsync(id);
            if (disciplina == null) return NotFound();
            return disciplina;
        }
        [HttpPost]
        public async Task<ActionResult<Disciplinaa>> CreateDisciplina(Disciplinaa disciplinaa)
        {
            disciplinaa.FechaAdicion = DateTime.UtcNow;
            _context.Disciplina.Add(disciplinaa);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetDisciplina), new { id = disciplinaa.IdDisciplina }, disciplinaa);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDisciplina(int id, Disciplinaa disciplinaa)
        {
            if (id != disciplinaa.IdDisciplina) return BadRequest();

            var disciExistente = await _context.Disciplina.FindAsync(id);
            if (disciExistente == null) return NotFound();

            disciExistente.IdEmpleado = disciplinaa.IdEmpleado;
            disciExistente.Tipo = disciplinaa.Tipo;
            disciExistente.Fecha = disciplinaa.Fecha;
            disciExistente.Descripcion = disciplinaa.Descripcion;
            disciExistente.AdicionadoPor = disciplinaa.AdicionadoPor;
            disciExistente.FechaAdicion=disciplinaa.FechaAdicion;
            disciExistente.ModificadoPor = disciplinaa.ModificadoPor;
            disciExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDisciplina(int id)
        {
            var disciplinaa = await _context.Disciplina.FindAsync(id);
            if (disciplinaa == null) return NotFound();

            _context.Disciplina.Remove(disciplinaa);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}