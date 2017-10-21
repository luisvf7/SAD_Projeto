
__Nº Turnos p/ Tipo na UC SAD__
```sql
SELECT u.nomeuc, t.tipoturno, count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_ucs u ON (t.uc_id = u.id)
WHERE u.id = 229
GROUP BY u.nomeuc, t.tipoturno;
```
__Nº Estudantes em cada Turno__
```sql
SELECT t.id, t.turnouc ,count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
WHERE t.uc_id = 229
GROUP BY t.id, t.turnouc;
```


__Nº Minimo e Máximo de Estudantes Inscritos nos Turnos p/ TipoTurno , Ano e Curso__

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
