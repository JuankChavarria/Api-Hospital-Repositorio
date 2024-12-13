namespace Api_Hospital_Empleado.Models
{
    public class Capa
    {
         public int IdCapacitacion { get; set; }
        public int IdEmpleado { get; set; }
        public string Curso { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string Certificacion { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
