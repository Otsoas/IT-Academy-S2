
DROP DATABASE IF EXISTS pizzeria_ita;
CREATE DATABASE pizzeria_ita;
USE pizzeria_ita;
-- DROP TABLE producto;

CREATE TABLE provincia (
id_provincia INT NOT NULL AUTO_INCREMENT,
provincia VARCHAR(30) NOT NULL,
PRIMARY KEY (id_provincia)
);

CREATE TABLE localidad (
id_localidad INT NOT NULL AUTO_INCREMENT,
localidad VARCHAR(90) NOT NULL,
id_provincia1 INT NOT NULL,
PRIMARY KEY (id_localidad),
FOREIGN KEY (id_provincia1) REFERENCES provincia (id_provincia)
);

CREATE TABLE cliente (
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(60) NOT NULL,
apellido VARCHAR(75) NULL,    
telefono INT NOT NULL,
direccion VARCHAR(120) NULL,
numero INT NULL,
piso INT NULL,
puerta INT NULL,
codigo_postal INT NULL,
id_localidad1 INT NULL,    
PRIMARY KEY (id_cliente),
FOREIGN KEY (id_localidad1) REFERENCES localidad (id_localidad)
);

CREATE TABLE categoria_pizza (
id_categoria_pizza INT NOT NULL AUTO_INCREMENT,
nombre_pizza VARCHAR(60) NOT NULL,
PRIMARY KEY (id_categoria_pizza)
);

CREATE TABLE producto (
id_producto INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(55) NOT NULL,
tipo ENUM('pizza', 'hamburguesa', 'bebida') NOT NULL,
descripcion TEXT NULL,
imagen VARCHAR(80) NULL,
precio DECIMAL(6,2) NOT NULL,
id_categoria_pizza1 INT NULL,
PRIMARY KEY (id_producto),
FOREIGN KEY (id_categoria_pizza1) REFERENCES categoria_pizza (id_categoria_pizza)
);

CREATE TABLE  tienda (
id_tienda INT NOT NULL  AUTO_INCREMENT,
direccion VARCHAR(120) NULL,
codigo_postal INT NULL,
localidad VARCHAR(65) NULL,
provincia VARCHAR(65) NULL,
PRIMARY KEY (id_tienda)
);

CREATE TABLE empleado (
id_empleado INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(55) NOT NULL,
apellido VARCHAR(70),
nif INT,
telefono INT,
categoria_laboral ENUM('repartidor', 'chef') NOT NULL,
id_tienda1 INT NOT NULL,
PRIMARY KEY (id_empleado),
FOREIGN KEY (id_tienda1) REFERENCES tienda (id_tienda)
);

CREATE TABLE pedido (
id_pedido INT NOT NULL AUTO_INCREMENT,
fecha_hora_pedido DATETIME,
recogida ENUM('tienda', 'domicilio') NOT NULL,
precio_total DECIMAL(6,2) NOT NULL,
fecha_hora_entrega DATETIME NOT NULL,
id_empleado1 INT NULL,
id_cliente1 INT NOT NULL,
id_tienda1 INT NOT NULL,
PRIMARY KEY (id_pedido),
FOREIGN KEY (id_cliente1) REFERENCES cliente (id_cliente),
FOREIGN KEY (id_tienda1) REFERENCES tienda (id_tienda),
FOREIGN KEY (id_tienda1) REFERENCES tienda (id_tienda)
);

CREATE TABLE detalle_pedido (
id_producto1 INT NOT NULL,
id_pedido1 INT NOT NULL,
FOREIGN KEY (id_producto1) REFERENCES producto (id_producto),
FOREIGN KEY (id_pedido1) REFERENCES pedido (id_pedido)
);

INSERT INTO provincia (provincia) VALUES ("tarragona");
INSERT INTO provincia (provincia) VALUES ("barcelona");
INSERT INTO provincia (provincia) VALUES ("lleida");
INSERT INTO provincia (provincia) VALUES ("girona");

INSERT INTO localidad (localidad, id_provincia1)  VALUES ("valls", 1);
INSERT INTO localidad (localidad, id_provincia1)  VALUES ("cunit", 1);
INSERT INTO localidad (localidad, id_provincia1)  VALUES ("pals", 1);
INSERT INTO localidad (localidad, id_provincia1)  VALUES ("creixels", 1);
INSERT INTO localidad (localidad, id_provincia1)  VALUES ("roses", 4);
INSERT INTO localidad (localidad, id_provincia1)  VALUES ("viella", 3);
INSERT INTO localidad (localidad, id_provincia1)  VALUES ("llivia", 4);
INSERT INTO localidad (localidad, id_provincia1)  VALUES ("barcelona", 2);

INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1) 
	VALUES ("julia", "lopez", 682476159, "calle sierra", 4, 2, 3, 04257, 1);
INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1)
	VALUES ("pedro", "serra", 667651195, "Avenida playa", 7, 1, 3, 05456, 1);
INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1)
	VALUES ("jordi", "casals", 679514358, "calle puertas", 11, 2, 1, 06755, 1);
INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1)
	VALUES ("rita", "solsona", 655217468, "calle carpinteros", 1, 3, 4, 00048, 1);
INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1)
	VALUES ("felipe", "martinez", 648274291, "calle carpin", 2, 4, 5, 00748, 4);
INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1)
	VALUES ("alba", "pou", 655257470, "calle sierra", 3, 5, 6, 00548, 3);
INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1)
	VALUES ("judit", "sanchis", 657217471, "calle dantes", 4, 3, 4, 00648, 4);
INSERT INTO cliente (nombre, apellido, telefono, direccion, numero, piso, puerta, codigo_postal, id_localidad1)
	VALUES ("sergio", "llop", 655217923, "calle carpinteros", 5, 7, 1, 00352, 2);

