CREATE SCHEMA IF NOT EXISTS EXAMEN_PRETEL;
USE EXAMEN_PRETEL;

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
    DNI INT, 
    localidad VARCHAR(255), 
    Direccion_cl VARCHAR(255), 
    Tipo_cliente VARCHAR(255), 
    Email VARCHAR(255), 
    Nombre_cliente VARCHAR(255),
    Apellidos VARCHAR(255), 
    Telefonos VARCHAR(255)
);

INSERT INTO Cliente (DNI, localidad, Direccion_cl, Tipo_cliente, Email, Nombre_cliente, Apellidos, Telefonos)
VALUES
(72382134, 'Chimbote', 'Av. Brasil', 'Frecuente', 'patri@hotmail.com', 'Patricio', 'Solorzano Quispe', '964562345'),
(83721853, 'Nuevo Chimbote', 'Av. Argentina', 'Frecuente', 'Carlo5@hotmail.com', 'Carlos', 'Conqui Mamani', '962345764'),
(72382134, 'Chimbote', 'Av. America', 'Frecuente', 'Antonio20@hotmail.com', 'Antonio', 'García Lu', '941245424');

DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto (
    Nombre_producto VARCHAR(255),
    Descripcion VARCHAR(255),
    Tamaño_producto DECIMAL(5, 2),
    Tipo_papel VARCHAR(255),
    Impresion VARCHAR(255),
    Acabado VARCHAR(255)
);


INSERT INTO Producto (Nombre_producto, Descripcion, Tamaño_producto, Tipo_papel, Impresion, Acabado)
VALUES 
('Papel Fotográfico', 'Es un papel para imprimir fotos', 27.5, 'Fotografico', 'A4', 'Fino'),
('Papel Folcote', 'Es un papel rigido tipo carton', 30, 'Folcote', 'A3', 'Grueso'),
('Papel Bond', 'Es un papel en blanco', 27.5, 'Bond', 'A4', 'Fino');

DROP TABLE IF EXISTS Departamento;
CREATE TABLE Departamento (
    Nombre_departamento VARCHAR(255), 
    Email VARCHAR(255)
);

INSERT INTO Departamento (Nombre_departamento, Email)
VALUES
('Ancash', 'EmpresaAncash@gmail.com'),
('Lima', 'EmpresaLima@gmail.com'),
('Trujillo', 'EmpresaTrujillo@gmail.com');

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
    DNI INT, 
    nombre VARCHAR(255), 
    apellidos VARCHAR(255), 
    email VARCHAR(255), 
    Telefonos VARCHAR(255), 
    Direccion_emp VARCHAR(255), 
    Salario DECIMAL(5, 2),
    Nombre_departamento VARCHAR(255),
    FOREIGN KEY (Nombre_departamento) REFERENCES Departamento(Nombre_departamento)
);

INSERT INTO Empleado (DNI, nombre, apellidos, email, Telefonos, Direccion_emp, Salario, Nombre_departamento)
VALUES
(65372134, 'Esteban', 'Sevat Cano', 'Sti@gmail.com', '957346334', 'Av. Lituania', 99.2, 'Ancash'),
(65962367, 'Mateo', 'Vera Lopez', 'Mati@gmail.com', '957859431', 'Av. Panchos', 60.5, 'Lima'),
(71238582, 'Ana', 'Vega Honores', 'Ana2020@gmail.com', '973891550', 'Av. Lituania', 90.5, 'Ancash');

DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura (
    Nfactura INT,
    Nombre_cliente VARCHAR(255),
    Nombre_producto VARCHAR(255), 
    pago DECIMAL(5, 2), 
    importe DECIMAL(5, 2), 
    envio VARCHAR(255),
    FOREIGN KEY (Nombre_cliente) REFERENCES Cliente(Nombre_cliente),
    FOREIGN KEY (Nombre_producto) REFERENCES Producto(Nombre_producto)
);

INSERT INTO Factura (Nfactura, Nombre_cliente, Nombre_producto, pago, importe, envio)
VALUES
(1, 'Carlos', 'Papel Fotográfico', 40.90, 40.90, 'Recojo en tienda'),
(2, 'Antonio', 'Papel Folcote', 14.00, 13.99, 'Recojo en tienda'),
(3, 'Patricio', 'Papel Bond', 10.00, 8.00, 'Recojo en tienda');

COMMIT;
