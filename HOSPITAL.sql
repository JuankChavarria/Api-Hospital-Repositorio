CREATE DATABASE HOSPITAL;
GO

USE  HOSPITAL;
GO

CREATE TABLE EMPLEADOS (
    IdEmpleado INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(200) NOT NULL,
    Correo NVARCHAR(100),
	Telefono NVARCHAR(100),
    Fecha_ingreso DATE NOT NULL,
    Cargo NVARCHAR(100) NOT NULL,
    Departamento NVARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    EstadoLaboral NVARCHAR(50) NOT NULL CHECK (EstadoLaboral IN ('Activo', 'Inactivo', 'Vacaciones', 'Permiso', 'Licencia')),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE ASISTENCIAS (
    IdAsistencia INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Fecha DATE NOT NULL,
    HoraEntrada TIME,
    HoraSalida TIME,
    HorasTrabajadas DECIMAL(5, 2),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE PERMISOS_LICENCIAS (
    IdPermiso INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Tipo NVARCHAR(50) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    Descripcion NVARCHAR(255),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE NOMINA (
    IdNomina INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Mes NVARCHAR(20) NOT NULL,
    SalarioBase DECIMAL(10, 2) NOT NULL,
    HorasExtras DECIMAL(5, 2),
    Deducciones DECIMAL(10, 2),
    SalarioNeto DECIMAL(10, 2) NOT NULL,
    AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE RECIBOS_PAGO (
    IdRecibo INT PRIMARY KEY IDENTITY,
    IdNomina INT FOREIGN KEY REFERENCES NOMINA(IdNomina),
	IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    FechaEmision DATE NOT NULL,
    Detalles NVARCHAR(250),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE VACACIONES (
    IdVacacion INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    DiasDisponibles INT NOT NULL,
    DiasUsados INT DEFAULT 0,
    FechaSolicitud DATE,
    FechaInicio DATE,
    FechaFin DATE,
    Estado NVARCHAR(20) NOT NULL CHECK (Estado IN ('Pendiente', 'Aprobado', 'Rechazado')),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime

);

CREATE TABLE EVALUACIONES (
    IdEvaluacion INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Fecha DATE NOT NULL,
    Indicadores NVARCHAR(250),
    Resultado NVARCHAR(250),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE CAPACITACIONES (
    IdCapacitacion INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Curso NVARCHAR(100) NOT NULL,
    FechaInicio DATE,
    FechaFin DATE,
    Certificacion NVARCHAR(50),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE VACANTES (
    IdVacante INT PRIMARY KEY IDENTITY,
    Puesto NVARCHAR(50) NOT NULL,
    Departamento NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(250),
    Estado NVARCHAR(20) NOT NULL CHECK (estado IN ('Abierta', 'Cerrada')),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE SOLICITANTES (
    IdSolicitante INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Contacto NVARCHAR(50),
    Curriculo NVARCHAR(255),
	Correo NVARCHAR(100),
	Telefono NVARCHAR(100),
	Sexo NVARCHAR(255),
	direccion NVARCHAR(255),
    IdVacante INT FOREIGN KEY REFERENCES VACANTES(IdVacante),
    Estado NVARCHAR(20) NOT NULL CHECK (Estado IN ('Pendiente', 'Entrevista', 'Seleccionado', 'Rechazado')),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE BENEFICIOS (
    IdBeneficio INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Tipo NVARCHAR(50) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Descripcion NVARCHAR(255),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE INCIDENTES (
    IdIncidente INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Fecha DATE NOT NULL,
    Tipo NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE REPORTES (
    IdReporte INT PRIMARY KEY IDENTITY,
	IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Titulo NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    FechaGeneracion DATE NOT NULL,
    Autor NVARCHAR(50),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE CUMPLIMIENTO_LEGAL (
    IdCumplimiento INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Documento NVARCHAR(250) NOT NULL,
    FechaPresentacion DATE NOT NULL,
    Descripcion NVARCHAR(250),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);

CREATE TABLE DISCIPLINA (
    IdDisciplina INT PRIMARY KEY IDENTITY,
    IdEmpleado INT FOREIGN KEY REFERENCES EMPLEADOS(IdEmpleado),
    Tipo NVARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Descripcion NVARCHAR(255),
	AdicionadoPor NVARCHAR(100) NOT NULL,
	FechaAdicion  Datetime,
	ModificadoPor NVARCHAR(100) NOT NULL,
	FechaModificacion Datetime
);


--PROCEDIMIENTOS ALMACENADOS--
-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA EMPLEADOS
-- ================================================

CREATE PROCEDURE sp_CrearEmpleado
    @Nombre NVARCHAR(100),
    @Direccion NVARCHAR(200),
    @Correo NVARCHAR(50),
	@Telefono NVARCHAR(50),
    @Fecha_Ingreso DATE,
    @Cargo NVARCHAR(50),
    @Departamento NVARCHAR(50),
    @Salario DECIMAL(10,2),
    @EstadoLaboral NVARCHAR(20),
	@AdicionadoPor NVARCHAR(20),
	@FechaAdicion  Datetime,
	@ModificadoPor NVARCHAR(20),
	@FechaModificacion Datetime
AS
BEGIN
    BEGIN TRY
        IF @EstadoLaboral NOT IN ('Activo', 'Inactivo', 'Vacaciones', 'Permiso', 'Licencia')
            THROW 51000, 'Estado laboral no válido', 1;

        INSERT INTO EMPLEADOS (Nombre, Direccion, Correo,Telefono, Fecha_ingreso, Cargo, 
                             Departamento, Salario, EstadoLaboral,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@Nombre, @Direccion, @Correo,@Telefono, @Fecha_Ingreso, @Cargo, 
                @Departamento, @Salario, @EstadoLaboral,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_empleado;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerEmpleado
    @IdEmpleado INT
AS
BEGIN
    SELECT * FROM EMPLEADOS WHERE IdEmpleado = @IdEmpleado;
END;
GO

CREATE PROCEDURE sp_ListarEmpleados
AS
BEGIN
    SELECT * FROM EMPLEADOS;
END;
GO

CREATE PROCEDURE sp_ActualizarEmpleado
    @IdEmpleado INT,
     @Nombre NVARCHAR(100),
    @Direccion NVARCHAR(200),
    @Correo NVARCHAR(50),
	@Telefono NVARCHAR(50),
    @Fecha_Ingreso DATE,
    @Cargo NVARCHAR(50),
    @Departamento NVARCHAR(50),
    @Salario DECIMAL(10,2),
    @EstadoLaboral NVARCHAR(20),
	@AdicionadoPor NVARCHAR(20),
	@FechaAdicion  Datetime,
	@ModificadoPor NVARCHAR(20),
	@FechaModificacion Datetime
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @IdEmpleado)
            THROW 51000, 'Empleado no encontrado', 1;

        IF @EstadoLaboral NOT IN ('Activo', 'Inactivo', 'Vacaciones', 'Permiso', 'Licencia')
            THROW 51000, 'Estado laboral no válido', 1;

        UPDATE EMPLEADOS
        SET Nombre = @nombre,
            Direccion = @direccion,
            Correo = @Correo,
			Telefono = @Telefono,
            Cargo = @cargo,
            Departamento = @departamento,
            Salario = @salario,
            EstadoLaboral = @EstadoLaboral,
			AdicionadoPor=@AdicionadoPor,
			FechaAdicion=@FechaAdicion,
			ModificadoPor=@ModificadoPor,
			FechaModificacion=@FechaModificacion
        WHERE IdEmpleado = @IdEmpleado;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarEmpleado
    @IdEmpleado INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @IdEmpleado)
            THROW 51000, 'Empleado no encontrado', 1;

        DELETE FROM EMPLEADOS WHERE IdEmpleado = @IdEmpleado;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA ASISTENCIAS
-- ================================================

CREATE PROCEDURE sp_RegistrarAsistencia
    @IdEmpleado INT,
    @Fecha DATE,
    @HoraEntrada TIME,
    @HoraSalida TIME = NULL,
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
  
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @IdEmpleado)
            THROW 51000, 'Empleado no encontrado', 1;

        DECLARE @horas_trabajadas DECIMAL(5,2) = 0;
        IF @HoraSalida IS NOT NULL
            SET @horas_trabajadas = DATEDIFF(MINUTE, @HoraEntrada, @HoraSalida) / 60.0;

        INSERT INTO ASISTENCIAS (IdEmpleado, fecha, HoraEntrada, HoraSalida, HorasTrabajadas)
        VALUES (@IdEmpleado, @fecha, @HoraEntrada, @HoraSalida, @horas_trabajadas);

        SELECT SCOPE_IDENTITY() as id_asistencia;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerAsistencia
    @IdAsistencia INT
AS
BEGIN
    SELECT * FROM ASISTENCIAS WHERE IdAsistencia = @IdAsistencia;
END;
GO

CREATE PROCEDURE sp_ListarAsistencias
    @IdEmpleado INT = NULL,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL,
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    SELECT a.*, e.nombre as nombre_empleado
    FROM ASISTENCIAS a
    INNER JOIN EMPLEADOS e ON a.IdEmpleado = e.IdEmpleado
    WHERE (@IdEmpleado IS NULL OR a.IdEmpleado = @IdEmpleado)
    AND (@FechaInicio IS NULL OR a.fecha >= @FechaInicio)
    AND (@FechaFin IS NULL OR a.fecha <= @FechaFin);
END;
GO

CREATE PROCEDURE sp_ActualizarAsistencia
    @IdAsistencia INT,
    @HoraEntrada TIME,
    @HoraSalida TIME,
    @HorasTrabajadas DECIMAL(5,2),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM ASISTENCIAS WHERE IdAsistencia = @IdAsistencia)
            THROW 51000, 'Asistencia no encontrada', 1;

        UPDATE ASISTENCIAS
        SET HoraEntrada = @HoraEntrada,
            HoraSalida = @HoraSalida,
            HorasTrabajadas = @HorasTrabajadas,
			AdicionadoPor = @AdicionadoPor,
			FechaAdicion = @FechaAdicion,
			ModificadoPor = @ModificadoPor
        WHERE IdAsistencia = @IdAsistencia;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarAsistencia
    @IdAsistencia INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM ASISTENCIAS WHERE IdAsistencia = @IdAsistencia)
            THROW 51000, 'Asistencia no encontrada', 1;

        DELETE FROM ASISTENCIAS WHERE IdAsistencia = @IdAsistencia;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA NOMINA
-- ================================================

CREATE PROCEDURE sp_CrearNomina
    @IdEmpleado INT,
    @Mes NVARCHAR(20),
    @SalarioBase DECIMAL(10,2),
    @HorasExtras DECIMAL(5,2),
    @Deducciones DECIMAL(10,2),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @IdEmpleado)
            THROW 51000, 'Empleado no encontrado', 1;

        DECLARE @salario_neto DECIMAL(10,2);
        SET @salario_neto = @SalarioBase + (@HorasExtras * (@SalarioBase/160)) - @deducciones;

        INSERT INTO NOMINA (IdEmpleado, mes, SalarioBase, HorasExtras, deducciones, SalarioNeto,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@IdEmpleado, @Mes, @SalarioBase, @HorasExtras, @Deducciones, @salario_neto,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as IdNomina;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerNomina
    @id_nomina INT
AS
BEGIN
    SELECT n.*, e.Nombre as nombre_empleado
    FROM NOMINA n
    INNER JOIN EMPLEADOS e ON n.IdEmpleado = e.IdEmpleado
    WHERE n.IdNomina = @id_nomina;
END;
GO

CREATE PROCEDURE sp_ListarNominas
    @IdEmpleado INT = NULL,
    @Mes NVARCHAR(20) = NULL
AS
BEGIN
    SELECT n.*, e.nombre as nombre_empleado
    FROM NOMINA n
    INNER JOIN EMPLEADOS e ON n.IdEmpleado = e.IdEmpleado
    WHERE (@IdEmpleado IS NULL OR n.IdEmpleado = @IdEmpleado)
    AND (@Mes IS NULL OR n.Mes = @Mes);
END;
GO

CREATE PROCEDURE sp_ActualizarNomina
    @id_nomina INT,
    @horas_extras DECIMAL(5,2),
    @deducciones DECIMAL(10,2),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM NOMINA WHERE IdNomina = @id_nomina)
            THROW 51000, 'Nómina no encontrada', 1;

        DECLARE @salario_base DECIMAL(10,2);
        SELECT @salario_base = SalarioBase FROM NOMINA WHERE IdNomina = @id_nomina;

        DECLARE @salario_neto DECIMAL(10,2);
        SET @salario_neto = @salario_base + (@horas_extras * (@salario_base/160)) - @deducciones;

        UPDATE NOMINA
        SET HorasExtras = @horas_extras,
            Deducciones = @deducciones,
            SalarioNeto = @salario_neto
        WHERE IdNomina = @id_nomina;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarNomina
    @id_nomina INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM NOMINA WHERE IdNomina = @id_nomina)
            THROW 51000, 'Nómina no encontrada', 1;

        DELETE FROM NOMINA WHERE IdNomina = @id_nomina;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA VACACIONES
-- ================================================

CREATE PROCEDURE sp_SolicitarVacaciones
  
    @id_empleado INT,
    @fecha_inicio DATE,
    @fecha_fin DATE,
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @id_empleado)
            THROW 51000, 'Empleado no encontrado', 1;

        DECLARE @dias_solicitados INT = DATEDIFF(DAY, @fecha_inicio, @fecha_fin) + 1;
        DECLARE @dias_disponibles INT;

        SELECT @dias_disponibles = DiasDisponibles 
        FROM VACACIONES 
        WHERE IdEmpleado = @id_empleado 
        AND FechaInicio IS NULL;

        IF @dias_disponibles IS NULL
            SET @dias_disponibles = 30; -- Asumiendo 30 días por defecto para nuevos empleados

        IF @dias_solicitados > @dias_disponibles
            THROW 51000, 'Días solicitados exceden los días disponibles', 1;

        INSERT INTO VACACIONES (
            IdEmpleado,
            DiasDisponibles,
            DiasUsados,
            FechaSolicitud,
            FechaInicio,
            FechaFin,
            Estado,
			AdicionadoPor,
			FechaAdicion,
			ModificadoPor,
			FechaModificacion
        )
        VALUES (
            @id_empleado,
            @dias_disponibles - @dias_solicitados,
            @dias_solicitados,
            GETDATE(),
            @fecha_inicio,
            @fecha_fin,
            'Pendiente',
		    @AdicionadoPor ,
	        @FechaAdicion ,
	        @ModificadoPor ,
	        @FechaModificacion 
        );

        SELECT SCOPE_IDENTITY() as IdVacacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerVacaciones
    @id_vacacion INT
AS
BEGIN
    SELECT v.*, e.nombre as nombre_empleado
    FROM VACACIONES v
    INNER JOIN EMPLEADOS e ON v.IdEmpleado = e.IdEmpleado
    WHERE v.IdVacacion = @id_vacacion;
END;
GO

CREATE PROCEDURE sp_ListarVacaciones
    @id_empleado INT = NULL,
    @estado NVARCHAR(20) = NULL
AS
BEGIN
    SELECT v.*, e.nombre as nombre_empleado
    FROM VACACIONES v
    INNER JOIN EMPLEADOS e ON v.IdEmpleado = e.IdEmpleado
    WHERE (@id_empleado IS NULL OR v.IdEmpleado = @id_empleado)
    AND (@estado IS NULL OR v.estado = @estado);
END;
GO

CREATE PROCEDURE sp_ActualizarEstadoVacaciones
    @id_vacacion INT,
    @estado NVARCHAR(20)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM VACACIONES WHERE IdVacacion = @id_vacacion)
            THROW 51000, 'Solicitud de vacaciones no encontrada', 1;

        IF @estado NOT IN ('Pendiente', 'Aprobado', 'Rechazado')
            THROW 51000, 'Estado no válido', 1;

        UPDATE VACACIONES
        SET estado = @estado
        WHERE IdVacacion = @id_vacacion;

        -- Si se rechaza, devolver los días al balance disponible
        IF @estado = 'Rechazado'
        BEGIN
            DECLARE @dias_usados INT;
            SELECT @dias_usados = DiasUsados 
            FROM VACACIONES 
            WHERE IdVacacion = @id_vacacion;

            UPDATE VACACIONES
            SET DiasDisponibles = DiasDisponibles + @dias_usados,
                DiasUsados = 0
            WHERE IdVacacion = @id_vacacion;
        END
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarVacaciones
    @id_vacacion INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM VACACIONES WHERE IdVacacion = @id_vacacion)
            THROW 51000, 'Solicitud de vacaciones no encontrada', 1;

        DELETE FROM VACACIONES WHERE IdVacacion = @id_vacacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA PERMISOS_LICENCIAS
-- ================================================

CREATE PROCEDURE sp_CrearPermiso
    @id_empleado INT,
    @tipo NVARCHAR(50),
    @fecha_inicio DATE,
    @fecha_fin DATE,
    @descripcion NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @id_empleado)
            THROW 51000, 'Empleado no encontrado', 1;

        INSERT INTO PERMISOS_LICENCIAS (IdEmpleado, Tipo, FechaInicio, FechaFin, Descripcion,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@id_empleado, @tipo, @fecha_inicio, @fecha_fin, @descripcion,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_permiso;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerPermiso
    @id_permiso INT
AS
BEGIN
    SELECT p.*, e.nombre as nombre_empleado
    FROM PERMISOS_LICENCIAS p
    INNER JOIN EMPLEADOS e ON p.IdEmpleado = e.IdEmpleado
    WHERE p.IdPermiso = @id_permiso;
END;
GO

CREATE PROCEDURE sp_ListarPermisos
    @id_empleado INT = NULL,
    @tipo NVARCHAR(50) = NULL
AS
BEGIN
    SELECT p.*, e.nombre as nombre_empleado
    FROM PERMISOS_LICENCIAS p
    INNER JOIN EMPLEADOS e ON p.IdEmpleado = e.idempleado
    WHERE (@id_empleado IS NULL OR p.idempleado = @id_empleado)
    AND (@tipo IS NULL OR p.tipo = @tipo);
END;
GO

CREATE PROCEDURE sp_ActualizarPermiso
    @id_permiso INT,
    @fecha_inicio DATE,
    @fecha_fin DATE,
    @descripcion NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM PERMISOS_LICENCIAS WHERE IdPermiso = @id_permiso)
            THROW 51000, 'Permiso no encontrado', 1;

        UPDATE PERMISOS_LICENCIAS
        SET FechaInicio = @fecha_inicio,
            FechaFin = @fecha_fin,
            Descripcion = @descripcion,
			AdicionadoPor = @AdicionadoPor,
			FechaAdicion = @FechaAdicion,
			ModificadoPor = @ModificadoPor,
			FechaModificacion = @FechaModificacion
        WHERE IdPermiso = @id_permiso;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarPermiso
    @id_permiso INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM PERMISOS_LICENCIAS WHERE IdPermiso = @id_permiso)
            THROW 51000, 'Permiso no encontrado', 1;

        DELETE FROM PERMISOS_LICENCIAS WHERE IdPermiso = @id_permiso;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA EVALUACIONES
-- ================================================

CREATE PROCEDURE sp_CrearEvaluacion
    @id_empleado INT,
    @fecha DATE,
    @indicadores NVARCHAR(255),
    @resultado NVARCHAR(50),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @id_empleado)
            THROW 51000, 'Empleado no encontrado', 1;

        INSERT INTO EVALUACIONES (IdEmpleado, fecha, indicadores, resultado,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@id_empleado, @fecha, @indicadores, @resultado,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_evaluacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerEvaluacion
    @id_evaluacion INT
AS
BEGIN
    SELECT e.*, em.nombre as nombre_empleado
    FROM EVALUACIONES e
    INNER JOIN EMPLEADOS em ON e.IdEmpleado = em.IdEmpleado
    WHERE e.IdEvaluacion = @id_evaluacion;
END;
GO

CREATE PROCEDURE sp_ListarEvaluaciones
    @id_empleado INT = NULL,
    @fecha_inicio DATE = NULL,
    @fecha_fin DATE = NULL,
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    SELECT e.*, em.nombre as nombre_empleado
    FROM EVALUACIONES e
    INNER JOIN EMPLEADOS em ON e.IdEmpleado = em.IdEmpleado
    WHERE (@id_empleado IS NULL OR e.IdEmpleado = @id_empleado)
    AND (@fecha_inicio IS NULL OR e.fecha >= @fecha_inicio)
    AND (@fecha_fin IS NULL OR e.fecha <= @fecha_fin)
	AND (@AdicionadoPor IS NULL OR e.AdicionadoPor <= @AdicionadoPor)
	AND (@FechaAdicion IS NULL OR e.FechaAdicion <= @FechaAdicion)
	AND (@ModificadoPor IS NULL OR e.ModificadoPor <= @ModificadoPor)
	AND (@FechaModificacion IS NULL OR e.FechaModificacion <= @FechaModificacion);
END;
GO

CREATE PROCEDURE sp_ActualizarEvaluacion
    @id_evaluacion INT,
    @indicadores NVARCHAR(255),
    @resultado NVARCHAR(50),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EVALUACIONES WHERE IdEvaluacion = @id_evaluacion)
            THROW 51000, 'Evaluación no encontrada', 1;

        UPDATE EVALUACIONES
        SET Indicadores = @indicadores,
            Resultado = @resultado,
			AdicionadoPor=@AdicionadoPor,
			FechaAdicion =@FechaAdicion,
			ModificadoPor=@ModificadoPor,
			FechaModificacion=@FechaModificacion
        WHERE IdEvaluacion = @id_evaluacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarEvaluacion
    @id_evaluacion INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EVALUACIONES WHERE IdEvaluacion = @id_evaluacion)
            THROW 51000, 'Evaluación no encontrada', 1;

        DELETE FROM EVALUACIONES WHERE IdEvaluacion = @id_evaluacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA CAPACITACIONES