INSERT INTO categoria_pizza (nombre_pizza) VALUES ("mediterranea");
INSERT INTO categoria_pizza (nombre_pizza) VALUES ("fuego");
INSERT INTO categoria_pizza (nombre_pizza) VALUES ("refrescante");
INSERT INTO categoria_pizza (nombre_pizza) VALUES ("eterea");
INSERT INTO categoria_pizza (nombre_pizza) VALUES ("aires lejanos");

INSERT INTO  producto (nombre, tipo, descripcion, precio, id_categoria_pizza1)
	VALUES ("pizza grande", "pizza", "queso, tomate, ingrediente temporada", 7.5, 1);  
INSERT INTO  producto (nombre, tipo, descripcion, precio, id_categoria_pizza1)
	VALUES ("pizza tuya", "pizza", "queso, tomate, ingrediente temporada, ingrediente cliente", 8.5, 4);  
INSERT INTO  producto (nombre, tipo, descripcion, precio)
	VALUES ("hamburguesa mediana", "hamburguesa", "cebolla, lechuga, carne, pepino, tomate", 8.75);
INSERT INTO  producto (nombre, tipo, descripcion, precio)
	VALUES ("hamburguesa grande", "hamburguesa", "cebolla, lechuga, carne, pepino, tomate", 10.25);
INSERT INTO  producto (nombre, tipo, descripcion, precio)
	VALUES ("cerveza", "bebida", "alcohol", 3);
INSERT INTO  producto (nombre, tipo, descripcion, precio)
	VALUES ("refresco", "bebida", "refresco", 2.9);
INSERT INTO  producto (nombre, tipo, descripcion, precio)
	VALUES ("agua", "bebida", "agua sin gas", 1.85);
INSERT INTO  producto (nombre, tipo, descripcion, precio)
	VALUES ("cafe", "bebida", "cafe solo", 1.15);
    
INSERT INTO tienda (direccion, codigo_postal, localidad, provincia)
	VALUES ("avenida grande", 06755, "besalu", "girona");
INSERT INTO tienda (direccion, codigo_postal, localidad, provincia)
	VALUES ("pasaje corto", 04257, "valls", "tarragona");
INSERT INTO tienda (direccion, codigo_postal, localidad, provincia)
	VALUES ("calle sinfín", 04258, "barcelona", "barcelona");

INSERT INTO empleado (nombre, apellido, nif, telefono, categoria_laboral, id_tienda1)
	VALUES ("pepe", "sanchez", 12345678, 666666666, "repartidor", 3);
INSERT INTO empleado (nombre, apellido, nif, telefono, categoria_laboral, id_tienda1)
	VALUES ("judit", "valls", 87654321, 666666666, "repartidor", 2);
INSERT INTO empleado (nombre, apellido, nif, telefono, categoria_laboral, id_tienda1)
	VALUES ("clara", "manz", 91234567, 644444444, "chef", 2);
INSERT INTO empleado (nombre, apellido, nif, telefono, categoria_laboral, id_tienda1)
	VALUES  ("sergio", "lup", 98765432, 633333333, "chef", 1);
INSERT INTO empleado (nombre, apellido, nif, telefono, categoria_laboral, id_tienda1)
	VALUES ("tomas", "soler", 65432198, 622222222, "repartidor", 2);

INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-06-04 11:11:11", "tienda", 24.67, "2021-06-24 10:00:00", 5, 7, 1);
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-05-30 23:58:01", "domicilio", 33.44, "2021-06-05 12:22:00", 5, 4, 1);
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-05-30 22:45:00", "tienda", 55.07, "2021-07-01 18:45:00", 1, 6, 1);
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-06-26 18:15:48", "tienda", 15.55, "2021-06-27 09:15:00", 2, 1, 3);
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-06-27 19:55:39", "domicilio", 44.44, "2021-06-27 22:54:00", 1, 7, 1);    
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-05-20 11:27-55", "domicilio", 10.75, "2021-05-22 17:33:33", 1, 5, 2);    
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-05-27 23:35:00", "tienda", 8.61, "2021-05-28 07:48:00", 1, 2, 2);    
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-06-08 06:58:00", "tienda", 29.52, "2021-06-09 07:49:00", 5, 4, 1);
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-06-17 11:37:00", "domicilio", 47.07, "2021-06-17 16:00:00", 5, 4, 1);    
INSERT INTO pedido (fecha_hora_pedido, recogida, precio_total, fecha_hora_entrega, id_empleado1, id_cliente1, id_tienda1)
	VALUES ("2021-06-22 20:04:00", "tienda", 38.21, "2021-06-22 21:27:00", 2, 3, 2);
    
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (1, 1);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (4, 7);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (7, 1);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (8, 2);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (6, 6);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (5, 2);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (2, 10);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (4, 2);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (3, 3);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (1, 4);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (5, 4);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (2, 5);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (6, 8);
INSERT INTO detalle_pedido (id_producto1, id_pedido1) VALUES (5, 5);
    
-- QUERY
-- Llista quants productes de categoria 'Begudas' s'han venut en una determinada localitat
SELECT pedido.id_tienda1, producto.tipo 
	FROM pedido 
	LEFT JOIN tienda ON pedido.id_cliente1 = tienda.id_tienda
    LEFT JOIN detalle_pedido ON pedido.id_pedido = detalle_pedido.id_pedido1
    LEFT JOIN producto ON detalle_pedido.id_producto1 = producto.id_producto
    WHERE producto.tipo = 'bebida' AND pedido.id_tienda1 = 2;
    

-- Llista quantes comandes ha efectuat un determinat empleat
SELECT id_pedido FROM pedido WHERE id_empleado1 = 5;