DROP DATABASE IF EXISTS optica_ita;
CREATE DATABASE optica_ita;
USE optica_ita;
-- SELECT id_cliente1, fecha_venta FROM gafa;
-- SHOW TABLES;


CREATE TABLE proveedor ( 
id_proveedor int NOT NULL AUTO_INCREMENT, 
nombre_proveedor VARCHAR(90) NOT NULL, 
telefono int NOT NULL, 
fax int NULL, 
direccion VARCHAR(120) NOT NULL, 
numero int NOT NULL, 
puerta int NULL, 
piso int NULL, 
ciudad VARCHAR(65), 
codigo_postal INT NOT NULL, 
PRIMARY KEY (id_proveedor));

CREATE TABLE empleado (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre_empleado VARCHAR(55) NOT NULL,
    PRIMARY KEY (id_empleado)
);

CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(45) NOT NULL,
    apellido_cliente VARCHAR(45) NOT NULL,
    mail VARCHAR(75) NULL,
    telefono INT NOT NULL,
    recomendacion INT,
    fecha_registro DATE,
    direccion VARCHAR(120) NOT NULL,
    numero INT NOT NULL,
    puerta INT NULL,
    piso INT NULL,
    ciudad VARCHAR(65),
    codigo_postal INT NOT NULL,
    PRIMARY KEY (id_cliente),
    FOREIGN KEY (recomendacion)
        REFERENCES cliente (id_cliente)
);

CREATE TABLE gafa (
id_numero_factura INT NOT NULL AUTO_INCREMENT,
marca VARCHAR(60) NOT NULL,
precio DECIMAL(6,2) NOT NULL,
montura VARCHAR(15) NOT NULL,
color_montura VARCHAR(25) NOT NULL,
color_vidrio VARCHAR(40) NOT NULL,
graduacion_derecha DECIMAL(4,2) NOT NULL,
graduacion_izquierda DECIMAL(4,2) NOT NULL,
fecha_venta DATE,
id_cliente1 INT NOT NULL,
id_proveedor1 INT NOT NULL,
id_empleado1 INT NOT NULL,
PRIMARY KEY (id_numero_factura),
FOREIGN KEY (id_cliente1) REFERENCES cliente (id_cliente),
FOREIGN KEY (id_proveedor1) REFERENCES proveedor (id_proveedor),
FOREIGN KEY (id_empleado1) REFERENCES empleado (id_empleado)
);


ALTER TABLE proveedor ADD nif INT AFTER fax;


INSERT INTO empleado (nombre_empleado) VALUES ("pepe");
INSERT INTO empleado (nombre_empleado) VALUES ("judit");
INSERT INTO empleado (nombre_empleado) VALUES ("clara");

INSERT INTO proveedor (nombre_proveedor, telefono, fax, direccion, numero, ciudad, codigo_postal) VALUES ("gafas infinitas", 679245424, 984546424, "poligono tuercas", 1, "albacete", 05785);
INSERT INTO proveedor (nombre_proveedor, telefono, fax, direccion, numero, ciudad, codigo_postal) VALUES ("vision lejana", 946057516, 946057516, "poligono tuercas", 17, "albacete", 05785);
UPDATE proveedor SET nombre_proveedor = 'vision lejana', telefono = '946057516', fax ='946057516', numero ='17' WHERE id_proveedor=2;
INSERT INTO proveedor (nombre_proveedor, telefono, fax, direccion, numero, ciudad, codigo_postal) VALUES ("anadistribucion", 956544457, 956544457, "calle  lupa", 35, "leon", 89412);

UPDATE optica_ita.proveedor SET nif = '548634876' WHERE (id_proveedor = 1);
UPDATE optica_ita.proveedor SET nif = '524853145' WHERE (id_proveedor = 2);
UPDATE optica_ita.proveedor SET nif = '811547714' WHERE (id_proveedor = 3);

