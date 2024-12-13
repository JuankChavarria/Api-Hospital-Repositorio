using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Recibo")]
    public class ReciboController : Controller
    {
        private readonly AppDbContext _context;
        public ReciboController(AppDbContext context)
        { _context = context; }
        [HttpGet]

        public async Task<ActionResult<IEnumerable<Recibos_Pago>>> GetRecibo()
        {
            return await _context.Recibos_Pagos.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Recibos_Pago>> GetRecibo(int id)
        {
            var recibo = await _context.Recibos_Pagos.FindAsync(id);
            if (recibo == null) return NotFound();
            return recibo;
        }
        [HttpPost]
        public async Task<ActionResult<Recibos_Pago>> CreateRecibo(Recibos_Pago recibo)
        {
            recibo.FechaAdicion = DateTime.UtcNow;
            _context.Recibos_Pagos.Add(recibo);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetRecibo), new { id = recibo.IdReciboPago }, recibo);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateDisciplina(int id, Recibos_Pago recibo)
        {
            if (id != recibo.IdReciboPago) return BadRequest();

            var reciExistente = await _context.Recibos_Pagos.FindAsync(id);
            if (reciExistente == null) return NotFound();
            reciExistente.IdNomina = recibo.IdNomina;
            reciExistente.IdEmpleado = recibo.IdEmpleado;
            reciExistente.FechaEmision = recibo.FechaEmision;
            reciExistente.Detalles = recibo.Detalles;
            reciExistente.AdicionadoPor = recibo.AdicionadoPor;
            reciExistente.FechaAdicion = recibo.FechaAdicion;
            reciExistente.ModificadoPor = recibo.ModificadoPor;
            reciExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDisciplina(int id)
        {
            var recibo = await _context.Recibos_Pagos.FindAsync(id);
            if (recibo == null) return NotFound();

            _context.Recibos_Pagos.Remove(recibo);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