-- ================================================

CREATE PROCEDURE sp_CrearCapacitacion
    @id_empleado INT,
    @curso NVARCHAR(100),
    @fecha_inicio DATE,
    @fecha_fin DATE,
    @certificacion NVARCHAR(50),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @id_empleado)
            THROW 51000, 'Empleado no encontrado', 1;

        INSERT INTO CAPACITACIONES (IdEmpleado, Curso, FechaInicio, FechaFin, Certificacion,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@id_empleado, @curso, @fecha_inicio, @fecha_fin, @certificacion,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_capacitacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerCapacitacion
    @id_capacitacion INT
AS
BEGIN
    SELECT c.*, e.nombre as nombre_empleado
    FROM CAPACITACIONES c
    INNER JOIN EMPLEADOS e ON c.IdEmpleado = e.IdEmpleado
    WHERE c.IdCapacitacion = @id_capacitacion;
END;
GO

CREATE PROCEDURE sp_ListarCapacitaciones
    @id_empleado INT = NULL,
    @curso NVARCHAR(100) = NULL,
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME

AS
BEGIN
    SELECT c.*, e.nombre as nombre_empleado
    FROM CAPACITACIONES c
    INNER JOIN EMPLEADOS e ON c.IdEmpleado = e.IdEmpleado
    WHERE (@id_empleado IS NULL OR c.idempleado = @id_empleado)
    AND (@curso IS NULL OR c.curso LIKE '%' + @curso + '%')
	AND (@AdicionadoPor IS NULL OR e.AdicionadoPor <= @AdicionadoPor)
	AND (@FechaAdicion IS NULL OR e.FechaAdicion <= @FechaAdicion)
	AND (@ModificadoPor IS NULL OR e.ModificadoPor <= @ModificadoPor)
	AND (@FechaModificacion IS NULL OR e.FechaModificacion <= @FechaModificacion);
END;
GO

CREATE PROCEDURE sp_ActualizarCapacitacion
    @id_capacitacion INT,
    @fecha_inicio DATE,
    @fecha_fin DATE,
    @certificacion NVARCHAR(50),
    @AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM CAPACITACIONES WHERE IdCapacitacion = @id_capacitacion)
            THROW 51000, 'Capacitación no encontrada', 1;

        UPDATE CAPACITACIONES
        SET FechaInicio = @fecha_inicio,
            FechaFin = @fecha_fin,
            Certificacion = @certificacion,
				AdicionadoPor=@AdicionadoPor,
			FechaAdicion =@FechaAdicion,
			ModificadoPor=@ModificadoPor,
			FechaModificacion=@FechaModificacion
        WHERE IdCapacitacion = @id_capacitacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarCapacitacion
    @id_capacitacion INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM CAPACITACIONES WHERE IdCapacitacion = @id_capacitacion)
            THROW 51000, 'Capacitación no encontrada', 1;

        DELETE FROM CAPACITACIONES WHERE IdCapacitacion = @id_capacitacion;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA BENEFICIOS
