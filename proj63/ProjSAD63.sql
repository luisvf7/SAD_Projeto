--  1.1
SELECT u.nomeuc, t.tipoturno, count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_ucs u ON (t.uc_id = u.id)
WHERE u.id = 229
GROUP BY u.nomeuc, t.tipoturno;

--  1.2
SELECT t.id, t.turnouc ,count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
WHERE t.uc_id = 229
GROUP BY t.id, t.turnouc;

--  1.3
SELECT t.anouc, t.tipoturno, count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
GROUP BY t.anouc, t.tipoturno;

SELECT t.anouc AS anoUc, t.tipoturno AS tipoTurno , t.turnouc AS turnoUc, count(*) AS numEstudantes
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
GROUP BY t.anouc, t.turnouc, t.tipoturno;   

SELECT anoUc, tipoTurno, MIN(numEstudantes), MAX(numEstudantes)
FROM (SELECT t.anouc AS anoUc, t.tipoturno AS tipoTurno , t.turnouc AS turnoUc, count(*) AS numEstudantes
        FROM ei_sad_proj_gisem.v_turnos t
            JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
        GROUP BY t.anouc, t.turnouc, t.tipoturno)
GROUP BY anoUc, tipoTurno
ORDER BY 1;

--  1.4
SELECT ce.uc, ce.area_cientifica, t.tipoturno, count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN t_ext_curso_ei ce ON (ce.uc LIKE t.nomeuc || '%')
GROUP BY ce.uc, t.tipoturno,ce.area_cientifica;

--  2.1
SELECT t.turnouc, aulas.num_presencas, aulas.semana, aulas.diasemana
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
WHERE t.uc_id = 229
ORDER BY 3;

--  2.1
SELECT t.turnouc, aulas.num_presencas, aulas.semana
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
WHERE t.uc_id = 229
ORDER BY 3
;

--  2.2
SELECT turnoUc, MIN(numPresencas), MAX(numPresencas)
FROM (SELECT t.turnouc AS turnoUc, aulas.num_presencas AS numPresencas
        FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
        WHERE t.uc_id = 229)
GROUP BY turnoUc
ORDER BY 1
;

--  2.3
SELECT t.turnouc, aulas.num_presencas, aulas.semana
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
WHERE t.uc_id = 229
ORDER BY 3
;

SELECT t.id, t.turnouc , count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
WHERE t.uc_id = 229
GROUP BY t.id, t.turnouc;

--  RESOLUÇÃO
SELECT t.id, aulas.semana, aulas.diasemana , t.turnouc AS turnoUc, ROUND((aulas.num_presencas/tuc.cont)*100, 2)
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
    JOIN (SELECT t.id AS turnoId, t.turnouc , count(*) AS cont
        FROM ei_sad_proj_gisem.v_turnos t
            JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
        WHERE t.uc_id = 229
        GROUP BY t.id, t.turnouc) tuc ON (t.id = tuc.turnoId)
WHERE t.uc_id = 229;

SELECT t.id, t.turnouc , count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
WHERE t.uc_id = 229
GROUP BY t.id, t.turnouc;

--  2.4
SELECT t.id, t.turnouc , count(*)
FROM ei_sad_proj_gisem.v_turnos t
	JOIN ei_sad_proj_gisem.v_turno_user tu ON (t.id = tu.turno_id)
WHERE t.uc_id = 229
GROUP BY t.id, t.turnouc;

SELECT t.turnouc, ROUND(AVG(aulas.num_presencas), 0) AS "Media de Presencas"
FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
WHERE t.uc_id = 229
GROUP BY t.turnouc
;

--  2.6
SELECT turnoUc, MIN(numPresencas), MAX(numPresencas)
FROM (SELECT t.turnouc AS turnoUc, aulas.num_presencas AS numPresencas
        FROM ei_sad_proj_gisem.v_turnos t JOIN ei_sad_proj_gisem.v_aulas_semana aulas ON (t.id = aulas.turno_id)
        WHERE t.uc_id = 229)
GROUP BY turnoUc
ORDER BY 1
;