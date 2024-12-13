namespace Api_Hospital_Empleado.Models
{
    public class Recibos_Pagos
    {
        public int IdReciboPago { get; set; }
        public int IdNomina { get; set; }
        public int IdEmpleado { get; set; }
        public DateTime FechaEmision { get; set; }
        public string Detalles { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