-- ================================================

CREATE PROCEDURE sp_CrearBeneficio
    @id_empleado INT,
    @tipo NVARCHAR(50),
    @valor DECIMAL(10,2),
    @descripcion NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @id_empleado)
            THROW 51000, 'Empleado no encontrado', 1;

        INSERT INTO BENEFICIOS (IdEmpleado, tipo, valor, descripcion,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@id_empleado, @tipo, @valor, @descripcion,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_beneficio;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerBeneficio
    @id_beneficio INT
AS
BEGIN
    SELECT b.*, e.nombre as nombre_empleado
    FROM BENEFICIOS b
    INNER JOIN EMPLEADOS e ON b.IdEmpleado = e.IdEmpleado
    WHERE b.IdBeneficio = @id_beneficio;
END;
GO

CREATE PROCEDURE sp_ListarBeneficios
    @id_empleado INT = NULL,
    @tipo NVARCHAR(50) = NULL,
	@AdicionadoPor NVARCHAR,
	@FechaAdicion DATETIME,
	@ModificadoPor NVARCHAR,
	@FechaModificacion DATETIME
AS
BEGIN
    SELECT b.*, e.nombre as nombre_empleado
    FROM BENEFICIOS b
    INNER JOIN EMPLEADOS e ON b.IdEmpleado = e.IdEmpleado
    WHERE (@id_empleado IS NULL OR b.IdEmpleado = @id_empleado)
    AND (@tipo IS NULL OR b.tipo = @tipo)
	AND (@AdicionadoPor IS NULL OR e.AdicionadoPor <= @AdicionadoPor)
	AND (@FechaAdicion IS NULL OR e.FechaAdicion <= @FechaAdicion)
	AND (@ModificadoPor IS NULL OR e.ModificadoPor <= @ModificadoPor)
	AND (@FechaModificacion IS NULL OR e.FechaModificacion <= @FechaModificacion);
END;
GO

CREATE PROCEDURE sp_ActualizarBeneficio
    @id_beneficio INT,
    @valor DECIMAL(10,2),
    @descripcion NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM BENEFICIOS WHERE IdBeneficio = @id_beneficio)
            THROW 51000, 'Beneficio no encontrado', 1;

        UPDATE BENEFICIOS
        SET valor = @valor,
            descripcion = @descripcion,
			AdicionadoPor=@AdicionadoPor,
			FechaAdicion =@FechaAdicion,
			ModificadoPor=@ModificadoPor,
			FechaModificacion=@FechaModificacion
        WHERE IdBeneficio = @id_beneficio;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarBeneficio
    @id_beneficio INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM BENEFICIOS WHERE IdBeneficio = @id_beneficio)
            THROW 51000, 'Beneficio no encontrado', 1;

        DELETE FROM BENEFICIOS WHERE IdBeneficio = @id_beneficio;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA VACANTES
