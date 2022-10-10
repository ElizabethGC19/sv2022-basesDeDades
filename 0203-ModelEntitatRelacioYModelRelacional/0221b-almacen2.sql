.open almacen2

--Modelo relacional

--articulos(codigo,nombre)
--CP: codigo

--piezas(codigo,nombre)
--CP: codigo

--contiene (codigo_articulo,codigo_pieza, cantidad)
--CP:codigo_articulo, codigo_pieza
--CAj: codigo_articulo --> articulos
--CAj: codigo_pieza --> piezas

CREATE TABLE articulos (
    codigo VARCHAR (5) PRIMARY KEY, 
    nombre VARCHAR (60));
    
CREATE TABLE piezas (
    codigo VARCHAR (5) PRIMARY KEY, 
    nombre VARCHAR (60));

CREATE TABLE contiene (
    codigo_articulo VARCHAR (5), 
    codigo_pieza VARCHAR (5),
    cantidad NUMERIC(2), 
    
    PRIMARY KEY (codigo_articulo, codigo_pieza),
    FOREIGN KEY (codigo_articulo) REFERENCES articulos(codigo),
    FOREIGN KEY (codigo_pieza) REFERENCES piezas(codigo)
);

INSERT INTO articulos VALUES ("HP","Portatil HP");
INSERT INTO articulos VALUES ("LEN","Portatil Lenovo");
INSERT INTO articulos VALUES ("ASU","Portatil ASUS");

INSERT INTO piezas VALUES ("1","Procesador AMD");
INSERT INTO piezas VALUES ("2","Procesador INTEL");
INSERT INTO piezas VALUES ("3","Grafica NVIDIA");

INSERT INTO contiene VALUES ("HP","1", 1);
INSERT INTO contiene VALUES ("HP","3", 1);
INSERT INTO contiene VALUES ("LEN","2", 2);
INSERT INTO contiene VALUES ("Asu","2", 1);
INSERT INTO contiene VALUES ("Asu","1", 10);

SELECT articulos.nombre, piezas.nombre, cantidad
FROM articulos, piezas, contiene 
WHERE contiene.codigo_articulo = articulos.codigo 
AND contiene.codigo_pieza = piezas.codigo;

-- nombre           nombre            cantidad
-- ---------------  ----------------  --------
-- Portatil HP      Procesador AMD    1
-- Portatil HP      Grafica NVIDIA    1
-- Portatil Lenovo  Procesador INTEL  2
