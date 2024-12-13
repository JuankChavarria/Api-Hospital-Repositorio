using Api_Hospital_Empleado.BaseData;
using Api_Hospital_Empleado.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api_Hospital_Empleado.Controllers
{
    [ApiController]
    [Route("api/Permiso")]
    public class PermisoController : Controller
    {
        private readonly AppDbContext _context;
        public PermisoController(AppDbContext context)
        { _context = context; }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Permisos_Legales>>> GetPermiso()
        {
            return await _context.Permisos_Licencias.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Permisos_Legales>> GetPermiso(int id)
        {
            var permiso = await _context.Permisos_Licencias.FindAsync(id);
            if (permiso == null) return NotFound();
            return permiso;
        }
        [HttpPost]
        public async Task<ActionResult<Permisos_Legales>> CreatePermiso(Permisos_Legales permisos)
        {
            permisos.FechaAdicion = DateTime.UtcNow;
            _context.Permisos_Licencias.Add(permisos);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetPermiso), new { id = permisos.IdPermiso }, permisos);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdatePermiso(int id, Permisos_Legales permisos)
        {
            if (id != permisos.IdPermiso) return BadRequest();

            var permisoexiste = await _context.Permisos_Licencias.FindAsync(id);
            if (permisoexiste == null) return NotFound();

            permisoexiste.IdEmpleado = permisos.IdEmpleado;
            permisoexiste.Tipo = permisos.Tipo;
            permisoexiste.FechaInicio = permisos.FechaInicio;
            permisoexiste.FechaFin = permisos.FechaFin;
            permisoexiste.Descripcion = permisos.Descripcion;
            permisoexiste.AdicionadoPor = permisos.AdicionadoPor;
            permisoexiste.FechaAdicion = permisos.FechaAdicion;
            permisoexiste.ModificadoPor = permisos.ModificadoPor;
            permisoexiste.FechaModificacion = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return NoContent();
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePermiso(int id)
        {
            var permiso = await _context.Permisos_Licencias.FindAsync(id);
            if (permiso == null) return NotFound();

            _context.Permisos_Licencias.Remove(permiso);
            await _context.SaveChangesAsync();
            return NoContent();


        }
    }
}