-- ================================================

CREATE PROCEDURE sp_CrearVacante
    @puesto NVARCHAR(50),
    @departamento NVARCHAR(50),
    @descripcion NVARCHAR(255),
    @estado NVARCHAR(20),
	@AdicionadoPor NVARCHAR,
    @FechaAdicion DATETIME,
    @ModificadoPor NVARCHAR,
    @FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF @estado NOT IN ('Abierta', 'Cerrada')
            THROW 51000, 'Estado no válido', 1;

        INSERT INTO VACANTES (puesto, departamento, descripcion, estado,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@puesto, @departamento, @descripcion, @estado,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_vacante;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerVacante
    @id_vacante INT
AS
BEGIN
    SELECT * FROM VACANTES WHERE IdVacante = @id_vacante;
END;
GO

CREATE PROCEDURE sp_ListarVacantes
    @departamento NVARCHAR(50) = NULL,
    @estado NVARCHAR(20) = NULL,
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    SELECT *
    FROM VACANTES v
    WHERE (@departamento IS NULL OR departamento = @departamento)
    AND (@estado IS NULL OR estado = @estado)
	AND (@AdicionadoPor IS NULL OR v.AdicionadoPor <= @AdicionadoPor)
    AND (@FechaAdicion IS NULL OR v.FechaAdicion <= @FechaAdicion)
    AND (@ModificadoPor IS NULL OR v.ModificadoPor <= @ModificadoPor)
    AND (@FechaModificacion IS NULL OR v.FechaModificacion <=@FechaModificacion);;
END;
GO

CREATE PROCEDURE sp_ActualizarVacante
    @id_vacante INT,
    @descripcion NVARCHAR(255),
    @estado NVARCHAR(20),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM VACANTES WHERE IdVacante = @id_vacante)
            THROW 51000, 'Vacante no encontrada', 1;

        IF @estado NOT IN ('Abierta', 'Cerrada')
            THROW 51000, 'Estado no válido', 1;

        UPDATE VACANTES
        SET descripcion = @descripcion,
            estado = @estado,
			AdicionadoPor=@AdicionadoPor,
