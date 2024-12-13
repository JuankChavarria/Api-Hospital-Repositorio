using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Empleado")]
    public class EmpleadoController : Controller
    {
        private readonly AppDbContext _context;
        public EmpleadoController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Empleado>>> GetEmpleado()
        {
            return await _context.Empleados.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Empleado>> GetEmpleado(int id)
        {
            var empleado = await _context.Empleados.FindAsync(id);
            if (empleado == null) return NotFound();
            return empleado;
        }
        [HttpPost]
        public async Task<ActionResult<Empleado>> CreateEmpleado(Empleado empleado)
        {
            empleado.FechaAdicion = DateTime.UtcNow;
            _context.Empleados.Add(empleado);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetEmpleado), new { id = empleado.IdEmpleado }, empleado);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateEmpleado(int id, Empleado empleado)
        {
            if (id != empleado.IdEmpleado) return BadRequest();

            var empleadoExistente = await _context.Empleados.FindAsync(id);
            if (empleadoExistente == null) return NotFound();

            empleadoExistente.Nombre = empleado.Nombre;
            empleadoExistente.Direccion = empleado.Direccion;
            empleadoExistente.Correo = empleado.Correo;
            empleadoExistente.Telefono = empleado.Telefono;
            empleadoExistente.FechaIngreso = empleado.FechaIngreso;
            empleadoExistente.Cargo = empleado.Cargo;
            empleadoExistente.Salario = empleado.Salario;
            empleadoExistente.Departamento = empleado.Departamento;
            empleadoExistente.EstadoLaboral = empleado.EstadoLaboral;
            empleadoExistente.AdicionadoPor = empleado.AdicionadoPor;
            empleadoExistente.FechaAdicion = empleado.FechaAdicion;
            empleadoExistente.ModificadoPor = empleado.ModificadoPor;
            empleadoExistente.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteEmpleado(int id)
        {
            var empleado = await _context.Empleados.FindAsync(id);
            if (empleado == null) return NotFound();

            _context.Empleados.Remove(empleado);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
