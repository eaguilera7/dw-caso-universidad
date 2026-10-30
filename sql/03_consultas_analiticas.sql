SELECT 
    c.Nombre_Curso,
    t.Año,
    ROUND(AVG(f.Nota_Obtenida), 2) AS Promedio_Nota
FROM Fact_Examen f
JOIN Dim_Curso c ON f.SK_Curso = c.SK_Curso
JOIN Dim_Tiempo t ON f.SK_Tiempo = t.SK_Tiempo
GROUP BY c.Nombre_Curso, t.Año
ORDER BY c.Nombre_Curso, t.Año;