FechaAdicion =@FechaAdicion,
ModificadoPor=@ModificadoPor,
FechaModificacion=@FechaModificacion

        WHERE IdVacante = @id_vacante;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarVacante
    @id_vacante INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM VACANTES WHERE IdVacante = @id_vacante)
            THROW 51000, 'Vacante no encontrada', 1;

        DELETE FROM VACANTES WHERE IdVacante = @id_vacante;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA SOLICITANTES
-- ================================================

CREATE PROCEDURE sp_CrearSolicitante
    @nombre NVARCHAR(100),
    @curriculo NVARCHAR(255),
	@correo NVARCHAR(255),
	@telefono NVARCHAR(255),
    @sexo NVARCHAR(255),
	@direccion NVARCHAR(255),
    @id_vacante INT,
    @estado NVARCHAR(20),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM VACANTES WHERE IdVacante = @id_vacante)
            THROW 51000, 'Vacante no encontrada', 1;

        IF @estado NOT IN ('Pendiente', 'Entrevista', 'Seleccionado', 'Rechazado')
            THROW 51000, 'Estado no válido', 1;

        INSERT INTO SOLICITANTES (nombre, curriculo, IdVacante, estado,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
         VALUES (@nombre, @curriculo, @id_vacante, @estado,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_solicitante;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerSolicitante
    @id_solicitante INT
AS
BEGIN
    SELECT s.*, v.puesto, v.departamento
    FROM SOLICITANTES s
    INNER JOIN VACANTES v ON s.IdVacante = v.IdVacante
    WHERE s.IdSolicitante = @id_solicitante;
END;
GO

CREATE PROCEDURE sp_ListarSolicitantes
     @nombre NVARCHAR(100),
    @curriculo NVARCHAR(255),
	@correo NVARCHAR(255),
	@telefono NVARCHAR(255),
    @sexo NVARCHAR(255),
	@direccion NVARCHAR(255),
    @id_vacante INT,
    @estado NVARCHAR(20),
	@AdicionadoPor NVARCHAR,
    @FechaAdicion DATETIME,
    @ModificadoPor NVARCHAR,
    @FechaModificacion DATETIME

AS
BEGIN
    SELECT s.*, v.puesto, v.departamento
    FROM SOLICITANTES s
    INNER JOIN VACANTES v ON s.IdVacante = v.IdVacante
    WHERE (@id_vacante IS NULL OR s.IdVacante = @id_vacante)
    AND (@nombre IS NULL OR s.Nombre = @nombre)
	AND (@curriculo IS NULL OR s.Curriculo = @curriculo)
	AND (@telefono IS NULL OR s.Telefono = @telefono)
	AND (@nombre IS NULL OR s.Nombre = @nombre)
	AND (@sexo IS NULL OR s.estado = @sexo)
	AND (@direccion IS NULL OR s.direccion = @direccion)
	AND (@estado IS NULL OR s.Estado = @estado)
	AND (@AdicionadoPor IS NULL OR s.AdicionadoPor = @AdicionadoPor)
	AND (@FechaAdicion IS NULL OR s.FechaAdicion = @FechaAdicion)
	AND (@ModificadoPor IS NULL OR s.ModificadoPor = @ModificadoPor)
	AND (@FechaModificacion IS NULL OR s.FechaModificacion = @FechaModificacion)
	AND (@nombre IS NULL OR s.Nombre = @nombre);
END;
GO

CREATE PROCEDURE sp_ActualizarSolicitante
    @id_solicitante INT,
   @nombre NVARCHAR(100),
    @curriculo NVARCHAR(255),
	@correo NVARCHAR(255),
	@telefono NVARCHAR(255),
    @sexo NVARCHAR(255),
	@direccion NVARCHAR(255),
    @id_vacante INT,
    @estado NVARCHAR(20),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM SOLICITANTES WHERE IdSolicitante = @id_solicitante)
            THROW 51000, 'Solicitante no encontrado', 1;

        IF @estado NOT IN ('Pendiente', 'Entrevista', 'Seleccionado', 'Rechazado')
            THROW 51000, 'Estado no válido', 1;

        UPDATE SOLICITANTES
        SET Nombre= @nombre,
		    Curriculo=@curriculo,
			Correo=@correo,
			Telefono=@telefono,
			Sexo=@sexo,
			direccion=@direccion,
			IdVacante=@id_vacante,
            estado = @estado,
			AdicionadoPor=@AdicionadoPor,
FechaAdicion =@FechaAdicion,
ModificadoPor=@ModificadoPor,
FechaModificacion=@FechaModificacion

        WHERE IdSolicitante = @id_solicitante;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarSolicitante
    @id_solicitante INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM SOLICITANTES WHERE IdSolicitante = @id_solicitante)
            THROW 51000, 'Solicitante no encontrado', 1;

        DELETE FROM SOLICITANTES WHERE IdSolicitante = @id_solicitante;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA INCIDENTES
