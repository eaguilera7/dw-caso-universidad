-- 1. Dimensión Estudiante
CREATE TABLE Dim_Estudiante (
    SK_Estudiante SERIAL PRIMARY KEY,
    ID_Estudiante_NK VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Provincia VARCHAR(50) NOT NULL
);

-- 2. Dimensión Tiempo
CREATE TABLE Dim_Tiempo (
    SK_Tiempo SERIAL PRIMARY KEY,
    Fecha DATE NOT NULL,
    Año INT NOT NULL,
    Mes INT NOT NULL,
    Día INT NOT NULL
);

-- 3. Dimensión Curso
CREATE TABLE Dim_Curso (
    SK_Curso SERIAL PRIMARY KEY,
    ID_Curso_NK VARCHAR(20) NOT NULL,
    Nombre_Curso VARCHAR(100) NOT NULL,
    Créditos INT NOT NULL
);

-- 4. Dimensión Profesor
CREATE TABLE Dim_Profesor (
    SK_Profesor SERIAL PRIMARY KEY,
    ID_Profesor_NK VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Facultad VARCHAR(100) NOT NULL
);

-- 5. Tabla de Hechos: Fact_Examen
CREATE TABLE Fact_Examen (
    SK_Estudiante INT NOT NULL REFERENCES Dim_Estudiante(SK_Estudiante),
    SK_Tiempo INT NOT NULL REFERENCES Dim_Tiempo(SK_Tiempo),
    SK_Curso INT NOT NULL REFERENCES Dim_Curso(SK_Curso),
    SK_Profesor INT NOT NULL REFERENCES Dim_Profesor(SK_Profesor),
    Nota_Obtenida NUMERIC(4, 2) NOT NULL,
    Porcentaje_Aprobación NUMERIC(5, 2) NOT NULL,
    CONSTRAINT PK_Fact_Examen PRIMARY KEY (SK_Estudiante, SK_Tiempo, SK_Curso, SK_Profesor)
);