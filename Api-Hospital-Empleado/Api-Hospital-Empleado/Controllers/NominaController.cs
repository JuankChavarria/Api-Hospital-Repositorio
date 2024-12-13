using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Nomina")]
    public class NominaController : Controller
    {
        private readonly AppDbContext _context;
        public NominaController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Nominas>>> GetNominas()
        {
            return await _context.Nomina.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Nominas>> GetNominas(int id)
        {
            var nomina = await _context.Nomina.FindAsync(id);
            if (nomina == null) return NotFound();
            return nomina;
        }
        [HttpPost]
        public async Task<ActionResult<Nominas>> CreateNominas(Nominas nominas)
        {
            nominas.FechaAdicion = DateTime.UtcNow;
            _context.Nomina.Add(nominas);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetNominas), new { id = nominas.IdNomina }, nominas);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateNominas(int id, Nominas nominas)
        {
            if (id != nominas.IdNomina) return BadRequest();

            var nominasexistentes = await _context.Nomina.FindAsync(id);
            if (nominasexistentes == null) return NotFound();

            nominasexistentes.IdEmpleado = nominas.IdEmpleado;
            nominasexistentes.Mes = nominas.Mes;
            nominasexistentes.SalarioBase = nominas.SalarioBase;
            nominasexistentes.HorasExtras = nominas.HorasExtras;
            nominasexistentes.Deducciones = nominas.Deducciones;
            nominasexistentes.SalarioNeto = nominas.SalarioNeto;
            nominasexistentes.AdicionadoPor = nominas.AdicionadoPor;
            nominasexistentes.FechaAdicion = nominas.FechaAdicion;
            nominasexistentes.ModificadoPor = nominas.ModificadoPor;
            nominasexistentes.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteNominas(int id)
        {
            var nominas = await _context.Nomina.FindAsync(id);
            if (nominas == null) return NotFound();

            _context.Nomina.Remove(nominas);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
