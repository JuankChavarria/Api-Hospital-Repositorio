namespace Api_Hospital_Empleado.Models
{
    public class Vacante
    {
        public int IdVacante { get; set; }
        public string Departamento { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
