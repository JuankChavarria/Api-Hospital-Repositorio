namespace Api_Hospital_Empleado.Models
{
    public class Vacaciones
    {
        public int IdVacaciones { get; set; }
        public int IdEmpleado { get; set; }
        public int DiasDisponibles { get; set; }
        public int DiasUsados { get; set; }
        public DateTime FechaSolicitud { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string Estado { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
