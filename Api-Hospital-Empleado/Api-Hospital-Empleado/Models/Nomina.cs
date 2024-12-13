namespace Api_Hospital_Empleado.Models
{
    public class Nomina
    {
        public int IdNomina { get; set; }
        public int IdEmpleado { get; set; }
        public string Mes { get; set; }
        public decimal SalarioBase { get; set; }
        public decimal HorasExtras { get; set; }
        public decimal Deducciones { get; set; }
        public decimal SalarioNeto { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
