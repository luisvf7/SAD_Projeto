
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
SELECT t.id, t.tipoturno, count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
WHERE t.uc_id = 229
GROUP BY t.id, t.tipoturno;
```

__Nº Minimo e Máximo de Estudantes Inscritos nos Turnos p/ TipoTurno , Ano e Curso__

(TQAM - Temos que arranjar esta meita)

```sql
SELECT tipoturno
FROM
	(SELECT t.id, t.turnouc, count(*) AS EstInscritos
	FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_turno_user tu (tu.turno_id = t.id)
	GROUP BY t.tipoturno, t.id, t.anouc)
GROUP BY tipoturno, anouc

SELECT t.id, t.turnouc, count(*) AS EstInscritos
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_turno_user tu (tu.turno_id = t.id)
GROUP BY t.tipoturno, t.id, t.anouc;
```
