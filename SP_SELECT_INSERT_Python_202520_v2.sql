-- =============================================
-- Author:		Geovanni Aucancela
-- Create date: 2025/02/02
-- Description:	SP, Listar Estudiantes
-- =============================================
drop procedure sp_ListadoEstudiantes
GO

ALTER PROCEDURE sp_ListadoEstudiantes
	@id_empleado int 
AS
BEGIN
	 BEGIN TRY
			 IF EXISTS (SELECT TOP 1 IDEstudiante FROM Estudiantes WHERE IDEstudiante=@id_empleado)
				SELECT EST.NombreEstudiante,EST.ApellidoEstudiante,EST.Email
				FROM Estudiantes EST
				WHERE EST.IDEstudiante=@id_empleado
		    ELSE
				BEGIN
					-- Estudiante no encontrado
					THROW 50001, 'SQL SERVER: ID de Estudiante NO Existe', 1;
				END
				
	 END TRY

    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorSQLServer;
            --ERROR_SEVERITY() AS ErrorSeverity,
            --ERROR_STATE() AS ErrorState,
            --ERROR_LINE() AS ErrorLine,
            --ERROR_PROCEDURE() AS ErrorProcedure;
    END CATCH
END
GO
-- Ejecutar SP Listado Estudiantes
EXECUTE sp_ListadoEstudiantes 1



 -- =============================================
-- Author:		Geovanni Aucancela
-- Create date: 2025/02/02
-- Description:	SP, Insertar Estudiante
-- =============================================

 CREATE PROCEDURE sp_insertaEstudiante
          @IDEstudiante int,
          @NombreEstudiante nvarchar(100),
          @ApellidoEstudiante nvarchar(100),
          @Email nvarchar(255),
          @Telefono nvarchar(20)
AS
BEGIN
	 BEGIN TRY
			 IF NOT EXISTS (SELECT TOP 1 IDEstudiante FROM Estudiantes WHERE IDEstudiante=@IDEstudiante)
						INSERT INTO [dbo].[Estudiantes]
					   ([IDEstudiante]
					   ,[NombreEstudiante]
					   ,[ApellidoEstudiante]
					   ,[Email]
					   ,[Telefono])
				 VALUES  (@IDEstudiante,
						   @NombreEstudiante,
						   @ApellidoEstudiante,
						   @Email,
						   @Telefono)
		    ELSE
				BEGIN
					-- Codio Estudiante existe
					THROW 50001, 'SQL SERVER: ID de Estudiante Existe', 1;
				END				
	 END TRY

    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorSQLServer;
    END CATCH
END
GO

-- Ejecutar SP Insertar Estudiantes

EXECUTE sp_insertaEstudiante 
          @IDEstudiante=6,
          @NombreEstudiante='Willian',
          @ApellidoEstudiante='Pacho',
          @Email='wpacho@gmail.com',
          @Telefono='0985762536'