-- ================================================

CREATE PROCEDURE sp_CrearIncidente
    @id_empleado INT,
    @fecha DATE,
    @tipo NVARCHAR(50),
    @descripcion NVARCHAR(250),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @id_empleado)
            THROW 51000, 'Empleado no encontrado', 1;

        INSERT INTO INCIDENTES (IdEmpleado, fecha, tipo, descripcion,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@id_empleado, @fecha, @tipo, @descripcion,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_incidente;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerIncidente
    @id_incidente INT
AS
BEGIN
    SELECT i.*, e.nombre as nombre_empleado
    FROM INCIDENTES i
    INNER JOIN EMPLEADOS e ON i.IdEmpleado = e.IdEmpleado
    WHERE i.IdIncidente = @id_incidente;
END;
GO

CREATE PROCEDURE sp_ListarIncidentes
    @id_empleado INT = NULL,
    @tipo NVARCHAR(50) = NULL,
    @fecha_inicio DATE = NULL,
    @fecha_fin DATE = NULL,
	@AdicionadoPor NVARCHAR,
    @FechaAdicion DATETIME,
    @ModificadoPor NVARCHAR,
    @FechaModificacion DATETIME

AS
BEGIN
    SELECT i.*, e.nombre as nombre_empleado
    FROM INCIDENTES i
    INNER JOIN EMPLEADOS e ON i.IdEmpleado = e.IdEmpleado
    WHERE (@id_empleado IS NULL OR i.IdEmpleado = @id_empleado)
    AND (@tipo IS NULL OR i.tipo = @tipo)
    AND (@fecha_inicio IS NULL OR i.fecha >= @fecha_inicio)
    AND (@fecha_fin IS NULL OR i.fecha <= @fecha_fin)
	AND (@AdicionadoPor IS NULL OR i.AdicionadoPor = @AdicionadoPor)
	AND (@FechaAdicion IS NULL OR i.FechaAdicion = @FechaAdicion)
	AND (@ModificadoPor IS NULL OR i.ModificadoPor = @ModificadoPor)
	AND (@FechaModificacion IS NULL OR i.FechaModificacion = @FechaModificacion);
END;
GO

CREATE PROCEDURE sp_ActualizarIncidente
    @id_incidente INT,
    @tipo NVARCHAR(50),
    @descripcion NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
    @FechaAdicion DATETIME,
    @ModificadoPor NVARCHAR,
    @FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM INCIDENTES WHERE IdIncidente = @id_incidente)
            THROW 51000, 'Incidente no encontrado', 1;

        UPDATE INCIDENTES
        SET tipo = @tipo,
            descripcion = @descripcion,
			AdicionadoPor=@AdicionadoPor,
