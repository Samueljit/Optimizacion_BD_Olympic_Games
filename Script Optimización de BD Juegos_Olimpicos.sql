

--Optimizaremos/Limpiaremos los datos de manera que se pueda manipular y entender mejor--

SELECT  ID,
		Name AS 'Nombre del Competidos',
		CASE
			WHEN Sex = 'M' THEN 'Masculino' --Mejoramos la visualización y entendimiento del campo--
			ELSE 'Femenino'
			END AS Sexo,
		CASE
			WHEN Age < 18 THEN 'Menor de 18 Años'
			WHEN Age BETWEEN 18 and 15 THEN '18 a 25 Años'
			WHEN Age BETWEEN 25 and 30 THEN '25 a 30 Años'
			WHEN Age > 30 THEN 'Mayores a 30 Años'
		END as 'Medidad Eddad',
		Height AS Tamaño,
		Weight AS Peso,
		NOC AS 'Codigo Nación', --Explico la Abreviación--
		LEFT(Games,CHARINDEX(' ',Games)-1) AS Año,-- columna dividia para aislar el año, según el espacio--
		RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) AS Estación,-- columna dividia para aislar la estación, según el espacio--
		Games AS Juegos,
		Sport AS Deporte,
		Event AS Evento,
		CASE 
			WHEN Medal = 'NA' THEN 'No Registrado' ELSE Medal--Reemplazo el NA por no registrado--
		END AS Medalla
FROM olympic_games..athletes_event_results
WHERE RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) = 'Summer' -- Separo la clausula donde la estación sea verano--

SELECT Medal, Games
FROM olympic_games..athletes_event_results
WHERE not Medal = 'NA' and Games LIKE '%Summer'
Group by Games, Medal
