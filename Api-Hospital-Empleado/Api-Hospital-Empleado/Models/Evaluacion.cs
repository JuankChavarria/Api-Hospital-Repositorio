namespace Api_Hospital_Empleado.Models
{
    public class Evaluacion
    {
        public int IdEvaluacion { get; set; }
        public int IdEmpleado { get; set; }
        public DateTime Fecha { get; set; }
        public string Indicadores { get; set; }
        public string Resultado { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime? FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