FechaAdicion =@FechaAdicion,
ModificadoPor=@ModificadoPor,
FechaModificacion=@FechaModificacion

        WHERE IdIncidente = @id_incidente;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarIncidente
    @id_incidente INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM INCIDENTES WHERE IdIncidente = @id_incidente)
            THROW 51000, 'Incidente no encontrado', 1;

        DELETE FROM INCIDENTES WHERE IdIncidente = @id_incidente;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA REPORTES
-- ================================================

CREATE PROCEDURE sp_CrearReporte
    @IdEmpleado Int,
    @titulo NVARCHAR(100),
    @descripcion NVARCHAR(255),
    @autor NVARCHAR(50),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        INSERT INTO REPORTES (IdEmpleado, titulo, descripcion, FechaGeneracion, autor,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@IdEmpleado, @titulo, @descripcion, GETDATE(), @autor,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_reporte;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerReporte
    @id_reporte INT
AS
BEGIN
    SELECT * FROM REPORTES WHERE IdReporte = @id_reporte;
END;
GO

CREATE PROCEDURE sp_ListarReportes
    @fecha_inicio DATE = NULL,
    @fecha_fin DATE = NULL,
    @autor NVARCHAR(50) = NULL
AS
BEGIN
    SELECT *
    FROM REPORTES
    WHERE (@fecha_inicio IS NULL OR FechaGeneracion >= @fecha_inicio)
    AND (@fecha_fin IS NULL OR FechaGeneracion <= @fecha_fin)
    AND (@autor IS NULL OR autor = @autor);
END;
GO

CREATE PROCEDURE sp_ActualizarReporte
    @id_reporte INT,
    @titulo NVARCHAR(100),
    @descripcion NVARCHAR(255),
	@fechaGeneracion datetime,
	@autor  NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM REPORTES WHERE IdReporte = @id_reporte)
            THROW 51000, 'Reporte no encontrado', 1;

        UPDATE REPORTES
        SET titulo = @titulo,
            descripcion = @descripcion,
			FechaGeneracion=@fechaGeneracion,
			Autor=@Autor,
			AdicionadoPor=@AdicionadoPor,
