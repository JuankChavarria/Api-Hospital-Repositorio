using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Benficios")]
    public class BeneficioController : Controller {
    private readonly AppDbContext _context;
        public BeneficioController(AppDbContext context) { 
        _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Beneficio>>> GetBeneficio()
        {
            return await _context.Beneficios.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Beneficio>> GetBeneficio(int id)
        {
            var beneficio = await _context.Beneficios.FindAsync(id);
            if (beneficio == null) return NotFound();
            return beneficio;
        }
        [HttpPost]
        public async Task<ActionResult<Beneficio>> CreateBeneficio(Beneficio beneficio)
        {
            beneficio.FechaAdicion = DateTime.UtcNow;
            _context.Beneficios.Add(beneficio);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetBeneficio), new { id = beneficio.IdBeneficio }, beneficio);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBeneficio(int id, Beneficio beneficio)
        {
            if (id != beneficio.IdBeneficio) return BadRequest();

            var beneficioExistente = await _context.Beneficios.FindAsync(id);
            if (beneficioExistente == null) return NotFound();

            beneficioExistente.IdEmpleado = beneficio.IdEmpleado;
            beneficioExistente.Tipo = beneficio.Tipo;
            beneficioExistente.Valor = beneficio.Valor;
            beneficioExistente.Descripcion = beneficio.Descripcion;
            beneficioExistente.ModificadoPor = beneficio.ModificadoPor;
            beneficioExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBeneficio(int id)
        {
            var beneficio = await _context.Beneficios.FindAsync(id);
            if (beneficio == null) return NotFound();

            _context.Beneficios.Remove(beneficio);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
