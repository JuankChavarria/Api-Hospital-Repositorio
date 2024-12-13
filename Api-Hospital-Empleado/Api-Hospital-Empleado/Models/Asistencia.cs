namespace Api_Hospital_Empleado.Models
{
    public class Asistencia
    {
        public int IdAsistencia { get; set; }
        public int IdEmpleado { get; set; }
        public DateTime Fecha { get; set; } = DateTime.Now;
        public DateTime HoraEntrada { get; set; }
        public DateTime HoraSalida { get; set; }
        public DateTime HorasTrabajadas { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; } 
    }
}
