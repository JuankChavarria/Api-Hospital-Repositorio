namespace Api_Hospital_Empleado.Models
{
    public class Reporte
    {
        public int IdReporte { get; set; }
        public int IdEmpleado { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public DateTime? FechaGeneracion { get; set; } 
        public string Autor { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; } 
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; } 
    }
}
