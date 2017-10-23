
__Nº Turnos p/ Tipo na UC SAD 1.1__
```sql
SELECT u.nomeuc, t.tipoturno, count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_ucs u ON (t.uc_id = u.id)
WHERE u.id = 229
GROUP BY u.nomeuc, t.tipoturno;
```
__Nº Estudantes em cada Turno 1.2__
```sql
SELECT t.id, t.turnouc ,count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
WHERE t.uc_id = 229
GROUP BY t.id, t.turnouc;
```


__Nº Minimo e Máximo de Estudantes Inscritos nos Turnos p/ TipoTurno , Ano e Curso 1.3__

```sql
SELECT t.anouc AS anoUc, t.tipoturno AS tipoTurno , t.turnouc AS turnoUc, count(*) AS numEstudantes
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
GROUP BY t.anouc, t.turnouc, t.tipoturno; 
```
**Resultado Final**
```sql
SELECT anoUc, tipoTurno, MIN(numEstudantes), MAX(numEstudantes)
FROM (SELECT t.anouc AS anoUc, t.tipoturno AS tipoTurno , t.turnouc AS turnoUc, count(*) AS numEstudantes
        FROM ei_sad_proj_gisem.v_turnos t
            JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
        GROUP BY t.anouc, t.turnouc, t.tipoturno)
GROUP BY anoUc, tipoTurno
ORDER BY 1;
```

__Nº de Estudantes Inscritos presentes nas Aulas p/ Turno , em SAD 2.1__

```sql
SELECT t.turnouc, aulas.num_presencas, aulas.semana
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
WHERE t.uc_id = 229
ORDER BY 3
;
```

__Nº Minimo e Máximo de Estudantes presentes nas Aulas p/ Turno , em SAD 2.2__

```sql
SELECT turnoUc, MIN(numPresencas), MAX(numPresencas)
FROM (SELECT t.turnouc AS turnoUc, aulas.num_presencas AS numPresencas
        FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
        WHERE t.uc_id = 229)
GROUP BY turnoUc
ORDER BY 1
;
```

__Percentagem de presenças em cada aula, por turno , em SAD 2.3__

```sql
SELECT t.id, aulas.semana, aulas.diasemana , t.turnouc AS turnoUc, ROUND((aulas.num_presencas/tuc.cont)*100, 2)
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
    JOIN (SELECT t.id AS turnoId, t.turnouc , count(*) AS cont
        FROM ei_sad_proj_gisem.v_turnos t
            JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
        WHERE t.uc_id = 229
        GROUP BY t.id, t.turnouc) tuc ON (t.id = tuc.turnoId)
WHERE t.uc_id = 229;
```

__Media de presenças nas aulas, por turno , em SAD 2.4__

```sql
SELECT t.turnouc, ROUND(AVG(aulas.num_presencas), 0) AS "Media de Presencas"
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
WHERE t.uc_id = 229
GROUP BY t.turnouc
;
```

__Momentos do semestre letivo em que existem picos de presenças nas aulas 2.6__

```sql
SELECT turnoUc, MIN(numPresencas), MAX(numPresencas)
FROM (SELECT t.turnouc AS turnoUc, aulas.num_presencas AS numPresencas
        FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
        WHERE t.uc_id = 229)
GROUP BY turnoUc
ORDER BY 1
;
```