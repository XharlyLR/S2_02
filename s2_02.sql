USE universidad;

#26 ejercicios de Universidad en orden del primero al último

SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;

SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

SELECT * FROM persona WHERE tipo = 'alumno' AND (fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31');

SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre AS 'Nombre departamento' FROM persona pe JOIN profesor pr on pe.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id WHERE tipo = 'profesor' ORDER BY pe.apellido1, pe.apellido2, pe.nombre;

SELECT a.nombre AS 'Nombre asignatura', ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno JOIN asignatura a ON asma.id_asignatura = a.id JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE nif = '26902806M';

SELECT DISTINCT d.nombre FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

SELECT DISTINCT apellido1, apellido2, nombre FROM persona pe JOIN alumno_se_matricula_asignatura asma ON pe.id = asma.id_alumno JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE ce.anyo_inicio = '2018' AND ce.anyo_fin = '2019';

SELECT d.nombre AS 'Nombre departamento', pe.apellido1, pe.apellido2, pe.nombre FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id ORDER BY d.nombre, pe.apellido1, pe.apellido2, pe.nombre;

SELECT pe.apellido1, pe.apellido2, pe.nombre FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor WHERE pr.id_departamento IS NULL;

SELECT d.nombre AS 'Nombre departamento' FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE pr.id_profesor IS NULL;

SELECT pe.apellido1, pe.apellido2, pe.nombre FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;

SELECT a.nombre FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor RIGHT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

SELECT DISTINCT d.nombre AS 'Nombre departamento', asma.id_curso_escolar FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura WHERE asma.id_curso_escolar IS NULL AND d.nombre NOT IN (
	SELECT DISTINCT d.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura WHERE asma.id_curso_escolar IS NOT NULL);
    
SELECT COUNT(1) as 'Numero alumnos' FROM persona WHERE tipo = 'alumno';

SELECT COUNT(1) as 'Numero alumnos nacidos en 1999' FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

SELECT d.nombre AS 'Nombre departamento', COUNT(d.nombre) AS 'Numero de profesores' FROM departamento d JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(d.nombre) DESC;

SELECT d.nombre AS 'Nombre departamento', COUNT(pr.id_profesor) AS 'Numero de profesores' FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(pr.id_profesor) DESC;

SELECT g.nombre, COUNT(a.id) AS 'Numero de asignaturas' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY COUNT(a.id) DESC;

SELECT g.nombre, COUNT(a.id) AS 'Numero de asignaturas' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY COUNT(a.id) DESC;

SELECT g.nombre, a.tipo, SUM(a.creditos) FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;

SELECT ce.anyo_inicio, COUNT(DISTINCT(pe.id)) AS 'Nº alumnos' FROM persona pe JOIN alumno_se_matricula_asignatura asma ON pe.id = asma.id_alumno JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id GROUP BY ce.anyo_inicio;

SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) AS 'Nº asignaturas' FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor GROUP BY pe.id ORDER BY COUNT(a.id) DESC;

SELECT * FROM persona WHERE fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');

SELECT * FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;



USE tienda;

#Ejercicios de Tienda en orden descendente (del 41 al 31)

SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND precio > (SELECT AVG(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus');

SELECT * FROM producto p WHERE precio >= (SELECT MAX(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo');

SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' AND precio = (SELECT MIN(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard');

SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' AND precio = (SELECT MAX(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo');

SELECT * FROM producto p WHERE precio = (SELECT MAX(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo');

SELECT * FROM producto WHERE codigo_fabricante = 2;

SELECT * FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo IS NULL;

SELECT * FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;

SELECT DISTINCT f.codigo, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;

SELECT p.precio, p.nombre, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;

SELECT p.nombre, p.precio FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';