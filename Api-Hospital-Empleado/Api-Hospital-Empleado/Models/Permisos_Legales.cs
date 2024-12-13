namespace Api_Hospital_Empleado.Models
{
    public class Permisos_Legales
    {
        public int IdPermiso { get; set; }
        public int IdEmpleado { get; set; }
        public string Tipo { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string Descripcion { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; } 
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; } 
    }
}
