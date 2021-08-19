

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- QUERIES
-- Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre, precio FROM producto;

-- Llista totes les columnes de la taula producto.
SELECT * FROM producto;

-- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).
SELECT nombre, precio, (precio*0.85) AS precio_euros FROM producto;

-- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). 
-- Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
SELECT nombre AS 'nom de producto', precio AS euros, ROUND(precio*0.85) AS dolars FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;

-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, CONCAT(UPPER(LEFT(nombre, 2)), lower(substring(nombre,3))) FROM fabricante;

-- Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) FROM producto;

-- Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT codigo_fabricante FROM producto;

-- Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante FROM producto;

-- Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre;

-- Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre; DESC;

-- Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT DISTINCT nombre, precio FROM producto ORDER BY nombre, precio DESC;

-- Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT DISTINCT * FROM fabricante LIMIT 5;

-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT DISTINCT * FROM fabricante LIMIT 3,2;

-- Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1; 

-- Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo; 

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre; 

-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades. 
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo; 

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;

-- Retorna una llista de tots els productes del fabricador Lenovo.
SELECT * FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT * FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'CRUCIAL' AND p.precio > 200;

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
SELECT * FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%e";

-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%w%";

-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
SELECT p.nombre, p.precio, f.nombre AS 'fabricante' FROM producto AS p JOIN fabricante AS f ON p.codigo_fabricante = f.codigo  WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre;

-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT  producto.codigo_fabricante, fabricante.nombre FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
    
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT fabricante.nombre, producto.nombre FROM fabricante 
    LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat
SELECT fabricante.nombre FROM fabricante
	LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
    WHERE producto.codigo_fabricante IS NULL;
    
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre="Lenovo");
/* SELECT producto.nombre FROM producto, fabricante WHERE fabricante.nombre = 'Lenovo';*/

-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
SELECT * FROM producto AS p WHERE p.precio = (SELECT MAX(p.precio) FROM producto AS p WHERE p.codigo_fabricante IN (SELECT f.codigo FROM fabricante AS f WHERE f.nombre = 'Lenovo'));

-- Llista el nom del producte més car del fabricador Lenovo.
SELECT p.nombre FROM producto AS p JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
/* SELECT * FROM producto AS p WHERE p.precio >= (SELECT max(p.precio) FROM producto AS p JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo');
*/

-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.nombre FROM producto AS p JOIN fabricante as f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;

-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
SELECT nombre FROM producto WHERE precio >= (SELECT p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1) AND codigo_fabricante <> (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

/* SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre="Lenovo")); */

-- Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(precio) FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus');