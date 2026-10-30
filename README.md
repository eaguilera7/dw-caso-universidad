# Modelo Estrella con Llaves Surrogadas - Caso Universidad

- **Estudiante:** [Tu Nombre Completo]
- **SGBD:** PostgreSQL / pgAdmin 4

## Estructura del Repositorio
- `docs/`: Documento del caso de estudio y diagrama del modelo dimensional.
- `sql/01_ddl_esquema_estrella.sql`: Creación física de dimensiones y tabla de hechos.
- `sql/02_dml_insercion_datos.sql`: Inserción de registros de prueba.
- `sql/03_consultas_analiticas.sql`: Consulta 1 - Promedio de notas por curso y año.
- `sql/04_consultas_analiticas.sql`: Consulta 2 - Porcentaje de aprobación por facultad y mes.

## Instrucciones de Ejecución en pgAdmin 4
1. Crear una base de datos llamada `dw_universidad`.
2. Abrir Query Tool y ejecutar `sql/01_ddl_esquema_estrella.sql`.
3. Ejecutar `sql/02_dml_insercion_datos.sql`.
4. Ejecutar `sql/03_consultas_analiticas.sql` y `sql/04_consultas_analiticas.sql` para visualizar los resultados.
