# Caso 3: Universidad — Modelo Estrella con Llaves Surrogadas

**Universidad Tecnológica Indoamérica** · Facultad de Ingenierías  
- **Integrantes del Caso:** Emilio Aguilera y Jonathan Naranjo
- **Entorno Técnico:** PostgreSQL (v15+) / pgAdmin 4 / Git y GitHub

---

## 1. Descripción del Caso de Estudio

Este proyecto implementa un modelo dimensional en **Esquema Estrella (Star Schema)** con llaves primarias surrogadas (`SK`) e identificadores de negocio o llaves naturales (`NK`) para analizar el rendimiento académico y los resultados de evaluaciones universitarias.

### Tabla de Hechos: `Fact_Examen`
Registra los resultados cuantitativos de cada evaluación rendida y centraliza la relación con las dimensiones del modelo:
- **Llaves Foráneas (FK):** `SK_Estudiante`, `SK_Tiempo`, `SK_Curso`, `SK_Profesor`
- **Métricas:**
  - `Nota_Obtenida`: Calificación numérica obtenida en el examen.
  - `Porcentaje_Aprobación`: Porcentaje de aprobación registrado en la evaluación.

### Dimensiones del Modelo

| Tabla de Dimensión | Llave Surrogada (PK) | Llave Natural (NK) | Atributos Descriptivos |
| :--- | :--- | :--- | :--- |
| **`Dim_Estudiante`** | `SK_Estudiante` | `ID_Estudiante_NK` | `Nombre`, `Provincia` |
| **`Dim_Tiempo`** | `SK_Tiempo` | *(No aplica)* | `Fecha`, `Año`, `Mes`, `Día` |
| **`Dim_Curso`** | `SK_Curso` | `ID_Curso_NK` | `Nombre_Curso`, `Créditos` |
| **`Dim_Profesor`** | `SK_Profesor` | `ID_Profesor_NK` | `Nombre`, `Facultad` |

---

## 2. Enunciados de Consultas Analíticas

Las consultas de negocio requeridas por el caso de estudio se encuentran separadas en dos scripts independientes dentro del directorio `sql/`:

### Consulta 1: Promedio de notas por curso y año
- **Archivo:** `sql/03_consultas_analiticas.sql`
- **Lo que solicita la consulta:** Obtener el promedio de las calificaciones (`Nota_Obtenida`) agrupado por asignatura y periodo anual.
- **Implementación:** Realiza la unión (`JOIN`) entre la tabla de hechos `Fact_Examen` y las dimensiones `Dim_Curso` (mediante `SK_Curso`) y `Dim_Tiempo` (mediante `SK_Tiempo`), aplicando la función de agregación `AVG(Nota_Obtenida)` redondeada a dos decimales y agrupando por `Nombre_Curso` y `Año`.

### Consulta 2: Porcentaje de aprobación por facultad y mes
- **Archivo:** `sql/04_consultas_analiticas.sql`
- **Lo que solicita la consulta:** Calcular el porcentaje promedio de aprobación (`Porcentaje_Aprobación`) segmentado por facultad académica y mes calendario.
- **Implementación:** Relaciona la tabla de hechos `Fact_Examen` con las dimensiones `Dim_Profesor` (mediante `SK_Profesor`) y `Dim_Tiempo` (mediante `SK_Tiempo`), calculando `AVG(Porcentaje_Aprobación)` redondeado a dos decimales y agrupando los resultados por `Facultad`, `Año` y `Mes`.

---

## 3. Estructura del Repositorio

    dw-caso-universidad/
    ├── docs/
    │   └── Caso de estudio y diagrama del modelo estrella
    ├── sql/
    │   ├── 01_ddl_esquema_estrella.sql   # Creación física DDL de dimensiones y tabla Fact_Examen
    │   ├── 02_dml_insercion_datos.sql    # Inserción DML de datos de prueba en dimensiones y hechos
    │   ├── 03_consultas_analiticas.sql   # Consulta 1: Promedio de notas por curso y año
    │   └── 04_consultas_analiticas.sql   # Consulta 2: Porcentaje de aprobación por facultad y mes
    └── README.md                         # Documentación general del caso de estudio y consultas

---

## 4. Instrucciones de Ejecución en pgAdmin 4

1. Crear una base de datos en PostgreSQL llamada `dw_universidad`.
2. Abrir **Query Tool** sobre `dw_universidad` y ejecutar `sql/01_ddl_esquema_estrella.sql` para construir las dimensiones y la tabla de hechos con sus restricciones de llaves primarias y foráneas.
3. Ejecutar `sql/02_dml_insercion_datos.sql` para poblar el modelo con los registros de prueba.
4. Ejecutar `sql/03_consultas_analiticas.sql` para consultar el promedio de notas por curso y año.
5. Ejecutar `sql/04_consultas_analiticas.sql` para consultar el porcentaje de aprobación por facultad y mes.