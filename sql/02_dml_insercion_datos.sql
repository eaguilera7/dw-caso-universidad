-- Inserción de Dimensiones
INSERT INTO Dim_Estudiante (ID_Estudiante_NK, Nombre, Provincia) VALUES
('EST001', 'Carlos Mendoza', 'Pichincha'),
('EST002', 'Ana Morales', 'Guayas'),
('EST003', 'Luis Herrera', 'Tungurahua');

INSERT INTO Dim_Tiempo (Fecha, Año, Mes, Día) VALUES
('2025-06-15', 2025, 6, 15),
('2025-07-20', 2025, 7, 20),
('2026-01-10', 2026, 1, 10);

INSERT INTO Dim_Curso (ID_Curso_NK, Nombre_Curso, Créditos) VALUES
('CUR101', 'Bases de Datos Avanzadas', 4),
('CUR102', 'Inteligencia de Negocios', 3),
('CUR103', 'Minería de Datos', 4);

INSERT INTO Dim_Profesor (ID_Profesor_NK, Nombre, Facultad) VALUES
('PRF01', 'Ing. Roberto Silva', 'Facultad de Ingenierías'),
('PRF02', 'Dra. Elena Castro', 'Facultad de Ingenierías'),
('PRF03', 'Msc. David Paredes', 'Facultad de Ciencias Administrativas');

-- Inserción de Hechos
INSERT INTO Fact_Examen (SK_Estudiante, SK_Tiempo, SK_Curso, SK_Profesor, Nota_Obtenida, Porcentaje_Aprobación) VALUES
(1, 1, 1, 1, 8.50, 85.00),
(2, 1, 1, 1, 9.20, 92.00),
(3, 2, 2, 2, 7.80, 78.00),
(1, 3, 2, 2, 8.00, 80.00),
(2, 3, 3, 3, 6.50, 65.00);