INSERT INTO cliente (nombre_cliente, apellido_cliente, mail, telefono, fecha_registro, direccion, numero, piso, puerta, ciudad, codigo_postal) VALUES ("julia", "lopez", "info@yahoo.es", 682476159, "2021-01-18", "calle sierra", 4, 2, 3, "girona", 04257);
INSERT INTO optica_ita.cliente (nombre_cliente, apellido_cliente, mail, telefono, recomendacion, fecha_registro, direccion, numero, piso, puerta, ciudad, codigo_postal) VALUES ("pedro", "serra", "info@hotmail.com", 667651195, 1, "2021-01-19", "Avenida playa", 7, 1, 3, "girona", 05456);
INSERT INTO cliente (nombre_cliente, apellido_cliente, mail, telefono, recomendacion, fecha_registro, direccion, numero, piso, puerta, ciudad, codigo_postal) VALUES ("jordi", "casals", "info@yahoo.com", 679514358, 1, "2021-01-20", "calle puertas", 11, 2, 1, "girona",06755);
INSERT INTO optica_ita.cliente (nombre_cliente, apellido_cliente, mail, telefono, recomendacion, fecha_registro, direccion, numero, piso, puerta, ciudad, codigo_postal) VALUES ("rita", "solsona", "info@gmail.com", 655217468, 3, "2021-01-21", "calle carpinteros", 1, 3, 4, "girona", 00048);

INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('rinon', 110, 'metalica', 'berenjena', 'transparente', 0.5, 0.5, '2021-02-22', 1, 1, 3); 
INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('vision', 75.8, 'pasta', 'azul', 'transparente', 0, 0.5, '2021-03-27', 2, 1, 2); 
INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('police', 153.27, 'metalica', 'naranja', 'transparente', 0.25, 0.25, '2021-03-17', 3, 2, 3); 
INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('luz', 88, 'flotante', 'transparente', 'transparente', 1.25, 0.75, '2021-03-29', 4, 3, 1); 
INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('buton', 97.22, 'pasta', 'negra', 'oscuro', 0.75, 0.75, '2021-04-17', 1, 2, 3); 
INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('rinon', 110, 'metalica', 'berenjena', 'transparente', 0.5, 0.5, '2021-02-22', 3, 1, 3); 
INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('luz', 88, 'flotante', 'transparente', 'transparente', 1.5, 0.5, '2021-02-22', 4, 3, 2); 
INSERT INTO gafa (marca, precio, montura, color_montura, color_vidrio, graduacion_derecha, graduacion_izquierda, fecha_venta, id_cliente1, id_proveedor1, id_empleado1) VALUES ('luz', 88, 'flotante', 'transparente', 'transparente', 0.5, 0.5, '2021-02-15', 4, 3, 2); 

-- QUERY
-- Llista el total de factures d'un client en un període determinat
SELECT id_numero_factura, id_cliente1 = 4 
	FROM gafa 
    WHERE fecha_venta 
    BETWEEN '2021-02-01' AND '2021-02-28';

-- Llista els diferents models d'ulleres que ha venut un empleat durant un any
SELECT marca, id_empleado1 = 2 FROM gafa WHERE fecha_venta BETWEEN '2021-01-01' AND '2021-12-31';
SELECT marca, id_empleado1 = 3 FROM gafa WHERE  YEAR(fecha_venta) = '2021';

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
SELECT id_numero_factura, id_proveedor1 FROM gafa;
-- Hacer que salga tambien nombre de proveedores
SELECT gafa.id_numero_factura, gafa.id_proveedor1, proveedor.nombre_proveedor FROM gafa 
	LEFT JOIN proveedor ON gafa.id_proveedor1 = proveedor.id_proveedor;
-- Hacer que no se repita los proveedores
SELECT gafa.id_numero_factura, gafa.id_proveedor1, proveedor.nombre_proveedor FROM gafa 
	LEFT JOIN proveedor ON gafa.id_proveedor1 = proveedor.id_proveedor
	GROUP BY (proveedor.nombre_proveedor);