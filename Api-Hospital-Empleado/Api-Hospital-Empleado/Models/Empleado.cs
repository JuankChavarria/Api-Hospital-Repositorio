namespace Api_Hospital_Empleado.Models
{
    public class Empleado
    {
        public int IdEmpleado { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public DateTime FechaIngreso { get; set; }
        public string Cargo { get; set; }
        public decimal Salario { get; set; }
        public string Departamento { get; set; }
        public string EstadoLaboral { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
