SELECT 
    p.Facultad,
    t.Mes,
    t.Año,
    ROUND(AVG(f.Porcentaje_Aprobación), 2) AS Promedio_Porcentaje_Aprobacion
FROM Fact_Examen f
JOIN Dim_Profesor p ON f.SK_Profesor = p.SK_Profesor
JOIN Dim_Tiempo t ON f.SK_Tiempo = t.SK_Tiempo
GROUP BY p.Facultad, t.Año, t.Mes
ORDER BY p.Facultad, t.Año, t.Mes;