FechaAdicion =@FechaAdicion,
ModificadoPor=@ModificadoPor,
FechaModificacion=@FechaModificacion
        WHERE IdReporte = @id_reporte;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarReporte
    @id_reporte INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM REPORTES WHERE IdReporte = @id_reporte)
            THROW 51000, 'Reporte no encontrado', 1;

        DELETE FROM REPORTES WHERE idreporte = @id_reporte;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

-- ================================================
-- PROCEDIMIENTOS ALMACENADOS PARA TABLA DISCIPLINA
-- ================================================

CREATE PROCEDURE sp_CrearDisciplina
    @id_empleado INT,
    @tipo NVARCHAR(50),
    @descripcion NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM EMPLEADOS WHERE IdEmpleado = @id_empleado)
            THROW 51000, 'Empleado no encontrado', 1;

        INSERT INTO DISCIPLINA (IdEmpleado, tipo, fecha, descripcion,AdicionadoPor,FechaAdicion,ModificadoPor,FechaModificacion)
        VALUES (@id_empleado, @tipo, GETDATE(), @descripcion,@AdicionadoPor,@FechaAdicion,@ModificadoPor,@FechaModificacion);

        SELECT SCOPE_IDENTITY() as id_disciplina;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_ObtenerDisciplina
    @id_disciplina INT
AS
BEGIN
    SELECT d.*, e.nombre as nombre_empleado
    FROM DISCIPLINA d
    INNER JOIN EMPLEADOS e ON d.IdEmpleado = e.IdEmpleado
    WHERE d.IdDisciplina = @id_disciplina;
END;
GO

CREATE PROCEDURE sp_ListarDisciplinas
    @id_empleado INT = NULL,
    @tipo NVARCHAR(50) = NULL,
    @fecha_inicio DATE = NULL,
    @fecha_fin DATE = NULL,
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    SELECT d.*, e.nombre as nombre_empleado
    FROM DISCIPLINA d
    INNER JOIN EMPLEADOS e ON d.IdEmpleado = e.IdEmpleado
    WHERE (@id_empleado IS NULL OR d.IdEmpleado = @id_empleado)
    AND (@tipo IS NULL OR d.tipo = @tipo)
    AND (@fecha_inicio IS NULL OR d.fecha >= @fecha_inicio)
    AND (@fecha_fin IS NULL OR d.fecha <= @fecha_fin)
	AND (@AdicionadoPor IS NULL OR d.AdicionadoPor <= @AdicionadoPor)
	AND (@FechaAdicion IS NULL OR d.FechaAdicion <= @FechaAdicion)
	AND (@ModificadoPor IS NULL OR d.ModificadoPor <= @ModificadoPor)
	AND (@FechaModificacion IS NULL OR d.FechaModificacion <= @FechaModificacion);
END;
GO

CREATE PROCEDURE sp_ActualizarDisciplina
    @id_disciplina INT,
    @tipo NVARCHAR(50),
    @descripcion NVARCHAR(255),
	@AdicionadoPor NVARCHAR,
@FechaAdicion DATETIME,
@ModificadoPor NVARCHAR,
@FechaModificacion DATETIME

AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM DISCIPLINA WHERE IdDisciplina = @id_disciplina)
            THROW 51000, 'Registro disciplinario no encontrado', 1;

        UPDATE DISCIPLINA
        SET tipo = @tipo,
            descripcion = @descripcion,
			AdicionadoPor=@AdicionadoPor,
FechaAdicion =@FechaAdicion,
ModificadoPor=@ModificadoPor,
FechaModificacion=@FechaModificacion

        WHERE IdDisciplina = @id_disciplina;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarDisciplina
    @id_disciplina INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM DISCIPLINA WHERE IdDisciplina = @id_disciplina)
            THROW 51000, 'Registro disciplinario no encontrado', 1;

        DELETE FROM DISCIPLINA WHERE IdDisciplina = @id_disciplina;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO