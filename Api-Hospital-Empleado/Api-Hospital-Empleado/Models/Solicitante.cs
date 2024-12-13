namespace Api_Hospital_Empleado.Models
{
    public class Solicitante
    {
        public int IdSolicitante { get; set; }
        public string Nombre { get; set; }
        public string Curriculo { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Sexo { get; set; }
        public string Direccion { get; set; }
        public int IdVacante { get; set; }
        public string Estado { get; set; }
        public string AdicionadoPor { get; set; }
        public DateTime FechaAdicion { get; set; }
        public string? ModificadoPor { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}
