namespace Api_Hospital_Empleado.Models
{
    public class Disciplina
    {
        public int IdDisciplina { get; set; }
        public int IdEmpleado { get; set; }
        public string Tipo { get; set; }
        public DateTime Fecha { get; set; }
        public string Descripcion { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
