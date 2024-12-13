namespace Api_Hospital_Empleado.Models
{
    public class Beneficio
    {

        public int IdBeneficio { get; set; }
        public int IdEmpleado { get; set; }
        public string Tipo { get; set; }
        public decimal Valor { get; set; }
        public string Descripcion { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
